local cattle_grabber_libs = {}

local required_interfaces = {
  metatable = "table",
  new = "function",
  on_removed = "function",
  update = "function"
}

local add_cattle_grabber_lib = function(entity_name, lib, parameters)
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
  cattle_grabber_libs[entity_name] = {lib = lib, parameters = parameters } 
end

add_cattle_grabber_lib("cattle-grabber", require("prototypes/scripts/cattle/cattle_grabber_script"))

local script_data = {
  cattle_grabbers = {},
  update_buckets = {},
  reset_to_be_taken_again = true,
  refresh_techs = true,
  update_rate = 60
}

local get_cattle_grabber_by_index = function(index)
  return script_data.cattle_grabbers[index]
end

local get_cattle_grabber = function(entity)
  return get_cattle_grabber_by_index(tostring(entity.unit_number))
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

  local cattle_grabber_lib = cattle_grabber_libs[name]
  if not cattle_grabber_lib then
    return
  end

  local cattle_grabber = cattle_grabber_lib.lib.new(entity, cattle_grabber_lib.parameters)
  script.register_on_entity_destroyed(entity)
  cattle_grabber.surface_index = entity.surface.index
  script_data.cattle_grabbers[cattle_grabber.index] = cattle_grabber
  add_to_update_bucket(cattle_grabber.index)
end

local remove_cattle_grabber = function(cattle_grabber, event)
  -- local surface = cattle_grabber.surface_index
  local index = cattle_grabber.index
  -- local x, y = cattle_grabber.node_position[1], cattle_grabber.node_position[2]
  -- remove_cattle_grabber_from_node(surface, x, y, index)
  script_data.cattle_grabbers[index] = nil
  cattle_grabber:on_removed(event)
end

local on_entity_removed = function(event)
  local entity = event.entity

  if not (entity and entity.valid) then
    return
  end

  local cattle_grabber = get_cattle_grabber(entity)
  if cattle_grabber then
    remove_cattle_grabber(cattle_grabber, event)
  end
end

local on_entity_destroyed = function(event)
  local unit_number = event.unit_number
  if not unit_number then
    return
  end

  local cattle_grabber = get_cattle_grabber_by_index(tostring(unit_number))
  if cattle_grabber then
    remove_cattle_grabber(cattle_grabber, event)
  end
end

local get_lib = function(cattle_grabber)
  local name = cattle_grabber.entity.name
  return cattle_grabber_libs[name]
end

local load_cattle_grabber = function(cattle_grabber)
  local lib = get_lib(cattle_grabber).lib
  if lib and lib.metatable then
    setmetatable(cattle_grabber, lib.metatable)
  end
end

local update_cattle_grabbers = function(tick)
  local bucket_index = tick % script_data.update_rate
  local update_list = script_data.update_buckets[bucket_index]
  if not update_list then
    return
  end

  local cattle_grabbers = script_data.cattle_grabbers

  local k = 1
  while true do
    local cattle_grabber_index = update_list[k]
    if not cattle_grabber_index then
      return
    end
    local cattle_grabber = cattle_grabbers[cattle_grabber_index]
    if not (cattle_grabber and cattle_grabber.entity.valid) then
      cattle_grabbers[cattle_grabber_index] = nil
      local last = #update_list
      if k == last then
        update_list[k] = nil
      else
        update_list[k], update_list[last] = update_list[last], nil
      end
    else
      cattle_grabber:update()
      k = k + 1
    end
  end
end

local on_tick = function(event)
  update_cattle_grabbers(event.tick)
end

local setup_lib_values = function()
  for k, lib in pairs(cattle_grabber_libs) do
    lib.get_cattle_grabber = get_cattle_grabber_by_index
  end
end

local insert = table.insert
local refresh_update_buckets = function()
  local count = 1
  local interval = script_data.update_rate
  local buckets = {}
  for index, cattle_grabber in pairs(script_data.cattle_grabbers) do
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
  global.transport_cattle_grabbers = global.transport_cattle_grabbers or script_data
  setup_lib_values()
  refresh_update_rate()
end

lib.on_load = function()
  script_data = global.transport_cattle_grabbers or script_data
  setup_lib_values()
  for k, cattle_grabber in pairs(script_data.cattle_grabbers) do
    load_cattle_grabber(cattle_grabber)
  end
end

lib.on_configuration_changed = function()
  global.transport_cattle_grabbers = global.transport_cattle_grabbers or script_data

  for k, cattle_grabber in pairs(script_data.cattle_grabbers) do
    if not cattle_grabber.entity.valid then
      script_data.cattle_grabbers[k] = nil
    else
      script.register_on_entity_destroyed(cattle_grabber.entity)
      cattle_grabber.surface_index = cattle_grabber.entity.surface.index
      if cattle_grabber.on_config_changed then
        cattle_grabber:on_config_changed()
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

lib.get_cattle_grabber = function(entity)
  return script_data.cattle_grabbers[tostring(entity.unit_number)]
end

lib.get_cattle_grabber_by_index = get_cattle_grabber_by_index

return lib
