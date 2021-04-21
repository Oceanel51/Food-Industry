if not util then require("prototypes.scripts.util") end

local fish_inserter = {}
fish_inserter.metatable = {__index = fish_inserter}

local fishingDistance = 10
local catchDistance = 5

function fish_inserter.new(entity, parameter)

  local force = entity.force
  local surface = entity.surface

  local position = entity.position
  local force = entity.force
  local surface = entity.surface

  local farm =
  {
    entity = entity,
    index = tostring(entity.unit_number),

    -- count_per_min = parameter.count_per_min, 
    -- max_fish_around = parameter.max_fish_around, 
    -- name = parameter.name,
    -- eggName = parameter.eggName
  }

  setmetatable(farm, fish_inserter.metatable)

  return farm

end

function fish_inserter:try_pickup_fish_at_position(entity)

  local inserter = self.entity

	if #inserter.held_stack == 0 and distance(inserter.position.x,inserter.position.y,entity.position.x,entity.position.y) <= fishingDistance then
		inserter.pickup_position = {
			x = entity.position.x,
			y = entity.position.y
		}
		inserter.direction = inserter.direction
		if distance(inserter.held_stack_position.x,inserter.held_stack_position.y,entity.position.x,entity.position.y) <= catchDistance then
			if entity.prototype.mineable_properties.products ~= nil then
				for _, r in ipairs(entity.prototype.mineable_properties.products) do
					inserter.held_stack.set_stack({name=r.name, count=1})
					break
				end
			end
			entity.destroy()
		end
	end
end

function fish_inserter:update()
  
  local entity = self.entity
	if entity.held_stack.valid_for_read then
		if entity.held_stack.count > 0 then
			return
		end
	end

	if entity.energy == 0 then
		return
	end

	local fish = get_entities_around_by_name(entity, 10, { "fish", "fi-sturgeon" })
	local target = nil
	local current_dist = 0
	local target_dist = 100
	if fish ~= nil then
		for i, ent in pairs(fish) do
      local dist = distance(entity.held_stack_position.x, entity.held_stack_position.y, ent.position.x, ent.position.y)
      if dist > current_dist then
        current_dist = dist
      end
      if dist < target_dist then
        target_dist = dist
        target = ent
      end
		end
	end
	if target then	
		self:try_pickup_fish_at_position(target)
	end

end

function fish_inserter:say(string)
  self.entity.surface.create_entity{name = "tutorial-flying-text", position = self.entity.position, text = string}
end

function fish_inserter:on_removed(event)
  if event.name == defines.events.on_entity_died then
    self.entity.destroy()
  else
  end
end

function fish_inserter:on_config_changed()
end

return fish_inserter