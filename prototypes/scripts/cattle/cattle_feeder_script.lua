if not util then require("prototypes.scripts.util") end

local cattle_feeder = {}
cattle_feeder.metatable = {__index = cattle_feeder}

local feedRange = 10
local feedCalf  = 100

function cattle_feeder.new(entity, parameter)

  local force = entity.force
  local surface = entity.surface

  local position = entity.position
  local force = entity.force
  local surface = entity.surface

  local farm =
  {
    entity = entity,
	index = tostring(entity.unit_number),
	
	cattle = parameter.cattle
  }

  setmetatable(farm, cattle_feeder.metatable)

  return farm

end


function cattle_feeder:cattle_feeder_process()

	local entity = self.entity
    local p = entity.position
    local range = feedRange
    local calfs = entity.surface.find_entities_filtered{ area={left_top = {p.x - range, p.y - range}, right_bottom = {p.x + range, p.y + range}}, name = "cattle-calf" }
    local inventory = entity.get_output_inventory()

	if inventory.get_item_count("fi-cattle-feed") > 0 then
		for i, ent in pairs(calfs) do
			if ent.valid then
				if inventory.get_item_count("fi-cattle-feed") > 0 then
					local calf = self.cattle[entity.unit_number]
					if calf == nil then
						calf = { entity = ent, count = feedCalf }
						self.cattle[entity.unit_number] = calf
					end
					calf.count = calf.count - 1
					inventory.remove({name="fi-cattle-feed", count=1})
					if calf.count <= 0 then
						self.cattle[entity.unit_number] = nil
						local calfPosition = calf.entity.position
						calf.entity.destroy()
						entity.surface.create_entity({ name="cattle", position=calfPosition, force=entity.force })
					end
				else
					break
				end
			end
		end
	end
end

function cattle_feeder:update()

	self:cattle_feeder_process()

end

function cattle_feeder:say(string)
  self.entity.surface.create_entity{name = "tutorial-flying-text", position = self.entity.position, text = string}
end

function cattle_feeder:on_removed(event)
  if event.name == defines.events.on_entity_died then
    self.entity.destroy()
  else
  end
end

function cattle_feeder:on_config_changed()
end

return cattle_feeder