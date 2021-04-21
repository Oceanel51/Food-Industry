require "prototypes.tables.fi-trees-table"
local trees_variations = trees_variations()
local group_pos = 8
local to_filter = {}
-- if global ~= nil then
-- 	if not global.foodi.event_entity_filter then global.foodi.event_entity_filter = {} end		-- event entity filter
-- 	log("FI: is global")
-- else
	local event_entity_filter = {}
-- end


local plants = {
--1,			2,			3,					4,								5,			6		7								8								9			
--name,			suffix,		autoplace-control,	map_color,						starting,	size,	collision_box,					selection_box,					shift,		
{"wheat",		"-plant",	"cereal-plant",		{r=0.98, g= 1.0, b=0, a=0.9},	40,			0.42,	{{-0.35,-0.35},{0.35,0.35}},	{{-0.48, -0.48}, {0.48, 0.48}},	{0.0, 0.0},	},
}

--1			2					3			4			5			6		7			8		9			10		11		12			13			14				15			16		17		18
--name, 	energy_required,	to plant,	results,	cool(sec),	seeds, 	stack size,	plant?,	seed?,	edible?,	straws,	compost,	type,	debug map color,	starting,	size,	result,	chance
--{"wheat", 	1000, 				8,			5,		0.3,		2.6, 	10,			true,	true,		true,	5.0,	"2J",		"tree", {r=0.6,g=0.6,b=0},	15,			0.16,	4,		0.12},


local wheatstagestable = {
	-- 					1				2				3				4				5					6		
	-- stage,			mining_time,	emissions sec,	max_health,		mesh_rezult,	minable_count,		stack
	["wild-plant"]	=	{0.4,			0,				5,				2,				1,					50		},

	["seed"]		=	{0.2,			0,				40,				0,				1,					50		},
	["seedling"]	=	{0.3,			-0.00012,		30,				6,				0,					20		},
	["sapling"]		=	{0.5,			-0.00018,		6,				14,				0,					10		},

	["young-1"]		=	{2,				-0.00015,		10,				4,				3,					10		},
	["young-2"]		=	{2,				-0.00012,		10,				5,				2,					10		},
	["young-3"]		=	{2,				-0.00008,		10,				6,				1,					10		},
	["young-old"]	=	{0.45,			0,				5,				0,				0,					10		},
	
	["adult-1"]		=	{2.5,			-0.00008,		15,				6,				4,					10		},
	["adult-2"]		=	{2.5,			-0.00006,		15,				8,				3,					10		},
	["adult-3"]		=	{2.5,			-0.00004,		15,				10,				2,					10		},
	["adult-old"]	=	{0.9,			0,				10,				0,				1,					10		},
}

local extend = {}
local tmp_element = {}
-- -------------------------------------- wild plant -------------------------------------
for index, plant in pairs(plants) do

	tmp_element = 
	{
		type = "item",
		name = plant[1].."-wild-plant",
		icon = "__FoodIndustry__/graphics/icons/plants/"..plant[1].."-wild"..plant[2].."-icon.png",
		icon_size = 64,
		icon_mipmaps = 4,
		subgroup = plant[1],
		order = "w-d-"..group_pos.."-z",
		stack_size = 50
	}
	table.insert(extend, tmp_element)

	tmp_element = 
	{
		type = "tree",
		name = plant[1].."-wild-plant",
		order = "w",
		autoplace = {
			control = plant[3],
			max_probability = 0.006,
			coverage = 0.0003,
			order = "w",
			peaks = {
				{
					noise_layer = "wild-"..plant[1],
					noise_octaves_difference = -0.85,
					noise_persistence = 0.4
				}
			},
			sharpness = 0.9375,
			starting_area_amount = 400,
			starting_area_size = plant[5]
		},
		collision_box = plant[7],
		collision_mask = {"item-layer", "object-layer", "water-tile"},
		darkness_of_burnt_tree = 0.5,
		emissions_per_second = -0.0001 * 60,
		flags = {
			"placeable-neutral",
			"placeable-off-grid",
			"breaths-air"
		},
		icon = "__FoodIndustry__/graphics/icons/plants/"..plant[1].."-wild"..plant[2].."-icon.png",
		icon_size = 64,
		icon_mipmaps = 4,
		max_health = 5,
		minable = {
			mining_hardness = 0.1,
			mining_time = 0.5,
			count = wheatstagestable["wild-plant"][5],
			--result = plant[1],
			results = {
				{type = "item", name = plant[1], amount = wheatstagestable["wild-plant"][5]},
				{type = "item", name = "straw", amount = wheatstagestable["wild-plant"][4]*6, probability = 0.9},
			},
		},
		selection_box = plant[8],
		subgroup = "trees",
		pictures = {
			layers = {
				{
					draw_as_shadow = true,
					filename = "__FoodIndustry__/graphics/entity/plants/"..plant[1].."/"..plant[1].."-adult-3-shadow.png",
					priority = "high",
					width = 256,
					height = 256,
					scale = plant[6],
					shift = plant[9],
				},
				{
					filename = "__FoodIndustry__/graphics/entity/plants/"..plant[1].."/"..plant[1].."-adult-3.png",
					priority = "high",
					width = 256,
					height = 256,
					scale = plant[6],
					shift = plant[9],
				}
			},
		},
		map_color = plant[4],
	}
	table.insert(extend, tmp_element)

	tmp_element = 
	{
		type = "noise-layer",
		name = "wild-"..plant[1]
	}
	table.insert(extend, tmp_element)


	to_filter = {
		{ filter = "name", name = plant[1].."-wild-plant" },
		{ filter = "ghost_name", name = plant[1].."-wild-plant" },
	}
	--table.insert(global.foodi.event_entity_filter, to_filter)
	table.insert(event_entity_filter, to_filter)

end


-- plant entity and item
-- -------------------------------------- seed stage -------------------------------------
for index, plant in pairs(plants) do
		
	-- зёрна для посадки
	tmp_element = 
	{
		type = "item",
		name = plant[1].."-seeds",
		icon = "__FoodIndustry__/graphics/icons/items/"..plant[1].."-seeds.png",
		icon_size = 64,
		icon_mipmaps = 4,
		subgroup = plant[1],
		order = "w-d-"..group_pos.."-z",
		stack_size = wheatstagestable["seed"][6],
		place_result = plant[1].."-seed",
		fuel_category = "plant",
		fuel_value = "0.5J",
	}
	table.insert(extend, tmp_element)

	tmp_element = 
	{
		type = "tree",
		name = plant[1].."-seed",
		order = "w",
		collision_box = plant[7],
		collision_mask = {"item-layer", "object-layer", "water-tile"},
		selection_box = plant[8],
		darkness_of_burnt_tree = 0.0,
		emissions_per_second = wheatstagestable["seed"][2],
		flags = {
			"placeable-neutral",
			"placeable-off-grid",
			"placeable-player",
			"player-creation"
		},
		icon = "__FoodIndustry__/graphics/icons/plants/"..plant[1].."-seed.png",
		icon_mipmaps = 4,
		icon_size = 64,
		max_health = 30,
		healing_per_tick = 0,
		repair_speed_modifier = 0,
		minable = {
			mining_hardness = 1,
			mining_time = wheatstagestable["seed"][1],
			result = plant[1].."-seeds",
			count = wheatstagestable["seed"][5],
		},
		subgroup = "trees",
		pictures = {
			layers = {
				{
					filename = "__FoodIndustry__/graphics/entity/plants/dirt-lines.png",
					priority = "high",
					width = 256,
					height = 256,
					scale = plant[6],
					shift = plant[9],
					tint = {r=0.17,g=0.13,b=0.1,a=1.0}
				},
				{
					filename = "__FoodIndustry__/graphics/entity/plants/"..plant[1].."/"..plant[1].."-seed.png",
					priority = "high",
					width = 256,
					height = 256,
					scale = plant[6],
					shift = plant[9],
					tint = {r=0.85,g=0.64,b=0.06,a=0.9}
				},
			},
		},
		map_color = plant[4],
	}
	table.insert(extend, tmp_element)

	to_filter = {
		{ filter = "name", name = plant[1].."-seed" },
		{ filter = "ghost_name", name = plant[1].."-seed" },
	}
	--table.insert(global.foodi.event_entity_filter, to_filter)
	table.insert(event_entity_filter, to_filter)

	tmp_element = 
	{
		type = "item",
		name = plant[1].."-seedling",
		icon = "__FoodIndustry__/graphics/icons/plants/"..plant[1].."-seedling-icon.png",
		icon_size = 64,
		icon_mipmaps = 4,
		subgroup = plant[1],
		order = "w-d-"..group_pos.."-z",
		stack_size = wheatstagestable["seedling"][6],
		fuel_category = "plant",
		fuel_value = "2.0J",
	}
	table.insert(extend, tmp_element)

	tmp_element = 
	{
		type = "tree",
		name = plant[1].."-seedling",
		order = "w",
		collision_box = plant[7],
		collision_mask = {"item-layer", "object-layer", "water-tile"},
		selection_box = plant[8],
		darkness_of_burnt_tree = 0.5,
		emissions_per_second = wheatstagestable["seedling"][2],
		flags = {
			"placeable-neutral",
			"breaths-air",
			"placeable-off-grid",
			"placeable-player",
			"player-creation"
		},
		icon = "__FoodIndustry__/graphics/icons/plants/"..plant[1].."-seedling-icon.png",
		icon_mipmaps = 4,
		icon_size = 64,
		max_health = 30,
		healing_per_tick = 0,
		repair_speed_modifier = 0,
		minable = {
			mining_particle = "wooden-particle",
			mining_hardness = 1,
			mining_time = wheatstagestable["seedling"][1],
			--result = plant[1].."-seedling",
			--count = wheatstagestable["seedling"][5],
			results = {
				{type = "item", name = "raw-straw", amount = wheatstagestable["seedling"][4]},
				{type = "item", name = "straw", amount_min = wheatstagestable["seedling"][4]*2, amount_max = wheatstagestable["seedling"][4]*3},
			},
		},
		subgroup = "trees",
		pictures = {
			layers = {
				{
					draw_as_shadow = true,
					filename = "__FoodIndustry__/graphics/entity/plants/"..plant[1].."/"..plant[1].."-seedling-shadow.png",
					priority = "high",
					width = 256,
					height = 256,
					scale = plant[6],
					shift = plant[9],
				},
				{
					filename = "__FoodIndustry__/graphics/entity/plants/dirt-lines.png",
					priority = "high",
					width = 256,
					height = 256,
					scale = plant[6],
					shift = plant[9],
					tint = {r=0.17,g=0.13,b=0.1,a=1.0}
				},
				{
					filename = "__FoodIndustry__/graphics/entity/plants/"..plant[1].."/"..plant[1].."-seedling.png",
					priority = "high",
					width = 256,
					height = 256,
					scale = plant[6],
					shift = plant[9],
				},
			},
		},
		map_color = plant[4],
	}
	table.insert(extend, tmp_element)

	to_filter = {
		{ filter = "name", name = plant[1].."-seedling" },
		{ filter = "ghost_name", name = plant[1].."-seedling" },
	}
	--table.insert(global.foodi.event_entity_filter, to_filter)
	table.insert(event_entity_filter, to_filter)

	tmp_element = 
	{
		type = "item",
		name = plant[1].."-sapling",
		icon = "__FoodIndustry__/graphics/icons/plants/"..plant[1].."-seedling-icon.png",
		icon_size = 64,
		icon_mipmaps = 4,
		subgroup = plant[1],
		order = "w-d-"..group_pos.."-z",
		stack_size = wheatstagestable["sapling"][6],
		fuel_category = "plant",
		fuel_value = "5J",
	}
	table.insert(extend, tmp_element)

	tmp_element = 
	{
		type = "tree",
		name = plant[1].."-sapling",
		order = "w",
		collision_box = plant[7],
		collision_mask = {"item-layer", "object-layer", "water-tile"},
		selection_box = plant[8],
		darkness_of_burnt_tree = 0.5,
		emissions_per_second = wheatstagestable["sapling"][2],
		flags = {
			"placeable-neutral",
			"breaths-air",
			"placeable-off-grid",
			"placeable-player",
			"player-creation"
		},
		icon = "__FoodIndustry__/graphics/icons/plants/"..plant[1].."-seedling-icon.png",
		icon_mipmaps = 4,
		icon_size = 64,
		max_health = 30,
		healing_per_tick = 0,
		repair_speed_modifier = 0,
		minable = {
			mining_particle = "wooden-particle",
			mining_hardness = 1,
			mining_time = wheatstagestable["sapling"][1],
			--result = plant[1].."-sapling",
			--count = wheatstagestable["sapling"][5],
			results = {
				{type = "item", name = "raw-straw", amount = wheatstagestable["sapling"][4]},
				{type = "item", name = "straw", amount_min = wheatstagestable["sapling"][4]*2, amount_max = wheatstagestable["seedling"][4]*3},
			},
		},
		subgroup = "trees",
		pictures = {
			layers = {
				{
					draw_as_shadow = true,
					filename = "__FoodIndustry__/graphics/entity/plants/"..plant[1].."/"..plant[1].."-sapling-shadow.png",
					priority = "high",
					width = 256,
					height = 256,
					scale = plant[6],
					shift = plant[9],
				},
				{
					filename = "__FoodIndustry__/graphics/entity/plants/dirt-lines.png",
					priority = "high",
					width = 256,
					height = 256,
					scale = plant[6],
					shift = plant[9],
					tint = {r=0.17,g=0.13,b=0.1,a=1.0}
				},
				{
					filename = "__FoodIndustry__/graphics/entity/plants/"..plant[1].."/"..plant[1].."-sapling.png",
					priority = "high",
					width = 256,
					height = 256,
					scale = plant[6],
					shift = plant[9],
				},
			},
		},
		map_color = plant[4],
	}
	table.insert(extend, tmp_element)

	to_filter = {
		{ filter = "name", name = plant[1].."-sapling" },
		{ filter = "ghost_name", name = plant[1].."-sapling" },
	}
	--table.insert(global.foodi.event_entity_filter, to_filter)
	table.insert(event_entity_filter, to_filter)
end

-- -------------------------------------- young stage -------------------------------------
for index, plant in pairs(plants) do
	for vi=1, 3, 1 do
		tmp_element = 
		{
			type = "item",
			name = plant[1].."-young-"..vi,
			icon = "__FoodIndustry__/graphics/icons/plants/"..plant[1].."-plant-icon.png",
			icon_size = 64,
			icon_mipmaps = 4,
			subgroup = plant[1],
			order = "w-d-"..group_pos.."-z",
			stack_size = wheatstagestable["young-"..vi][6],
		}
		table.insert(extend, tmp_element)
		tmp_element = 
		{
			type = "tree",
			name = plant[1].."-young-"..vi,
			order = "w",
			collision_box = plant[7],
			collision_mask = {"item-layer", "object-layer", "water-tile"},
			selection_box = plant[8],
			darkness_of_burnt_tree = 0.5,
			emissions_per_second = wheatstagestable["young-"..vi][2],
			flags = {
				"placeable-neutral",
				"breaths-air",
				"placeable-off-grid",
				"placeable-player",
				"player-creation"
			},
			icon = "__FoodIndustry__/graphics/icons/plants/"..plant[1].."-plant-icon.png",
			icon_mipmaps = 4,
			icon_size = 64,
			max_health = 30,
			healing_per_tick = 0,
			repair_speed_modifier = 0,
			minable = {
				mining_particle = "wooden-particle",
				mining_hardness = 1,
				mining_time = wheatstagestable["young-"..vi][1],
				--result = plant[1],
				--count = wheatstagestable["young-"..vi][5],
				results = {
					{type = "item", name = plant[1], amount = wheatstagestable["young-"..vi][5]},
					{type = "item", name = "raw-straw", amount = wheatstagestable["young-"..vi][4]},
					{type = "item", name = "straw", amount_min = wheatstagestable["young-"..vi][4]*1, amount_max = wheatstagestable["young-"..vi][4]*2},
				},
			},
			subgroup = "trees",
			pictures = {
				layers = {
					{
						draw_as_shadow = true,
						filename = "__FoodIndustry__/graphics/entity/plants/"..plant[1].."/"..plant[1].."-young-"..vi.."-shadow.png",
						priority = "high",
						width = 256,
						height = 256,
						scale = plant[6],
						shift = plant[9],
					},
					{
						filename = "__FoodIndustry__/graphics/entity/plants/dirt-lines.png",
						priority = "high",
						width = 256,
						height = 256,
						scale = plant[6],
						shift = plant[9],
							tint = {r=0.17,g=0.13,b=0.1,a=1.0}
					},
					{
						filename = "__FoodIndustry__/graphics/entity/plants/"..plant[1].."/"..plant[1].."-young-"..vi..".png",
						priority = "high",
						width = 256,
						height = 256,
						scale = plant[6],
						shift = plant[9],
					},
				},
			},
			map_color = plant[4],
		}
		table.insert(extend, tmp_element)

		to_filter = {
			{ filter = "name", name = plant[1].."-young-"..vi },
			{ filter = "ghost_name", name = plant[1].."-young-"..vi },
		},
		--table.insert(global.foodi.event_entity_filter, to_filter)
		table.insert(event_entity_filter, to_filter)
	end

	tmp_element = 
	{
		type = "item",
		name = plant[1].."-young-old",
		icon = "__FoodIndustry__/graphics/icons/plants/"..plant[1].."-young-old-icon.png",
		icon_size = 64,
		icon_mipmaps = 4,
		subgroup = plant[1],
		order = "w-d-"..group_pos.."-z",
		stack_size = wheatstagestable["young-old"][6],
	}
	table.insert(extend, tmp_element)

	tmp_element = 
	{
		type = "tree",
		name = plant[1].."-young-old",
		order = "w",
		collision_box = plant[7],
		collision_mask = {"item-layer", "object-layer", "water-tile"},
		selection_box = plant[8],
		darkness_of_burnt_tree = 0.5,
		emissions_per_second = wheatstagestable["young-old"][2],
		flags = {
			"placeable-neutral",
			"breaths-air",
			"placeable-off-grid",
			"placeable-player",
			"player-creation"
		},
		icon = "__FoodIndustry__/graphics/icons/plants/"..plant[1].."-young-old-icon.png",
		icon_mipmaps = 4,
		icon_size = 64,
		max_health = 30,
		healing_per_tick = 0,
		repair_speed_modifier = 0,
		minable = {
			mining_particle = "wooden-particle",
			mining_hardness = 1,
			mining_time = wheatstagestable["young-old"][1],
			result = plant[1],
			count = wheatstagestable["young-old"][5],
		},
		subgroup = "trees",
		pictures = {
			layers = {
				{
					draw_as_shadow = true,
					filename = "__FoodIndustry__/graphics/entity/plants/"..plant[1].."/"..plant[1].."-young-old-shadow.png",
					priority = "high",
					width = 256,
					height = 256,
					scale = plant[6],
					shift = plant[9],
				},
				{
					filename = "__FoodIndustry__/graphics/entity/plants/dirt-lines.png",
					priority = "high",
					width = 256,
					height = 256,
					scale = plant[6],
					shift = plant[9],
					tint = {r=0.17,g=0.13,b=0.1,a=1.0}
				},
				{
					filename = "__FoodIndustry__/graphics/entity/plants/"..plant[1].."/"..plant[1].."-young-old.png",
					priority = "high",
					width = 256,
					height = 256,
					scale = plant[6],
					shift = plant[9],
				},
			},
		},
		map_color = plant[4],
	}
	table.insert(extend, tmp_element)

	to_filter = {
		{ filter = "name", name = plant[1].."-young-old-" },
		{ filter = "ghost_name", name = plant[1].."-young-old" },
	}
	--table.insert(global.foodi.event_entity_filter, to_filter)
	table.insert(event_entity_filter, to_filter)

end

-- -------------------------------------- adult stage -------------------------------------
for index, plant in pairs(plants) do
	for vi=1, 3, 1 do
		tmp_element = 
		{
			type = "item",
			name = plant[1].."-adult-"..vi,
			icon = "__FoodIndustry__/graphics/icons/plants/"..plant[1].."-plant-icon.png",
			icon_size = 64,
			icon_mipmaps = 4,
			subgroup = plant[1],
			order = "w-d-"..group_pos.."-z",
			stack_size = wheatstagestable["adult-"..vi][6],
		}
		table.insert(extend, tmp_element)

		tmp_element = 
		{
			type = "tree",
			name = plant[1].."-adult-"..vi,
			order = "w",
			collision_box = plant[7],
			collision_mask = {"item-layer", "object-layer", "water-tile"},
			selection_box = plant[8],
			darkness_of_burnt_tree = 0.5,
			emissions_per_second = wheatstagestable["adult-"..vi][2],
			flags = {
				"placeable-neutral",
				"breaths-air",
				"placeable-off-grid",
				"placeable-player",
				"player-creation"
			},
			icon = "__FoodIndustry__/graphics/icons/plants/"..plant[1].."-plant-icon.png",
			icon_mipmaps = 4,
			icon_size = 64,
			max_health = 30,
			healing_per_tick = 0,
			repair_speed_modifier = 0,
			minable = {
				mining_particle = "wooden-particle",
				mining_hardness = 1,
				mining_time = wheatstagestable["adult-"..vi][1],
				--result = plant[1],
				--count = wheatstagestable["adult-"..vi][5],
				results = {
					{type = "item", name = plant[1], amount = wheatstagestable["adult-"..vi][5]},
					{type = "item", name = "raw-straw", amount = wheatstagestable["adult-"..vi][4]},
					{type = "item", name = "straw", amount_min = wheatstagestable["adult-"..vi][4]*4, amount_max = wheatstagestable["adult-"..vi][4]*6},
				},
			},
			subgroup = "trees",
			pictures = {
				layers = {
					{
						draw_as_shadow = true,
						filename = "__FoodIndustry__/graphics/entity/plants/"..plant[1].."/"..plant[1].."-adult-"..vi.."-shadow.png",
						priority = "high",
						width = 256,
						height = 256,
						scale = plant[6],
						shift = plant[9],
					},
					{
						filename = "__FoodIndustry__/graphics/entity/plants/dirt-lines.png",
						priority = "high",
						width = 256,
						height = 256,
						scale = plant[6],
						shift = plant[9],
						tint = {r=0.17,g=0.13,b=0.1,a=1.0}
					},
					{
						filename = "__FoodIndustry__/graphics/entity/plants/"..plant[1].."/"..plant[1].."-adult-"..vi..".png",
						priority = "high",
						width = 256,
						height = 256,
						scale = plant[6],
						shift = plant[9],
					},
				},
			},
			map_color = plant[4],
		}
		table.insert(extend, tmp_element)

		to_filter = {
			{ filter = "name", name = plant[1].."-adult-"..vi },
			{ filter = "ghost_name", name = plant[1].."-adult-"..vi },
		}
		--table.insert(global.foodi.event_entity_filter, to_filter)
		table.insert(event_entity_filter, to_filter)

	end

	tmp_element = 
	{
		type = "item",
		name = plant[1].."-adult-old",
		icon = "__FoodIndustry__/graphics/icons/plants/"..plant[1].."-adult-old-icon.png",
		icon_size = 64,
		icon_mipmaps = 4,
		subgroup = plant[1],
		order = "w-d-"..group_pos.."-z",
		stack_size = wheatstagestable["adult-old"][6],
	}
	table.insert(extend, tmp_element)

	tmp_element = 
	{
		type = "tree",
		name = plant[1].."-adult-old",
		order = "w",
		collision_box = plant[7],
		collision_mask = {"item-layer", "object-layer", "water-tile"},
		selection_box = plant[8],
		darkness_of_burnt_tree = 0.5,
		emissions_per_second = wheatstagestable["adult-old"][2],
		flags = {
			"placeable-neutral",
			"breaths-air",
			"placeable-off-grid",
			"placeable-player",
			"player-creation"
		},
		icon = "__FoodIndustry__/graphics/icons/plants/"..plant[1].."-adult-old-icon.png",
		icon_mipmaps = 4,
		icon_size = 64,
		max_health = 30,
		healing_per_tick = 0,
		repair_speed_modifier = 0,
		minable = {
			mining_particle = "wooden-particle",
			mining_hardness = 1,
			mining_time = wheatstagestable["adult-old"][1],
			result = plant[1],
			count = wheatstagestable["adult-old"][5],
		},
		subgroup = "trees",
		pictures = {
			layers = {
				{
					draw_as_shadow = true,
					filename = "__FoodIndustry__/graphics/entity/plants/"..plant[1].."/"..plant[1].."-adult-old-shadow.png",
					priority = "high",
					width = 256,
					height = 256,
					scale = plant[6],
					shift = plant[9],
				},
				{
					filename = "__FoodIndustry__/graphics/entity/plants/dirt-lines.png",
					priority = "high",
					width = 256,
					height = 256,
					scale = plant[6],
					shift = plant[9],
					tint = {r=0.17,g=0.13,b=0.1,a=1.0}
				},
				{
					filename = "__FoodIndustry__/graphics/entity/plants/"..plant[1].."/"..plant[1].."-adult-old.png",
					priority = "high",
					width = 256,
					height = 256,
					scale = plant[6],
					shift = plant[9],
				},
			},
		},
		map_color = plant[4],
	}
	table.insert(extend, tmp_element)

	to_filter = {
		{ filter = "name", name = plant[1].."-adult-old-" },
		{ filter = "ghost_name", name = plant[1].."-adult-old" },
	}
	--table.insert(global.foodi.event_entity_filter, to_filter)
	table.insert(event_entity_filter, to_filter)

end

data:extend(extend)

return event_entity_filter


-- local extend = {}
-- local tree = {}
-- local dirt = "dirt-circle"
-- local tint = {r=0.42,g=0.23,b=0.03,a=1.0}
-- local tree_template = {
-- 	type = "tree",
-- 	name = "plant",
-- 	order = "w",
-- 	collision_box = {{-0.2,-0.2},{0.2,0.2}},
-- 	collision_mask = {"item-layer", "object-layer", "water-tile"},
-- 	selection_box = { { -0.35, -0.35 }, { 0.35, 0.35 } },
-- 	darkness_of_burnt_tree = 0.5,
-- 	emissions_per_second = -0.0003,
-- 	flags = {
-- 		"placeable-neutral",
-- 		"breaths-air",
-- 		"placeable-player",
-- 		"player-creation"
-- 	},
-- 	fast_replaceable_group = "seedlings",
-- 	icon = "__FoodIndustry__/graphics/icons/blank-icon.png",
-- 	icon_mipmaps = 4,
-- 	icon_size = 64,
-- 	max_health = 5,
-- 	healing_per_tick = 0,
-- 	repair_speed_modifier = 0,
-- 	minable = {
-- 		mining_particle = "wooden-particle",
-- 		mining_hardness = 1,
-- 		mining_time = 0.6,
-- 		result = "",
-- 		count = 1,
-- 	},
-- 	subgroup = "trees",
-- 	pictures = {
-- 		layers = {
-- 			{
-- 				draw_as_shadow = true,
-- 				filename = "__FoodIndustry__/graphics/entity/plants/blank.png",
-- 				priority = "high",
-- 				width = 256,
-- 				height = 256,
-- 				scale = 1,
-- 				shift = {0.0, 0.0},
-- 			},
-- 			{
-- 				draw_as_shadow = true,
-- 				filename = "__FoodIndustry__/graphics/entity/plants/blank.png",
-- 				priority = "high",
-- 				width = 256,
-- 				height = 256,
-- 				scale = 1,
-- 				shift = {0.0, 0.0},
-- 			},
-- 			{
-- 				draw_as_shadow = true,
-- 				filename = "__FoodIndustry__/graphics/entity/plants/blank.png",
-- 				priority = "high",
-- 				width = 256,
-- 				height = 256,
-- 				scale = 1,
-- 				shift = {0.0, 0.0},
-- 			}
-- 		},
-- 	},
-- 	map_color={r=0.1, g= 0.7, b=0, a=0.9},
-- }
-- local tree_item_template = {
-- 	type = "item",
-- 	name = "plant",
-- 	icon = "__FoodIndustry__/graphics/icons/items/"..plant[1].."-plant.png",
-- 	icon_size = 32,
-- 	subgroup = "plant",
-- 	order = "w-d-X-y",
-- 	stack_size = 10
-- }


-- for i, plant in pairs(plants) do
-- 	-- TODO временно только для wheat, пока не сделаю спрайты на все plants
-- 	if plant[1] == "wheat" then
-- 		dirt = "dirt-lines"
-- 		tint = {r=0.17,g=0.13,b=0.1,a=1.0}

-- 		if trees_variations[plant[1]] then
-- 			--log("FI: "..plant[1])
-- 			--log(serpent.block(trees_variations[plant[1]]))
	
-- 			for vi, variant in pairs(trees_variations[plant[1]]) do
-- 				--TODO add items

-- 				--log("FI: "..vi)
-- 				log("FI: "..variant)
-- 				--tree = {} -- clear tree data

-- 				tree = tree_template
-- 				tree.name = plant[1].."-"..variant
-- 				tree.selection_box = plant[8]
-- 				tree.collision_box = plant[7]
-- 				tree.minable.result = plant[1].."-"..variant
				
-- 				-- TODO icons
-- 				tree.icon = "__FoodIndustry__/graphics/icons/items/"..plant[1]..""..plant[2]..".png"
-- 				tree.icon_size = 32

-- 				tree.pictures.layers[1].filename = "__FoodIndustry__/graphics/entity/plants/"..plant[1].."/"..plant[1].."-"..variant.."-shadow.png"
-- 				tree.pictures.layers[1].width = 256
-- 				tree.pictures.layers[1].height = 256
-- 				tree.pictures.layers[1].scale = plant[6]
-- 				tree.pictures.layers[1].shift = plant[9]

-- 				-- TODO add dirt
-- 				tree.pictures.layers[2].filename = "__FoodIndustry__/graphics/entity/plants/"..dirt..".png"
-- 				tree.pictures.layers[2].width = 256
-- 				tree.pictures.layers[2].height = 256
-- 				tree.pictures.layers[2].scale = plant[6]
-- 				tree.pictures.layers[2].shift = plant[9]
-- 				tree.pictures.layers[2].tint = tint
				
-- 				tree.pictures.layers[3].filename = "__FoodIndustry__/graphics/entity/plants/"..plant[1].."/"..plant[1].."-"..variant..".png"
-- 				tree.pictures.layers[3].width = 256
-- 				tree.pictures.layers[3].height = 256
-- 				tree.pictures.layers[3].scale = plant[6]
-- 				tree.pictures.layers[3].shift = plant[9]

				
-- 				--log(serpent.block(tree))
-- 				table.insert(extend, tree)
-- 			end
-- 		end

-- 	end
-- end
-- --log(tostring(extend))
-- log("FI warning!")
-- log(serpent.block(extend))
-- data:extend(extend)
