if not util then require("prototypes.scripts.util") end
  
local local_get_requirement = function(stock,stack,required) 
  if required <= 0 then return 0 end  
  local nstack = math.max(stack,required)    
  local needed = math.max(required-stock,0)       
  return math.max(needed/required,(((stock/nstack)+((needed/required)*2))/3))
end

local local_get_excess = function(stock,stack,required) 
  if required <= 0 then 
    if  stock > 0 then return 1 else return 0 end
  end
  local nstack = math.max(stack,required)
  local excess = math.max(nstack-required,0)   
  return (excess/nstack)
end

local local_remove_from_inventory = function(entity,item,amt,inventory_name)	
	if amt <= 0 then return false end
	local inventory = nil 
	if inventory_name ~= nil then
		inventory = entity.get_inventory(inventory_name)
	else
		inventory = entity.get_output_inventory()
	end
	if inventory ~= nil then				
		local count = inventory.get_item_count(item)	
		if count > 0 then
			if inventory.remove({name = item, amount = amt}) > 0 then return true end
			local contents = inventory.find_item_stack(item)	
			if contents ~= nil then					
				contents.set_stack({name = item, amount = math.max(contents.amount - amt,0)})
				return true
			end
		end			
	end		
	return false
end

local local_can_insert = function(entity,item,position)
	--[[if position ~= nil  and (entity.prototype.type == "transport-belt" or entity.prototype.type == "underground-belt") then					
		if  entity.get_transport_line(1).can_insert_at(position) then
			player_print("can insert ".. item .. "  at " .. position)
			return true
		elseif  entity.get_transport_line(1).can_insert_at(position) then
			player_print("can insert ".. item .. "  at " .. position)
			return true
		else
			return false
		end
	end]]
	if item == nil then return false end
	return entity.can_insert(item)	
end

local local_get_inventory = function(entity,inventory_name)	
	local inventory = nil 
	local contents = nil	
	if inventory_name ~= nil then
		inventory = entity.get_inventory(inventory_name)
	else
		inventory = entity.get_output_inventory()
	end
	if inventory == nil and (entity.prototype.type == "transport-belt" or entity.prototype.type == "underground-belt") then
		contents = aggrigate_content(entity.get_transport_line(1).get_contents(),entity.get_transport_line(2).get_contents())							
	end
	if contents ~= nil or inventory ~= nil then
		if contents == nil then
			contents = inventory.get_contents()					
		end
	end
	return contents
end

local local_get_inventory_count = function(name,inventory)
	if inventory ~= nil then
		local contents = inventory.get_contents()
		for n, count in pairs(contents) do
			if n == name then return count end			
		end		
	end		
	return 0
end

local local_test = function()
  if util.inventory.get_excess(0,20,0) ~= 0 then return false end
  if util.inventory.get_excess(1,20,0) ~= 1 then return false end
  if util.inventory.get_excess(10,20,10) ~= 0.5 then return false end
  return true
end

if not util.inventory then 
  util.inventory = {
    get_excess  = local_get_excess,
    get_requirement  = local_get_requirement,
	remove_from_inventory = local_remove_from_inventory,
	can_insert = local_can_insert,
	get_inventory = local_get_inventory,
	get_inventory_count = local_get_inventory_count,
    test = local_test
  } 
end