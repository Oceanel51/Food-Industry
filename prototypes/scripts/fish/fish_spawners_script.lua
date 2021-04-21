local spawner_libs = {}

local required_interfaces = {
  metatable = "table",
  new = "function",
  on_removed = "function",
  update = "function"
}

local add_spawner_lib = function(entity_name, lib, parameters)
  for name, value_type in pairs(required_interfaces) do
    if not lib[name] or type(lib[name]) ~= value_type then
      error(
        "Trying to add lib without all required interfaces: " ..
          serpent.block(
            {
              entity_name = entity_name,
              missing_value_key = name,
              value_type = type(lib[name]),
              expected_type = value_type
            }
          )
      )
    end
  end
  spawner_libs[entity_name] = {lib = lib, parameters = parameters } 
end

add_spawner_lib("fish-farm", require("prototypes/scripts/fish/fish_spawner_script"), {count_per_min=1, max_fish_around=10, name="fish", eggName="fi-fish-egg"})
add_spawner_lib("sturgeon-farm", require("prototypes/scripts/fish/fish_spawner_script"), {count_per_min=1, max_fish_around=4, name="fi-sturgeon", eggName="fi-sturgeon-egg"})

local script_data = {
  spawners = {},
  update_buckets = {},
  reset_to_be_taken_again = true,
  refresh_techs = true,
  update_rate = 60
}

local get_spawner_by_index = function(index)
  return script_data.spawners[index]
end

local get_spawner = function(entity)
  return get_spawner_by_index(tostring(entity.unit_number))
end

local big = math.huge
local insert = table.insert
local add_to_update_bucket = function(index)
  local best_bucket
  local best_count = big
  local buckets = script_data.update_buckets
  for k = 1, script_data.update_rate do
    local bucket_index = k % script_data.update_rate
    local bucket = buckets[bucket_index]
    if not bucket then
      bucket = {}
      buckets[bucket_index] = bucket
      best_bucket = bucket
      best_count = 0
      break
    end
    local size = #bucket
    if size < best_count then
      best_bucket = bucket
      best_count = size
    end
  end
  best_bucket[best_count + 1] = index
end

local on_created_entity = function(event)
  local entity = event.entity or event.created_entity
  if not (entity and entity.valid) then
    return
  end

  local name = entity.name

  local spawner_lib = spawner_libs[name]
  if not spawner_lib then
    return
  end

  local spawner = spawner_lib.lib.new(entity, spawner_lib.parameters)
  script.register_on_entity_destroyed(entity)
  spawner.surface_index = entity.surface.index
  script_data.spawners[spawner.index] = spawner
  add_to_update_bucket(spawner.index)
end

local remove_spawner = function(spawner, event)
  -- local surface = spawner.surface_index
  local index = spawner.index
  -- local x, y = spawner.node_position[1], spawner.node_position[2]
  -- remove_spawner_from_node(surface, x, y, index)
  script_data.spawners[index] = nil
  spawner:on_removed(event)
end

local on_entity_removed = function(event)
  local entity = event.entity

  if not (entity and entity.valid) then
    return
  end

  local spawner = get_spawner(entity)
  if spawner then
    remove_spawner(spawner, event)
  end
end

local on_entity_destroyed = function(event)
  local unit_number = event.unit_number
  if not unit_number then
    return
  end

  local spawner = get_spawner_by_index(tostring(unit_number))
  if spawner then
    remove_spawner(spawner, event)
  end
end

local get_lib = function(spawner)
  local name = spawner.entity.name
  return spawner_libs[name]
end

local load_spawner = function(spawner)
  local lib = get_lib(spawner).lib
  if lib and lib.metatable then
    setmetatable(spawner, lib.metatable)
  end
end

local update_spawners = function(tick)
  local bucket_index = tick % script_data.update_rate
  local update_list = script_data.update_buckets[bucket_index]
  if not update_list then
    return
  end

  local spawners = script_data.spawners

  local k = 1
  while true do
    local spawner_index = update_list[k]
    if not spawner_index then
      return
    end
    local spawner = spawners[spawner_index]
    if not (spawner and spawner.entity.valid) then
      spawners[spawner_index] = nil
      local last = #update_list
      if k == last then
        update_list[k] = nil
      else
        update_list[k], update_list[last] = update_list[last], nil
      end
    else
      spawner:update()
      k = k + 1
    end
  end
end

local on_tick = function(event)
  update_spawners(event.tick)
end

local setup_lib_values = function()
  for k, lib in pairs(spawner_libs) do
    lib.get_spawner = get_spawner_by_index
  end
end

local insert = table.insert
local refresh_update_buckets = function()
  local count = 1
  local interval = script_data.update_rate
  local buckets = {}
  for index, spawner in pairs(script_data.spawners) do
    local bucket_index = count % interval
    buckets[bucket_index] = buckets[bucket_index] or {}
    insert(buckets[bucket_index], index)
    count = count + 1
  end
  script_data.update_buckets = buckets
end

local refresh_update_rate = function()
  local update_rate = 60 -- settings.global["transport-vehicle-update-interval"].value
  if script_data.update_rate == update_rate then
    return
  end
  script_data.update_rate = update_rate
  refresh_update_buckets()
  --game.print(script_data.update_rate)
end

local on_runtime_mod_setting_changed = function(event)
  refresh_update_rate()
end

local lib = {}

lib.events = {
  [defines.events.on_built_entity] = on_created_entity,
  [defines.events.on_robot_built_entity] = on_created_entity,
  [defines.events.script_raised_built] = on_created_entity,
  [defines.events.script_raised_revive] = on_created_entity,
  [defines.events.on_entity_died] = on_entity_removed,
  [defines.events.on_robot_mined_entity] = on_entity_removed,
  [defines.events.script_raised_destroy] = on_entity_removed,
  [defines.events.on_player_mined_entity] = on_entity_removed,
  [defines.events.on_entity_destroyed] = on_entity_destroyed,
  [defines.events.on_tick] = on_tick,
  [defines.events.on_runtime_mod_setting_changed] = on_runtime_mod_setting_changed
}

lib.on_init = function()
  global.transport_spawners = global.transport_spawners or script_data
  setup_lib_values()
  refresh_update_rate()
end

lib.on_load = function()
  script_data = global.transport_spawners or script_data
  setup_lib_values()
  for k, spawner in pairs(script_data.spawners) do
    load_spawner(spawner)
  end
end

lib.on_configuration_changed = function()
  global.transport_spawners = global.transport_spawners or script_data

  for k, spawner in pairs(script_data.spawners) do
    if not spawner.entity.valid then
      script_data.spawners[k] = nil
    else
      script.register_on_entity_destroyed(spawner.entity)
      spawner.surface_index = spawner.entity.surface.index
      if spawner.on_config_changed then
        spawner:on_config_changed()
      end
    end
  end

  if not script_data.refresh_techs then
    script_data.refresh_techs = true
    for k, force in pairs(game.forces) do
      force.reset_technology_effects()
    end
  end

  refresh_update_rate()
end

lib.get_spawner = function(entity)
  return script_data.spawners[tostring(entity.unit_number)]
end

lib.get_spawner_by_index = get_spawner_by_index

return lib
