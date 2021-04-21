if not util then require("prototypes.scripts.util") end

local local_set_types_biome = function() 
  util.types.biome_types = {
    {name = "basic", factor = 1},
    {name = "water", factor = 1.5},
    {name = "desert", factor = 0.5},
    {name = "sand", factor = 0.5},
    {name = "snow", factor = 0.75},
    {name = "ice", factor = 0.75},
    {name = "volcanic", factor = 0.25}
  }
end

local local_set_types_non_pollutant = function ()
  util.types.non_pollutant = {
    { name= "water", polutant = true},
    { name= "steam", polutant = true}
  }  
end

local local_is_polutant = function(surface)
  for _, v in ipairs(util.types.non_pollutant) do  
    if v.name == surface then return not v.polutant end
  end
  return true
end

local local_create_biome_recipies = function()
  local create_recipe_for_biome = function(name, factor)
      local smooth = 25
      return {
        type = "recipe",        
        name = "wind-trap-action-" .. name,
        energy_required = 1/smooth,
        enabled = true,
        category = "wind-trap",
        ingredients = {},
        results = {{type = "fluid", name = "water", amount = math.floor(100/smooth*factor+0.5)}},
        hidden = true
      }
    end  
  for _,biome in pairs(util.types.biome_types) do
    data:extend({create_recipe_for_biome(biome.name, biome.factor)})
  end
end

local local_get_item = function(name)
  local items = data.raw["item"]
  if items then
    return items[name]
  end
  return nil
end

local local_create_fluid_item = function(name, fluid, energy)
  local recipe =
  {
    type = "recipe",
    name = "dump-" .. fluid.name,
    category = "discharge-fluids",
    energy_required = energy,
    subgroup = fluid.subgroup,
    order = fluid.order,
    enabled = true,
    icon = fluid.icon,
	--hidden = true,
    icon_size = 32,
	hide_from_stats = true,
    ingredients = {{type = "fluid", name = fluid.name, amount = 10000}},
    results = 
    {
      {type = "fluid", name = fluid.name, amount = 0}
    },
  }
  data:extend({recipe})
  return recipe
end

local local_get_or_create_fluid_item = function(name, fluid)
  local existing_item = local_get_item(name)
  return local_create_fluid_item(name, fluid)
end

local local_process_fluids = function(fluids)
  for name,fluid in pairs(fluids) do
	  if fluid_name == nil then
		local fluid_item = local_get_or_create_fluid_item(fluid_name, fluid, 6)
	  elseif string.find(fluid_name, "water") then
		local fluid_item = local_get_or_create_fluid_item(fluid_name, fluid, 6)
	  else
		local fluid_item = local_get_or_create_fluid_item(fluid_name, fluid, 6)
	  end
  end 
end

local local_test = function()  
  if util.types.is_polutant("water") == true then return false end
  if util.types.is_polutant("steam") == true then return false end
  if util.types.is_polutant("chickens") == false then return false end  
  for k, v in ipairs(data) do        
    if data[k].name == "wind-trap-action-snow" then return true end
  end  
  return true
end
local local_create_discharge_recipies = function()
	local_process_fluids(data.raw["fluid"])
end

local local_get_results_from_ingredients = function(r)
	local ingredients = {}		
	for k=1, #r do local i = r[k];	
		local name = nil
		local amount = nil
		if i.type ~= nil then			
			amount = i.amount
			name = i.name
		else
			name = i[1]
			amount = i[2]			
		end
		if amount == nil then amount = 1 end
		ingredients[#ingredients+1] = {
			name = name,
			probability = 1,
			amount = math.max(1, math.floor(amount * 0.8))
			}
	end
	return ingredients
end

local local_create_recylce_item = function(r)

  local results = nil
  if r.normal ~= nil then 		
	  results = r.normal.results;
	  if results == nil or #results == 0 then
		results = {{name = r.normal.result, amount = r.normal.result_count}}
	  end
  else
	  results = r.results;
	  if results == nil or #results == 0 then
		results = {{name = r.result, amount = r.result_count}}
	  end
  end
  if #results > 1 then return end
  if results[1].type == "fluid" then return end  
  if r.ingredients == nil then return end
  for k=1, #r.ingredients do local i = r.ingredients[k];
	if i.type == "fluid" then return end
  end
  local item = local_get_item(results[1].name)
  if item == nil then return end
  if item.icon == nil then return end
  local recipe = nil
  if r.normal ~= nil then
	  recipe =
	  {
		type = "recipe",
		name = "craft-" .. results[1].name,
		category = "recycling",
		subgroup = "recyclable",		
		hidden = "false",	    
		icon = item.icon,
		icon_size = item.icon_size,
		normal = {
			enabled = "false",
			energy_required = r.normal.energy_required,			
			ingredients = {{name = results[1].name, amount = 1}},
			results = local_get_results_from_ingredients(r.normal.ingredients)
		},
		expensive =
		{
		    enabled = "false",
			energy_required = r.expensive.energy_required,			
			ingredients = {{name = results[1].name, amount = 1}},
			results = local_get_results_from_ingredients(r.expensive.ingredients)
		}
	  }
  else
	  local res = local_get_results_from_ingredients(r.ingredients)
	  if #res<1 then return end
	  recipe =
	  {
		type = "recipe",
		name = "craft-" .. results[1].name,
		category = "recycling",
		subgroup = "recyclable",
		enabled = "false",
		hidden = "false",	    
		icon = item.icon,
		energy_required = r.energy_required,
		icon_size = item.icon_size,
		ingredients = {{name = results[1].name, amount = 1}}, -- results
		results = res
	  }  
	  end
  --if item.order ~= nil then recipe.order = item.order end
  recipe.hide_from_stats = true
  recipe.localised_name = "Recyle Item"
  recipe.localised_description = "Recyle Item"
  --if item.subgroup ~= nil then recipe.subgroup = item.subgroup end  
  data:extend({recipe})
  table.insert(data.raw["technology"]["recycling-machine"].effects, {type = "unlock-recipe",recipe = "craft-" .. results[1].name})
end
local local_create_recycle_recipies = function(source)
	local recipies = {}
	--if #data.raw.recipe > 3 then
	--data.raw.recipe = data.raw.recipe/0
	--end
	for name, recipe in pairs(source) do --for k=1, #data.raw.recipe do local r = data.raw["recipe"][k];	
		recipies[#recipies+1] = recipe
	end
	for k=1, #recipies do local recipe = recipies[k];	
		local_create_recylce_item(recipe)
	end			
end

if not util.types then   
	util.types = {}
	util.types.is_polutant = local_is_polutant
	util.types.set_types_biome = local_set_types_biome
	util.types.set_types_non_pollutant = local_set_types_non_pollutant
	util.types.ammo = {}
	if global ~= nil then		
		local_set_types_biome()
		local_set_types_non_pollutant() 
	end
end

if data ~= nil and final_fixes == true then  --Have been called by data-final-fixes.lua
	local_set_types_biome()
	local_set_types_non_pollutant() 
	local_create_biome_recipies()
	--local_create_discharge_recipies()
	local_create_recycle_recipies(data.raw.recipe)
end