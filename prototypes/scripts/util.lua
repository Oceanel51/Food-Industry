if not util then util = {} end
if not util.inventory then require ("prototypes.scripts.inventory") end
if not util.types then require ("prototypes.scripts.types") end

function player_print(message)
	if game ~= nil and #game.players > 0 then
		game.players[1].print(convert_to_string(message))
	end
end


function aggrigate_content(c1,c2)
	if c1 == nil then return c2 end
	if c2 == nil then return c1 end
	local ret = {}

	for k,v in pairs(c1) do
		ret[k] = v
	end
	for k,v in pairs(c2) do
		if ret[k] ~= nil then ret[k] = ret[k] + v
		else ret[k] = v end
	end
	return ret
end

function convert_to_string(arg)
	ToString = function(arg)
		local res=""
		if type(arg)=="table" then
			res="{"
			for k,v in pairs(arg) do
				res=res.. tostring(k).." = ".. ToString(v) ..","
			end
			res=res.."}"
		else
			res=tostring(arg)
		end
		return res
	end
	return ToString(arg, "  ")
end

function is_Valid(entity)
	return (entity ~= nil and entity.valid)
end

function get_biome(entity)
	local r = 10
	local aabb = entity.prototype.collision_box
	local box = {{entity.position.x-r-aabb.left_top.x, entity.position.y-r-aabb.left_top.y}, {entity.position.x+r+aabb.right_bottom.x, entity.position.y+r+aabb.right_bottom.y}}
	local tiles = entity.surface.find_tiles_filtered{area=box}
	local counts = {}
	counts["basic"] = #tiles
	for _,tile in pairs(tiles) do
		for type,fac in pairs(util.types.biome_types) do
			if type ~= "basic" and string.find(tile.name, type) then
				counts["basic"] = counts["basic"]-1
				counts[type] = counts[type] and counts[type]+1 or 1
			end
		end
	end
	local max = 0
	local ret = "basic"
	for type,count in pairs(counts) do
		if count > max then
			ret = type
			max = count
		end
	end
	for _,tile in pairs(tiles) do
		if tile.name == ret then return ret end
	end
	return "basic"
end

function transfer_fluid(from,findex,to,tindex,amount,max)
	if from ~= nil and to ~= nil then
		local from_boxes = from.fluidbox
		local from_box = from_boxes[findex]		
		local to_boxes = to.fluidbox		
		local to_box = to_boxes[tindex]
		if from_box ~= nil then
			if to_box == nil then 
				if from_box.amount < amount then
					from_boxes[findex] = nil
					to_boxes[tindex] = from_box
				else
					from_box.amount = from_box.amount - amount
					from_boxes[findex] = from_box
					from_box.amount = amount
					to_boxes[tindex] = from_box
				end
			else
				local cap = math.max(to_boxes.get_capacity(tindex),max)
				local avail = cap - to_box.amount
				local tfer =math.min(avail,math.abs(math.min(from_box.amount,amount)))
				from_box.amount = from_box.amount - tfer
				from_boxes[1] = from_box
				from_box.amount = to_box.amount + tfer
				to_boxes[tindex] = from_box				
			end
			return from_box.name
		end
	end
end

function transfer_fluid_and_convert(from,findex,to,tindex,amount,max,totype)
	if from ~= nil and to ~= nil then
		local from_boxes = from.fluidbox
		local from_box = from_boxes[findex]		
		local to_boxes = to.fluidbox		
		local to_box = to_boxes[tindex]
		local fluid_prototype = game.fluid_prototypes[totype]
		if from_box ~= nil then
			if to_box == nil then 
				if from_box.amount < amount then
					from_boxes[findex] = nil
					from_box.temperature = fluid_prototype.default_temperature 
					from_box.name = totype
					to_boxes[tindex] = from_box
				else
					
					from_box.amount = from_box.amount - amount
					from_boxes[findex] = from_box
					from_box.amount = amount
					from_box.temperature = fluid_prototype.default_temperature 
					from_box.name = totype
					to_boxes[tindex] = from_box
				end
			else
				local cap = math.max(to_boxes.get_capacity(tindex),max)
				local avail = cap - to_box.amount
				local tfer =math.min(avail,math.abs(math.min(from_box.amount,amount)))
				from_box.amount = from_box.amount - tfer
				from_boxes[1] = from_box
				from_box.amount = to_box.amount + tfer
				from_box.temperature = fluid_prototype.default_temperature 
				from_box.name = totype
				to_boxes[tindex] = from_box
			end
		end
	end
end

function get_connected_input_fluid(entity, box)
	
	if box > #entity.fluidbox then return nil end	
	local inpipe = entity.fluidbox.get_connections(box)
	--player_print(inpipe)
	if inpipe == nil then return nil end
	for i = 1, #inpipe do			
		for j = 1, #inpipe[i] do
			local isme = inpipe[i].get_connections(j)
			if isme ~= nil then
				for k = 1, #isme do
					if isme[k].owner == entity then 
						--player_print(inpipe[i].owner.fluidbox[j])
						return {entity = inpipe[i].owner, box = j} 
					end
				end
			end				
		end
	end
end

function change_fluidbox_fluid(entity,amount, pollution_source)
    local delta = 0
	local used = 0
	local abs_amount = math.abs(amount)
    if entity.fluidbox ~= nil then
		for i = 1, #entity.fluidbox do	
			local fluid =  entity.fluidbox[i]
			local current_fluid = "water"
			if fluid ~= nil and fluid.amount > 0 then			    
				local innerDelta = 0
				current_fluid = fluid.name
				if amount < 0 then					
					innerDelta = removeable_fluid(fluid,amount)					
					fluid.amount = fluid.amount-innerDelta
					entity.fluidbox[i] = fluid			
				else
					innerDelta = addable_fluid(entity,amount,i)
					fluid.amount = fluid.amount-innerDelta
					entity.fluidbox[i] = fluid
				end
				used = used + innerDelta 
				if pollution_source ~= nil then
					--player_print(current_fluid)
					if util.types.is_polutant(current_fluid) == true then
						pollution_source.surface.pollute(pollution_source.position,0.01)
					end
				end
				if used >= amount then 
					if(amount < 0) then return used * -1 end
					return used
				end
			end
		end
	end
	if(amount < 0) then return used * -1 end
	return used
end

function addable_fluid(entity, amount, index)
	local cap = 100
	if entity.fluidbox[index].get_capacity then 
		cap = entity.fluidbox[index].get_capacity(index) 
	end
	local avail = cap - entity.fluidbox[index].amount
	return math.min(avail,math.abs(amount))
end

function removeable_fluid(fluid, amount) return math.min(fluid.amount,math.abs(amount)) end

function get_fluidbox_fluid(entity,box)
	if entity.fluidbox then
		local fluid =  tank.fluidbox[box]
		if fluid ~= nil then return entity.fluidbox[box].fluid.type end
	end
	return nil
end

function opposite_direction(direction)
	if direction == defines.direction.north then return defines.direction.south end
	if direction == defines.direction.northeast	 then return defines.direction.southwest end
	if direction == defines.direction.east then return defines.direction.west end
	if direction == defines.direction.southeast then return defines.direction.northwest  end
	if direction == defines.direction.south then return defines.direction.north end
	if direction == defines.direction.southwest then return defines.direction.northeast end
	if direction == defines.direction.west then return defines.direction.east end
	if direction == defines.direction.northwest then return defines.direction.southeast end
	return direction
end

function get_entities_to(direction, entity, type)
    local d = opposite_direction(direction)
	if d == defines.direction.north then return get_entities_to_north(entity,type) end
	if d == defines.direction.northeast	 then return get_entities_to_northeast(entity,type) end
	if d == defines.direction.east then return get_entities_to_east(entity,type) end
	if d == defines.direction.southeast then return get_entities_to_southeast(entity,type) end
	if d == defines.direction.south then return get_entities_to_south(entity,type) end
	if d == defines.direction.southwest then return get_entities_to_southwest(entity,type) end
	if d == defines.direction.west then return get_entities_to_west(entity,type) end
	if d == defines.direction.northwest then return get_entities_to_northwest(entity,type) end
	return nil
end

function get_entities_to_northwest(entity,type)
	local wh = get_entity_size(entity)
	if wh == {0, 0} then wh = {1,1} end
	local w = wh[1]/2
	local h = wh[2]/2
	if type ~= nil then entity.surface.find_entities_filtered{area = {{entity.position.x-w, entity.position.y-(h+0.5)}, {entity.position.x-(w+0.5), entity.position.y-h}}, type = type} end
	return entity.surface.find_entities({{entity.position.x-w, entity.position.y-(h+0.5)}, {entity.position.x-(w+0.5), entity.position.y-h}})
end

function get_entities_to_northeast(entity,type)
	local wh = get_entity_size(entity)
	if wh == {0, 0} then wh = {1,1} end
	local w = wh[1]/2
	local h = wh[2]/2
	if type ~= nil then entity.surface.find_entities_filtered{area = {{entity.position.x+w, entity.position.y-(h+0.5)}, {entity.position.x+(w+0.5), entity.position.y-h}}, type = type} end
	return entity.surface.find_entities({{entity.position.x+w, entity.position.y-(h+0.5)}, {entity.position.x+(w+0.5), entity.position.y-h}})
end

function get_entities_to_north(entity,type)		
	local wh = get_entity_size(entity)	
	local w = wh[1]/2
	local h = wh[2]/2	
	if type ~= nil then entity.surface.find_entities_filtered{area = {{entity.position.x-w, entity.position.y-(h+0.5)}, {entity.position.x+w, entity.position.y-h}}, type = type} end
	return entity.surface.find_entities({{entity.position.x-w, entity.position.y-(h+0.5)}, {entity.position.x+w, entity.position.y-h}})	
end

function get_entities_to_south(entity,type)
	local wh = get_entity_size(entity)
	local w = wh[1]/2
	local h = wh[2]/2
	if type ~= nil then entity.surface.find_entities_filtered{area = {{entity.position.x-w, entity.position.y+h}, {entity.position.x+w, entity.position.y+h+(0.5)}}, type = type} end
	return entity.surface.find_entities({{entity.position.x-w, entity.position.y+h}, {entity.position.x+w, entity.position.y+h+(0.5)}})
end

function get_entities_to_east(entity,type)
	local wh = get_entity_size(entity)
	local w = wh[1]/2
	local h = wh[2]/2
	if type ~= nil then entity.surface.find_entities_filtered{area = {{entity.position.x+w, entity.position.y-h}, {entity.position.x+(w+0.5), entity.position.y+h}}, type = type} end
	return entity.surface.find_entities({{entity.position.x+w, entity.position.y-h}, {entity.position.x+(w+0.5), entity.position.y+h}})
end

function get_entities_to_west(entity,type) 
	local wh = get_entity_size(entity)
	local w = wh[1]/2
	local h = wh[2]/2
	if type ~= nil then entity.surface.find_entities_filtered{area = {{entity.position.x-(w+0.5), entity.position.y-h}, {entity.position.x-w, entity.position.y+h}}, type = type} end
	return entity.surface.find_entities({{entity.position.x-(w+0.5), entity.position.y-h}, {entity.position.x-w, entity.position.y+h}})
end

function get_entities_to_southeast(entity,type)
	local wh = get_entity_size(entity)
	local w = wh[1]/2
	local h = wh[2]/2
	if type ~= nil then entity.surface.find_entities_filtered{area = {{entity.position.x+w, entity.position.y-h}, {entity.position.x+(w+0.5), entity.position.y+(h+0.5)}}, type = type} end
	return entity.surface.find_entities({{entity.position.x+w, entity.position.y-h}, {entity.position.x+(w+0.5), entity.position.y+(h+0.5)}})
end

function get_entities_to_southwest(entity,type)
	local wh = get_entity_size(entity)
	local w = wh[1]/2
	local h = wh[2]/2
	if type ~= nil then entity.surface.find_entities_filtered{area = {{entity.position.x-w, entity.position.y-h}, {entity.position.x-(w+0.5), entity.position.y+(h+0.5)}}, type = type} end
	return entity.surface.find_entities({{entity.position.x-w, entity.position.y-h}, {entity.position.x-(w+0.5), entity.position.y+(h+0.5)}})
end

function get_entities_around(entity, tiles,type)	
	local wh = get_entity_size(entity)
	local w = wh[1]/2
	local h = wh[2]/2	
	local entities
	if type ~= nil then
		entities = entity.surface.find_entities_filtered{area = {{entity.position.x-(w+tiles), entity.position.y-(h+tiles)}, {entity.position.x+(w+tiles), entity.position.y+(h+tiles)}}, type = type}
	else

		entities = entity.surface.find_entities({{entity.position.x-(w+tiles), entity.position.y-(h+tiles)}, {entity.position.x+(w+tiles), entity.position.y+(h+tiles)}})
	end
	for i, ent in pairs(entities) do	
		if ent == entity then
			table.remove(entities,i)
			break
		end	
	end
	return entities	
end

function get_entities_around_by_name(entity, tiles,name)	
	local wh = get_entity_size(entity)
	local w = wh[1]/2
	local h = wh[2]/2	
	local entities
	if name ~= nil then
		entities = entity.surface.find_entities_filtered{area = {{entity.position.x-(w+tiles), entity.position.y-(h+tiles)}, {entity.position.x+(w+tiles), entity.position.y+(h+tiles)}}, name = name}
	else

		entities = entity.surface.find_entities({{entity.position.x-(w+tiles), entity.position.y-(h+tiles)}, {entity.position.x+(w+tiles), entity.position.y+(h+tiles)}})
	end
	for i, ent in pairs(entities) do	
		if ent == entity then
			table.remove(entities,i)
			break
		end	
	end
	return entities	
end

function distance( x1, y1, x2, y2 ) return math.sqrt( (x2-x1)^2 + (y2-y1)^2 ) end

function entity_contains_point(entity,position)
	local wh = get_entity_size(entity)
	local w = wh[1]/2
	local h = wh[2]/2
	if entity.prototype.selection_box ~= nil then	
		if entity.position.x - w <= position.x and 
		   position.x <= entity.position.x + w and 
		   entity.position.y - h <= position.y and 
		   position.y <= entity.position.y + h then
			 return true
		end
	end
	return false
end


function get_entity_size(entity)
	if entity == nil then return {1,1} end
	if entity.prototype.selection_box ~= nil then				
		return {
				entity.prototype.selection_box["right_bottom"]["x"] - entity.prototype.selection_box["left_top"]["x"],
				entity.prototype.selection_box["right_bottom"]["y"] - entity.prototype.selection_box["left_top"]["y"]}
	end
	return {1,1}
end