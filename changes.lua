if data.raw.capsule["raw-fish"] then
	--data.raw.capsule["raw-fish"].capsule_action.attack_parameters.ammo_type.action.action_delivery.target_effects.damage.amount = 0
end

-- add new type of science-pack to labs
for i,p in pairs(data.raw.lab) do
	insert = true
	for j,k in pairs(p.inputs) do
		if k == "food-science-pack" then
			insert = false
		end
	end
	if insert then
		table.insert(p.inputs, "food-science-pack")
	end
end

-- add new crafting_categories for chemical-plants
-- TODO Bob's chemical-plants - проверить и записать в лог
if mods["bobplates"] then
	if data.raw["assembling-machine"]["chemical-plant"] then
		table.insert(data.raw["assembling-machine"]["chemical-plant"].crafting_categories, "mixing")
	end
end
if data.raw.recipe["chemical-plant"] then
	--table.insert(data.raw.recipe["chemical-plant"].ingredients, {"crystal", 1})
end
if data.raw["assembling-machine"]["electric-cooker"] then
	table.insert(data.raw["assembling-machine"]["electric-cooker"].crafting_categories, "food-capsules")
end


local productivity_recipes = {
	"fertilizer-oil-cracking",
	"food-science-pack",
	"crystal-extraction-stone",
	"crystal-extraction-steam",
	"canola-oil",
	"canola-oil-processing",
	"canola-oil-lubricant",
	"sulfuric-acid",
	"basic-oil-processing",
	"advanced-oil-processing"
}
for i, recipe in pairs(productivity_recipes) do
	table.insert(data.raw.module["productivity-module"].limitation, recipe)
	table.insert(data.raw.module["productivity-module-2"].limitation, recipe)
	table.insert(data.raw.module["productivity-module-3"].limitation, recipe)
end


local biter_drops = {
	--1 type,		2 name,				3 item,				4 probability,	5 count_min,	6 count_max
	{"unit",		"small-biter",		"biter-meat",		0.15,			1,				1},
	{"unit",		"small-spitter",	"biter-meat",		0.15,			1,				1},
	
	{"unit",		"medium-biter",		"biter-meat",		0.15,			1,				1},
	{"unit",		"medium-spitter",	"biter-meat",		0.15,			1,				1},
	
	{"unit",		"big-biter",		"biter-meat",		0.2,			1,				1},
	{"unit",		"big-spitter",		"biter-meat",		0.2,			1,				1},
	
	{"unit",		"behemoth-biter",	"biter-meat",		0.15,			1,				2},
	{"unit",		"behemoth-spitter",	"biter-meat",		0.15,			1,				2},
	
	{"turret",		"little-worm-turret","biter-meat",		1,				1,				2},
	{"turret",		"medium-worm-turret","biter-meat",		1,				1,				3},
	{"turret",		"big-worm-turret",	"biter-meat",		1,				1,				4},
	
	{"unit-spawner","biter-spawner",	"biter-meat",		1,	 			2,				4},
	{"unit-spawner","spitter-spawner",	"biter-meat",		1,				2,				4},
}
for index,d in pairs(biter_drops) do
	if data.raw[d[1]] then
		if data.raw[d[1]][d[2]] then
			if not data.raw[d[1]][d[2]].loot then
				data.raw[d[1]][d[2]].loot = {}
			end
			table.insert(data.raw[d[1]][d[2]].loot, { item = d[3], probability = d[4], count_min = d[5], count_max = d[6] })
		end
	end
end


if not mods["IndustrialRevolution"] then -- IR compatibility
	table.insert(data.raw.technology["automation"].effects,{recipe = "compressed-straw", type = "unlock-recipe"})
	table.insert(data.raw.technology["automation"].effects,{recipe = "burner-fishing-inserter", type = "unlock-recipe"})
	table.insert(data.raw.technology["automation"].effects,{recipe = "burner-food-picker", type = "unlock-recipe"})
end

--table.insert(data.raw.technology["logistics"].effects,{recipe = "fishing-inserter", type = "unlock-recipe"})
--table.insert(data.raw.technology["logistics"].effects,{recipe = "food-picker", type = "unlock-recipe"})

data.raw.item["landfill"].fuel_value = "500kJ"
data.raw.item["landfill"].fuel_category = "humus"

if data.raw.armor["light-armor"] then
	data.raw.armor["light-armor"].durability = 2000
end

if data.raw.technology["oil-processing"] then
	--table.insert(data.raw.technology["oil-processing"].prerequisites,"crystal-extraction-1")
end

-- open recipe after research technology "optics"
table.insert(data.raw["technology"]["optics"].effects, { type = "unlock-recipe", recipe = "fi-table-logo-lamp" } )

-- open recipe after research technology "fluid-handling" or Bob "water-miner-1"
if data.raw["technology"]["water-miner-1"] and mods["bobmining"] then
	table.insert(data.raw["technology"]["water-miner-1"].effects, { type = "unlock-recipe", recipe = "fi-fluid-tank" } )
else
	table.insert(data.raw["technology"]["fluid-handling"].effects, { type = "unlock-recipe", recipe = "fi-fluid-tank" } )
end

-- open recipe after research technology "plastics"
table.insert(data.raw["technology"]["plastics"].effects, { type = "unlock-recipe", recipe = "plastic-bottle" } )
table.insert(data.raw["technology"]["plastics"].effects, { type = "unlock-recipe", recipe = "plastic-bottle-pure-water" } )


-- for player hand crafting
table.insert(data.raw["character"]["character"].crafting_categories,"food-capsules")
