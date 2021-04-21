local utils = require("__FoodIndustry__/libs/util")

local crops = {
--1				2		3				4		5		6		7			8		9			10		11		12					13
--name,			time,	ingredients,	plants,	result,	seeds, 	stack size,	plant?,	seed?,	edible?,	straws,	fuel for compost,	stack
{"lettuce",		300,	5,				6,		0.6, 	0.0, 	10,			false,	false,		true,	1.1,	"4J",				},
{"cucumber",	600,	60,				4,		2.4, 	8.5, 	10,			true,	true,		true,	2.7,	"8J",				120},
{"tomato",		800,	30,				6,		3.2, 	2.8, 	10,			true,	true,		true,	2.3,	"6J",				90},
{"potato",		1200,	8,				10,		1.0, 	0.0, 	10,			true,	false,		false,	4.0,	"10J",				},
{"corn",		1200,	35,				4,		3.7, 	4.5, 	10,			true,	true,		true,	3.5,	"10J",				35*3},
{"soy",			2400,	50,				6,		9.8, 	0.0, 	50,			true,	false,		false,	6.0,	"3J",				},
{"rapeseed",	900,	90,				8,		11.5, 	0.0, 	100,		true,	false,		false,	6.0,	"1J",				},
}

for index, crop in pairs(crops) do
	local ing = ""
	local str = ""
	if crop[8] then
		str = "-plant"
		data:extend({
			{
				type = "item",
				name = crop[1].."-plant",
				icon = "__FoodIndustry__/graphics/icons/plants/"..crop[1].."-plant.png",
				icon_size = 32,

				subgroup = crop[1],
				order = "w-d-"..index.."-y",
				stack_size = 10
			},
			{
				type = "recipe",
				name = crop[1],
				order = "w-d-b-x",
				enabled = true,
				icon = "__FoodIndustry__/graphics/icons/items/"..crop[1]..".png",
				icon_size = 32,
				category = "crafting",
				subgroup = crop[1],
				energy_required = 2.0,
				main_product = "",
				ingredients =
				{
					{crop[1].."-plant", 1}
				},
				  results = 
				{
					{type = "item", name = crop[1], amount_min = math.floor(crop[5]-0.4), amount_max = math.floor(crop[5]+1.4)},
					{type = "item", name = "raw-straw", amount = 3, probability = 0.8},
					{type = "item", name = "straw", amount_min = 1, amount_max = 2},
				}
			},
		})	
	end
	if crop[9] then
		ing = "-seeds"
		data:extend({		
			{
				type = "item",
				name = crop[1].."-seeds",
				icon = "__FoodIndustry__/graphics/icons/items/"..crop[1].."-seeds.png",
				icon_size = 32,

				subgroup = crop[1],
				order = "w-d-"..index.."-z",
				stack_size = crop[13]
			},
			-- TODO seed like tree
			
			{
				type = "recipe",
				name = crop[1].."-seeds",
				order = "w-d-b-y",
				enabled = true,
				icon = "__FoodIndustry__/graphics/icons/items/"..crop[1].."-seeds.png",
				icon_size = 32,
				category = "crafting",
				subgroup = crop[1],
				energy_required = 0.75,
				ingredients =
				{
					{crop[1], 1}
				},
				  results = 
				{
					{type = "item", name = crop[1].."-seeds", amount_min = math.floor(crop[6]-0.4), amount_max = math.floor(crop[6]+1.4)},
					{type = "item", name = "raw-straw", amount = 1, probability = 0.75},
					{type = "item", name = "straw", amount_min = 1, amount_max = crop[11]*2-1},
				}
			},
		})
	end
	if crop[10] then
		data:extend({
			{
				type = "capsule",
				name = crop[1],
				icon = "__FoodIndustry__/graphics/icons/items/"..crop[1]..".png",
				icon_size = 32,

				subgroup = crop[1],
				order = "w-d-"..index.."-x",
				stack_size = crop[7],
				capsule_action = {
					attack_parameters = {
						ammo_category = "capsule",
						ammo_type = {
							action = {
								action_delivery = {
									target_effects = {
										damage = {
											amount = 0,
											type = "physical"
										},
										type = "damage"
									},
									type = "instant"
								},
								type = "direct"
							},
							category = "capsule",
							target_type = "position"
						},
						cooldown = 30,
						range = 0,
						type = "projectile"
					},
					type = "use-on-self"
				},
				fuel_category = "plant",
				fuel_value = crop[12],
			},
		})
	else
		data:extend({
			{
				type = "item",
				name = crop[1],
				icon = "__FoodIndustry__/graphics/icons/items/"..crop[1]..".png",
				icon_size = 32,

				subgroup = crop[1],
				order = "w-d-"..index.."-x",
				stack_size = crop[7],
				fuel_category = "plant",
				fuel_value = crop[12],
			},
		})
		
	end
	
	
	data:extend({
		{
			type = "item-subgroup",
			name = crop[1],
			group = "food-industry-foods",
			order = "w-d-"..index,
		},
		{
			type = "recipe",
			name = crop[1].."-growth",
			order = "w-d-a-a",
			enabled = false,
			icon = "__FoodIndustry__/graphics/icons/plants/"..crop[1]..str..".png",
			icon_size = 32,
			category = "basic-crop-growth",
			subgroup = crop[1],
			energy_required = crop[2],
			ingredients =
			{
				{crop[1]..ing, crop[3]}
			},
			  results = 
			{
				{type = "item", name = crop[1]..str, amount_min = crop[4], amount_max = crop[4]*1.6},
				{type = "item", name = "straw", amount_min = crop[11]*9, amount_max = crop[11]*17},
				{type = "item", name = "raw-straw", amount_min = crop[11]*2.8, amount_max = crop[11]*4.2},
			},
			allow_as_intermediate = false,
		},	
		
		{
			type = "recipe",
			name = crop[1].."-growth-w",
			order = "w-d-a-b",
			enabled = false,
			icons = utils.mergeIcons("__FoodIndustry__/graphics/icons/plants/"..crop[1]..str..".png", 32, "__base__/graphics/icons/fluid/water.png", 64, 0.25),
			category = "advanced-crop-growth",
			subgroup = crop[1],
			energy_required = crop[2],
			ingredients =
			{
				{crop[1]..ing, crop[3]},
				{type = "fluid", name = "water", amount = 1000}
			},
			  results = 
			{
				{type = "item", name = crop[1]..str, amount_min = crop[4]*1.2, amount_max = crop[4]*2.4},
				{type = "item", name = "straw", amount_min = crop[11]*7, amount_max = crop[11]*9},
				{type = "item", name = "raw-straw", amount_min = crop[11]*4.5, amount_max = crop[11]*6},
			},
			allow_as_intermediate = false,
		},	
		{
			type = "recipe",
			name = crop[1].."-growth-c",
			order = "w-d-a-c",
			enabled = false,
			icons = utils.mergeIcons("__FoodIndustry__/graphics/icons/plants/"..crop[1]..str..".png", 32, "__FoodIndustry__/graphics/icons/fluids/compost-water.png", 32),
			category = "advanced-crop-growth",
			subgroup = crop[1],
			energy_required = crop[2]*0.9,
			ingredients =
			{
				{crop[1]..ing, crop[3]},
				{type = "fluid", name = "compost-water", amount = 1000},
			},
			  results = 
			{
				{type = "item", name = crop[1]..str, amount_min = crop[4]*1.8, amount_max = crop[4]*3.2},
				{type = "item", name = "straw", amount_min = crop[11]*2.4, amount_max = crop[11]*4.5},
				{type = "item", name = "raw-straw", amount_min = crop[11]*0.8, amount_max = crop[11]*2.2},
			},
			allow_as_intermediate = false,
		},
		{
			type = "recipe",
			name = crop[1].."-growth-f",
			order = "w-d-a-d",
			enabled = false,
			icons = utils.mergeIcons("__FoodIndustry__/graphics/icons/plants/"..crop[1]..str..".png", 32, "__FoodIndustry__/graphics/icons/fluids/fertilizer-water.png", 32),
			category = "advanced-crop-growth",
			subgroup = crop[1],
			energy_required = crop[2]*0.625,
			ingredients =
			{
				{crop[1]..ing, crop[3]},
				{type = "fluid", name = "fertilizer-water", amount = 1000}
			},
			  results = 
			{
				{type = "item", name = crop[1]..str, amount_min = crop[4]*2.3, amount_max = crop[4]*4},
				{type = "item", name = "straw", amount_min = crop[11]*0.8, amount_max = crop[11]*1.4},
				{type = "item", name = "raw-straw", amount_min = crop[11]*0.01, amount_max = crop[11]*0.6},
			},
			allow_as_intermediate = false,
		},
	})
end

data.raw.recipe["lettuce-growth"].enabled=true
data.raw.recipe["tomato-growth"].enabled=true
data.raw.recipe["cucumber-growth"].enabled=true
