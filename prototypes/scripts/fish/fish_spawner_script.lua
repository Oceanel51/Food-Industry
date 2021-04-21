if not util then require("prototypes.scripts.util") end

local spawner = {}
spawner.metatable = {__index = spawner}

function spawner.new(entity, parameter)

  local force = entity.force
  local surface = entity.surface

  local position = entity.position
  local force = entity.force
  local surface = entity.surface

  local farm =
  {
    entity = entity,
    index = tostring(entity.unit_number),

    count_per_min = parameter.count_per_min, 
    max_fish_around = parameter.max_fish_around, 
    name = parameter.name,
    eggName = parameter.eggName
  }

  setmetatable(farm, spawner.metatable)

  return farm

end

function spawner:spawn_fish()
  
  local fishDistance = 10
	local maxFishCounts = 10

  local eggCount = self.entity.get_output_inventory().get_item_count(self.eggName)
  if eggCount == 0 then
    return
  end

	local fish = get_entities_around(self.entity, fishDistance, self.name)
  local fish_count = #fish

  if fish_count < self.max_fish_around then
    self.entity.surface.create_entity({name=self.name, amount=self.count_per_min, position=self.entity.position})

    self.entity.get_output_inventory().remove({ name = self.eggName })
  end
end

function spawner:update()
  
  if self.entity.valid and not self.entity.to_be_deconstructed(self.entity.force) then
    self:spawn_fish()
  end

end

function spawner:say(string)
  self.entity.surface.create_entity{name = "tutorial-flying-text", position = self.entity.position, text = string}
end

function spawner:on_removed(event)
  if event.name == defines.events.on_entity_died then
    self.entity.destroy()
  else
  end
end

function spawner:on_config_changed()
end

return spawner