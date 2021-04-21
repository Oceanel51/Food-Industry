--require "prototypes.scripts.trees_control"
require "prototypes.tables.fi-trees-table"
local trees_variations = trees_variations()
local tree_corpse_flags = {"placeable-neutral", "placeable-off-grid", "not-on-map"}


local trees = {
--1			2					3			4			5			6		7			8		9			10		11		12			13			14									15			16		17		18		19
--name, 	energy_required,	to plant,	results,	cool(sec),	seeds, 	stack size,	plant?,	seed?,	edible?,	straws,	compost,	type,		map_color,							starting,	size,	result,	chance,	energy_required
--											factor																																											for seed/seedling
{"apple", 	1300,				5,			4,			0.1,		3.4, 	10,			true,	true,		true,	3.0,	"3J",		"tree",		{r=1.0, g=0.70, b=0.19, a=0.8},		20,			0.16,	4,		0.25,	295},
{"orange", 	1570, 				8,			5,			0.3,		2.6, 	10,			true,	true,		true,	5.0,	"2J",		"tree",		{r=1.0, g=0.70, b=0.19, a=0.8},		15,			0.16,	6,		0.12,	365},
}


local extend = {}
local tree = {}
-- TODO add stages table example:
local treestagestable = {
	-- 1						2				3				4				5				6				7				8
	-- stage,					mining_time,	emissions sec,	max_health,		fruit factor,	wood result,	mesh rezult,	order
	{"seed",					0.2,			-0.0000,		80,				0,				nil,			0				},
	{"seedling",				0.2,			-0.0002,		40,				0,				nil,			0				},
	{"sapling",					0.3,			-0.0006,		60,				0,				nil,			0				},
	{"young-tree",				2,				-0.0012,		100,			0,				{4, 4},			5				},
	{"young-tree-blooming-1",	2,				-0.0012,		100,			0,				{6, 10},		12				},
	{"young-tree-blooming-2",	2,				-0.0012,		100,			0,				{6, 10},		8				},
	{"young-tree-blooming-3",	2,				-0.0012,		100,			0,				{6, 10},		5				},
	{"young-tree-ripening-1",	2,				-0.0012,		100,			0.3,			{6, 10},		14				},
	{"young-tree-ripening-2",	2,				-0.0012,		100,			0.2,			{6, 10},		10				},
	{"young-tree-ripening-3",	2,				-0.0012,		100,			0.1,			{6, 10},		8				},
	{"young-tree-harvesting-1",	2,				-0.0012,		100,			1,				{6, 10},		15				},
	{"young-tree-harvesting-2",	2,				-0.0012,		100,			0.8,			{6, 10},		12				},
	{"young-tree-harvesting-3",	2,				-0.0012,		100,			0.6,			{6, 10},		10				},
	{"young-sick-tree",			0.45,			0,				25,				0,				{3, 4},			0				},
	{"young-sick-old-tree",		0.45,			0,				15,				0,				{3, 4},			0				},
	{"young-old-tree",			0.45,			0,				20,				0,				{2, 4},			0				},
	
	{"adult-tree",				2.5,			-0.002,			150,			2,				{8, 15},		15				},
	{"adult-sick-tree",			0.9,			0,				50,				0,				{6, 8},			0				},
	{"adult-sick-old-tree",		0.9,			0,				30,				0,				{3, 4},			0				},
	{"adult-old-tree",			0.9,			0,				40,				0,				{4, 4},			0				},
	-- "blooming-tree", 1, 2, 3
	-- "green-tree", 1, 2, 3
	-- "fertile-tree", 1, 2, 3
	-- "sick-tree",
	-- "old-sick-tree",
	-- "old-tree".
}


local sounds = require("__base__.prototypes.entity.sounds")
local leaf_sound = sounds.tree_leaves
local leaf_sound_trigger = 
{
  {
    type = "play-sound",
    sound = leaf_sound,
    damage_type_filters = "fire"
  }
}
local axe_hitting_wood_trigger =
{
  {
    type = "play-sound",
    sound = data.raw["utility-sounds"].default.mining_wood
  }
}


for index, crop in pairs(trees) do
	data:extend({
		-- Fruits
		-- {
		-- 	type = "item",
		-- 	name = crop[1].."-"..crop[13],
		-- 	icon = "__FoodIndustry__/graphics/icons/trees/"..crop[1].."-"..crop[13]..".png",
		-- 	icon_size = 32,

		-- 	subgroup = crop[1],
		-- 	order = "w-e-"..index.."-y",
		-- 	stack_size = 10
		-- },
		-- recipe when click on -fertile-tree
		{
			type = "recipe",
			name = crop[1].."-pick",
			subgroup = crop[1],
			order = "w-e-b-y",
			enabled = false,
			hidden = true,
			icon = "__FoodIndustry__/graphics/icons/foods/"..crop[1]..".png",
			icon_size = 64,
			category = "crafting",
			energy_required = 0.75,
			ingredients =
			{
			},
			results =
			{
				{type = "item", name = "wood", amount = 1, probability = 0.15},
				{type = "item", name = "raw-straw", amount = 1, probability = 0.5},
				--{type = "item", name = crop[1], amount_min = 1, amount_max = 2}
				{type = "item", name = crop[1], amount = 1, probability = math.floor(crop[18])}
			}
		},
	})

	-- item subgroup
	data:extend({
		{
			type = "item-subgroup",
			name = crop[1],
			group = "food-industry-foods",
			order = "w-f-"..index,
		},
	})

	-- Fruit seeds item, recipe
	data:extend({
		{
			type = "item",
			name = crop[1].."-seeds",
			icon = "__FoodIndustry__/graphics/icons/trees/"..crop[1].."-seeds.png",
			icon_size = 64,

			subgroup = crop[1],
			order = "w-d-"..crop[1].."-x",
			place_result=crop[1].."-seed",
			stack_size = 50
		},
		-- Fruit seeds recipe
		{
			type = "recipe",
			name = crop[1].."-seeds",
			order = "w-d-"..crop[1].."-x",
			enabled = true,
			icon = "__FoodIndustry__/graphics/icons/trees/"..crop[1].."-seeds.png",
			icon_size = 64,
			category = "crafting",
			subgroup = crop[1],
			energy_required = 0.75,
			ingredients =
			{
				{crop[1], 1}
			},
			results = 
			{
				{type = "item", name = crop[1].."-seeds", amount_min = math.floor(crop[6]-0.4), amount_max = math.floor(crop[6]+1.4)}
			}
	},
	})

	-- Fruit capsule (as food)
	data:extend({
		{
			type = "capsule",
			name = crop[1],
			icon = "__FoodIndustry__/graphics/icons/foods/"..crop[1]..".png",
			icon_size = 64,

			subgroup = crop[1],
			order = "w-d-"..crop[1].."-y",
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
					cooldown = crop[5]*60,
					range = 0,
					type = "projectile"
				},
				type = "use-on-self"
			},
			fuel_category = "plant",
			fuel_value = crop[12],
		},
	})

	-- seedlings
	data:extend({

		--------------- seedling item
		{
			type = "item",
			name = crop[1].."-seedling",
			icon = "__FoodIndustry__/graphics/icons/trees/"..crop[1].."-seedling-icon.png",
			icon_mipmaps = 4,
			icon_size = 64,
			subgroup = crop[1],
			order = crop[1].."-2-a",
			place_result=crop[1].."-seedling",
			fuel_value = "1MJ",
			fuel_category = "chemical",
			stack_size= 20
		},
		----------------- sapling item
		{
			type = "item",
			name = crop[1].."-sapling",
			icon = "__FoodIndustry__/graphics/icons/trees/"..crop[1].."-sapling-icon.png",
			icon_mipmaps = 4,
			icon_size = 64,
			subgroup = crop[1],
			order = crop[1].."-3-a",
			place_result=crop[1].."-sapling",
			fuel_value = "2MJ",
			fuel_category = "chemical",
			stack_size= 10
		},
		-- {
		-- 	type = "land-mine",
		-- 	name = crop[1].."-seedling",
		-- 	icon = "__FoodIndustry__/graphics/icons/trees/"..crop[1].."-seedling-icon.png",
		-- 	icon_size = 32,
		-- 	order = "b",
		-- 	flags = {"placeable-neutral", "placeable-player", "player-creation", "breaths-air",},
		-- 	minable =
		-- 	{
		-- 		mining_particle = "wooden-particle",
		-- 		mining_time = 0.45,
		-- 		result = crop[1].."-seedling",
		-- 		count = 1
		-- 	},
		-- 	emissions_per_second = -0.0006 * 60,
		-- 	max_health = 40,
		-- 	collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
		-- 	selection_box = {{-0.35, -0.35}, {0.35, 0.35}},
		-- 	subgroup = "intermediate-product",
		-- 	vehicle_impact_sound = { filename = "__base__/sound/car-wood-impact.ogg", volume = 1.0 },
		-- 	picture_safe =
		-- 	{
		-- 		filename = "__FoodIndustry__/graphics/entity/trees/"..crop[1].."-seedling-safe.png",
		-- 		priority = "extra-high",
		-- 		width = 64,
		-- 		height = 52,
		-- 		--size = 0.8,
		-- 		shift = {0.39, -0.662},
		-- 	},
		-- 	picture_set =
		-- 	{
		-- 		filename = "__FoodIndustry__/graphics/entity/trees/"..crop[1].."-seedling.png",
		-- 		priority = "extra-high",
		-- 		width = 64, -- TODO check sizes
		-- 		height = 52,
		-- 		--size = 0.8,
		-- 		shift = {0.39, -0.662},
		-- 	},
		-- 	trigger_radius = 0,
		-- },

	})

	data:extend({
		-- seedling growing recipes
		{
			type = "recipe",
			name = crop[1].."-growth-seedling",
			enabled = false,
			icon = "__FoodIndustry__/graphics/icons/trees/"..crop[1].."-seedling-icon.png",
			icon_size = 64,
			category = "basic-crop-growth",
			subgroup = crop[1],
			order = "w-d-"..crop[1].."-a",
			energy_required = crop[19],
			ingredients =
			{
				{type="item", name=crop[1].."-seeds", amount=crop[3]},
			},
			  results = 
			{
				{type="item", name=crop[1].."-seedling", amount_min=0, amount_max=crop[3]},
				{type="item", name=crop[1].."-seedling", amount=1, probability = 0.5},
				{type="item", name=crop[1].."-seedling", amount=1, probability = 0.4},
				{type="item", name="straw", amount_min=crop[11]*9, amount_max=crop[11]*17},
				{type="item", name="raw-straw", amount_min=crop[11]*2.8, amount_max=crop[11]*4.2},
			},
			allow_as_intermediate = false,
		},	
		{
			type = "recipe",
			name = crop[1].."-basic-growth-seedling",
			icon = "__FoodIndustry__/graphics/icons/trees/"..crop[1].."-seedling-icon.png",
			icon_size = 64,
			category = "basic-tree-growth",
			subgroup = crop[1],
			order = "w-d-"..crop[1].."-b",
			energy_required = crop[19] / 1.2,
			ingredients =
			{
				{type="item", name=crop[1].."-seeds", amount=crop[3]},
				{type = "fluid", name = "water", amount = 500},
			},
			results=
			{
				{type="item", name=crop[1].."-seedling", amount_min=crop[3]/2, amount_max=crop[3]},
				{type="item", name=crop[1].."-seedling", amount=1, probability=0.7},
				{type="item", name=crop[1].."-seedling", amount=1, probability=0.5},
				{type="item", name="raw-straw", amount_min=crop[11]*1.8, amount_max=crop[11]*3.2},
			},
			enabled = false,
			always_show_made_in = true,
			allow_decomposition = false,
		},
		{
			type = "recipe",
			name = crop[1].."-advanced-growth-seedling",
			icon = "__FoodIndustry__/graphics/icons/trees/"..crop[1].."-seedling-icon.png",
			icon_size = 64,
			category = "advanced-tree-growth",
			subgroup = crop[1],
			order = "w-d-"..crop[1].."-c",
			energy_required = crop[19] / 1.4,
			ingredients =
			{
				{type="item", name=crop[1].."-seeds", amount=crop[3]},
				{type = "fluid", name = "compost-water", amount = 800},
			},
			results=
			{
				{type="item", name=crop[1].."-seedling", amount=crop[3]},
				{type="item", name=crop[1].."-seedling", amount=1, probability=0.8},
				{type="item", name=crop[1].."-seedling", amount=1, probability=0.6},
			},
			enabled = false,
			always_show_made_in = true,
			allow_decomposition = false,
		},
		
	})
	table.insert(data.raw.technology["trees-growth-1"].effects,{recipe = crop[1].."-growth-seedling", type = "unlock-recipe"})
	table.insert(data.raw.technology["trees-growth-2"].effects,{recipe = crop[1].."-basic-growth-seedling", type = "unlock-recipe"})

	data:extend({
		-- wild tree
		{
			type = "corpse",
			name = crop[1].."-wild-tree-stump",
			icon = "__FoodIndustry__/graphics/icons/trees/"..crop[1].."-wild-tree-stump-icon.png",
			icon_size = 64, icon_mipmaps = 4,
			flags = tree_corpse_flags,
			collision_box = {{-0.2, -0.2}, {0.2, 0.2}},
			selection_box = {{-0.4, -0.4}, {0.4, 0.4}},
			tile_width = 1,
			tile_height = 1,
			selectable_in_game = false,
			time_before_removed = 60 * 60 * 3, -- 3 minutes
			final_render_layer = "remnants",
			subgroup = "remnants",
			order = crop[1].."-0-p-wild",
			animation = {
				{
					filename = "__FoodIndustry__/graphics/entity/trees/"..crop[1].."/"..crop[1].."-tree-stump.png",
					priority = "high",
					width = 945,
					height = 771,
					frame_count = 1,
					direction_count = 1,
					scale = crop[16],
					shift = {0.89, -1.71},
					--hr_version = util.table.deepcopy(variation.stump.hr_version)
				},
			}
		},
		{
			type = "tree",
			name = crop[1].."-wild-tree",
			icon = "__FoodIndustry__/graphics/icons/trees/"..crop[1].."-tree.png",
			icon_size = 32,
			order = crop[1].."-0-o-wild",
			autoplace = {
				control = "food-plant",
				max_probability = 0.006,
				coverage = 0.0003,
				order = "c",
				peaks = {
					{
						noise_layer = "wild-"..crop[1],
						noise_octaves_difference = -0.85,
						noise_persistence = 0.4
					}
				},
				sharpness = 0.9375,
				starting_area_amount = 1600,
				starting_area_size = crop[15]
			},
			collision_box = {{-0.2, -0.2}, {0.2, 0.2}},
			collision_mask = {"item-layer", "object-layer", "water-tile"},
			darkness_of_burnt_tree = 0.5,
			emissions_per_second = -0.001 * 60,
			flags = {
				"placeable-neutral",
				"placeable-off-grid",
				"breaths-air"
			},
			max_health = 120,
			healing_per_tick = 0.001,
			repair_speed_modifier = 0,
			minable = {
				mining_particle = "wooden-particle",
				mining_hardness = 1,
				mining_time = 3.5,
				count = crop[17],
				results = {
					{type = "item", name = "wood", amount_min = 6, amount_max = 12},
					--{type = "item", name = "raw-straw", amount = 3, probability = 0.8},
					{type = "item", name = "raw-straw", amount_min = 15, amount_max = 45},
					{type = "item", name = crop[1], amount_min = math.floor(crop[17]), amount_max = math.floor(crop[17]*1.6) }
				},
			},
			corpse = crop[1].."-wild-tree-stump",
			damaged_trigger_effect = leaf_sound_trigger,
			mined_sound = leaf_sound,
			remains_when_mined = crop[1].."-wild-tree-stump",
			selection_box = { {-0.4,-0.4}, {0.4,0.4} },
			subgroup = "trees",
			pictures = {
				layers = {
					{
						filename = "__FoodIndustry__/graphics/entity/trees/"..crop[1].."/"..crop[1].."-wild-tree.png",
						priority = "high",
						width = 945,
						height = 771,
						scale = crop[16],
						shift = {0.89, -1.71},
					},
					{
						draw_as_shadow = true,
						filename = "__FoodIndustry__/graphics/entity/trees/"..crop[1].."/"..crop[1].."-wild-tree-shadow.png",
						priority = "high",
						width = 945,
						height = 771,
						scale = crop[16],
						shift = {0.89, -1.71},
					}
				},
			},
			map_color=crop[14],
		},

		{
			type = "noise-layer",
			name = "wild-"..crop[1]
		}
	})

	-------------------------------- TODO trees entities
	-- TODO попробовать сделать (3) типа tree и менять ему pictures:
	-- + 1. wild - на карте при старте,
	-- - 2. tree - управлять им в global.foodi.fruitSeedlings,
	--   - [1] trunk
	--   - [2] leaves
	--   - [3] shadow
	--   - 1, 2, 3 ripening stage
	-- - 3. old - после плодоносия оставлять на карте

	---extend = {}
	---for i1, stage in pairs(treestagestable) do
	---
	---	tree = table.deepcopy(data.raw.tree["tree-01"])
	---
	---	tree.name = crop[1].."-"..stage[1],
	---	tree.icon = "__FoodIndustry__/graphics/icons/trees/"..crop[1].."-tree.png",
	---	tree.icon_mipmaps = 4,
	---	tree.icon_size = 64,
	---	tree.emissions_per_second = stage[3],
	---	tree.max_health = stage[4],
	---	if string.match(stage[1], "seedling$") == "seedling" or string.match(stage[1], "sapling$") == "sapling" then
	---		order = "b"..i1,
	---		tree.flags = {"placeable-neutral", "placeable-player", "player-creation", "breaths-air",},
	---		tree.minable =
	---		{
	---			mining_particle = "wooden-particle",
	---			mining_time = 0.45,
	---			result = crop[1].."-"..stage[1],
	---			count = 1
	---		},
	---		tree.collision_box = {{-0.2, -0.2}, {0.2, 0.2}},
	---		tree.selection_box = {{-0.35, -0.35}, {0.35, 0.35}},
	---		tree.subgroup = "intermediate-product",
	---	else
	---		order = "w",
	---		tree.flags = {"placeable-neutral", "placeable-off-grid", "breaths-air", "placeable-player", "player-creation"},
	---		tree.minable = {
	---			mining_particle = "wooden-particle",
	---			mining_hardness = 1,
	---			mining_time = 2.5,
	---			count = crop[17],
	---			results = {
	---				{type = "item", name = "wood", amount_min = stage[6][1], amount_max = stage[6][2]},
	---				{type = "item", name = "raw-straw", amount = stage[7], probability = 0.8},
	---				{type = "item", name = crop[1], amount_min = math.floor(crop[17*stage[5]]), amount_max = math.floor(crop[17]*stage[5]*2.2) }
	---			},
	---		},
	---		tree.collision_box = {{-0.2, -0.2}, {0.2, 0.2}},
	---		tree.selection_box = { { -0.4, -0.4 }, { 0.4, 0.4 } },
	---		tree.subgroup = "trees",
	---		tree.map_color={r=1, g=0.533333333, b=0},
	---	end
	---	tree.pictures = {
	---		{
	---			filename = "__FoodIndustry__/graphics/entity/trees/"..crop[1].."/"..crop[1].."-"..stage[1],
	---			priority = "high",
	---			width = 945,
	---			height = 771,
	---			scale = crop[16],
	---			shift = {0.89, -1.71},
	---		}
	---	},
	---
	---	table.insert(extend, tree)
	---	
	---end
	---data:extend(extend)

	-- TODO delete old trees
	data:extend({
		-- {
		-- 	type = "land-mine",
		-- 	name = crop[1].."-sapling-lm",
		-- 	icon = "__FoodIndustry__/graphics/icons/trees/"..crop[1].."-sapling-icon.png",
		-- 	icon_size = 32,
		-- 	order = "b",
		-- 	flags = {"placeable-neutral", "placeable-player", "player-creation", "breaths-air",},
		-- 	minable =
		-- 	{
		-- 		mining_particle = "wooden-particle",
		-- 		mining_time = 0.45,
		-- 		result = crop[1].."-sapling",
		-- 		count = 1
		-- 	},
		-- 	emissions_per_second = -0.0010 * 60,
		-- 	max_health = 40,
		-- 	collision_box = {{-0.2, -0.2}, {0.2, 0.2}},
		-- 	selection_box = {{-0.35, -0.35}, {0.35, 0.35}},
		-- 	subgroup = "intermediate-product",
		-- 	vehicle_impact_sound = { filename = "__base__/sound/car-wood-impact.ogg", volume = 1.0 },
		-- 	picture_safe =
		-- 	{
		-- 		filename = "__FoodIndustry__/graphics/entity/trees/"..crop[1].."-sapling-safe.png",
		-- 		priority = "extra-high",
		-- 		width = 64,
		-- 		height = 52,
		-- 		--size = 0.8,
		-- 		shift = {0.39, -0.662},
		-- 	},
		-- 	picture_set =
		-- 	{
		-- 		filename = "__FoodIndustry__/graphics/entity/trees/"..crop[1].."-sapling.png",
		-- 		priority = "extra-high",
		-- 		width = 64, -- TODO check sizes
		-- 		height = 52,
		-- 		--size = 0.8,
		-- 		shift = {0.39, -0.662},
		-- 	},
		-- 	trigger_radius = 0,
		-- },

		{
			type = "tree",
			name = crop[1].."-seed",
			order = crop[1].."-1-a",
			collision_box = {{-0.2,-0.2},{0.2,0.2}},
			collision_mask = {"item-layer", "object-layer", "water-tile"},
			selection_box = { { -0.35, -0.35 }, { 0.35, 0.35 } },
			darkness_of_burnt_tree = 0.2,
			emissions_per_second = -0.0003,
			flags = {
				"placeable-neutral",
				"breaths-air",
				"placeable-player",
				"player-creation"
			},
			fast_replaceable_group = "seedlings",
			icon = "__FoodIndustry__/graphics/icons/trees/"..crop[1].."-seed-icon.png",
			icon_mipmaps = 4,
			icon_size = 64,
			max_health = 80,
			healing_per_tick = 0,
			repair_speed_modifier = 0,
			minable = {
				mining_particle = "wooden-particle",
				mining_hardness = 1,
				mining_time = 0.6,
				result = crop[1].."-seeds",
				count = 1,
			},
			subgroup = "trees",
			pictures = {
				layers = {
					{
						filename = "__FoodIndustry__/graphics/entity/trees/"..crop[1].."/"..crop[1].."-dirt.png",
						priority = "high",
						width = 945,
						height = 771,
						scale = crop[16],
						shift = {0.89, -1.71},
					},
					{
						draw_as_shadow = true,
						filename = "__FoodIndustry__/graphics/entity/trees/"..crop[1].."/"..crop[1].."-seed-shadow.png",
						priority = "high",
						width = 945,
						height = 771,
						scale = crop[16],
						shift = {0.89, -1.71},
					}
				},
			},
			map_color={r=0.1647, g=1, b=0},
			created_smoke = nil,
			-- created_effect = nil
		},
		{
			type = "tree",
			name = crop[1].."-seedling",
			order = crop[1].."-2-a",
			collision_box = {{-0.2,-0.2},{0.2,0.2}},
			collision_mask = {"item-layer", "object-layer", "water-tile"},
			selection_box = { { -0.35, -0.35 }, { 0.35, 0.35 } },
			darkness_of_burnt_tree = 0.2,
			emissions_per_second = -0.0003,
			flags = {
				"placeable-neutral",
				"breaths-air",
				"placeable-player",
				"player-creation"
			},
			fast_replaceable_group = "seedlings",
			icon = "__FoodIndustry__/graphics/icons/trees/"..crop[1].."-seedling-icon.png",
			icon_mipmaps = 4,
			icon_size = 64,
			max_health = 30,
			healing_per_tick = 0,
			repair_speed_modifier = 0,
			minable = {
				mining_particle = "wooden-particle",
				mining_hardness = 1,
				mining_time = 0.6,
				result = crop[1].."-seedling",
				count = 1,
			},
			subgroup = "trees",
			pictures = {
				layers = {
					{
						filename = "__FoodIndustry__/graphics/entity/trees/"..crop[1].."/"..crop[1].."-seedling.png",
						priority = "high",
						width = 945,
						height = 771,
						scale = crop[16],
						shift = {0.89, -1.71},
					},
					{
						filename = "__FoodIndustry__/graphics/entity/trees/"..crop[1].."/"..crop[1].."-dirt.png",
						priority = "high",
						width = 945,
						height = 771,
						scale = crop[16],
						shift = {0.89, -1.71},
					},
					{
						draw_as_shadow = true,
						filename = "__FoodIndustry__/graphics/entity/trees/"..crop[1].."/"..crop[1].."-seedling-shadow.png",
						priority = "high",
						width = 945,
						height = 771,
						scale = crop[16],
						shift = {0.89, -1.71},
					}
				},
			},
			map_color={r=0.1647, g=1, b=0},
		},
		{
			type = "tree",
			name = crop[1].."-sapling",
			order = crop[1].."-3-a",
			collision_box = {{-0.2,-0.2},{0.2,0.2}},
			collision_mask = {"item-layer", "object-layer", "water-tile", "player-layer"},
			selection_box = { { -0.35, -0.35 }, { 0.35, 0.35 } },
			darkness_of_burnt_tree = 0.3,
			emissions_per_second = -0.0006,
			flags = {
				"placeable-neutral",
				"placeable-off-grid",
				"breaths-air",
				"placeable-player",
				"player-creation"
			},
			fast_replaceable_group = "seedlings",
			icon = "__FoodIndustry__/graphics/icons/trees/"..crop[1].."-sapling-icon.png",
			icon_size = 64,
			icon_mipmaps = 4,
			max_health = 40,
			healing_per_tick = 0,
			repair_speed_modifier = 0,
			minable = {
				mining_particle = "wooden-particle",
				mining_hardness = 1,
				mining_time = 0.7,
				result = crop[1].."-sapling",
				count = 1,
			},
			subgroup = "trees",
			pictures = {
				layers = {
					{
					filename = "__FoodIndustry__/graphics/entity/trees/"..crop[1].."/"..crop[1].."-sapling.png",
					priority = "high",
					width = 945,
					height = 771,
					scale = crop[16],
					shift = {0.89, -1.71},
					},
					{
						filename = "__FoodIndustry__/graphics/entity/trees/"..crop[1].."/"..crop[1].."-dirt.png",
						priority = "high",
						width = 945,
						height = 771,
						scale = crop[16],
						shift = {0.89, -1.71},
					},
					{
						draw_as_shadow = true,
						filename = "__FoodIndustry__/graphics/entity/trees/"..crop[1].."/"..crop[1].."-sapling-shadow.png",
						priority = "high",
						width = 945,
						height = 771,
						scale = crop[16],
						shift = {0.89, -1.71},
					}
				},
			},
			map_color={r=0.1647, g=0.760784, b=0},
		},
		--------------------- young trees
		{
			type = "tree",
			name = crop[1].."-young-1",
			order = crop[1].."-4-a",
			collision_box = {{-0.2,-0.2},{0.2,0.2}},
			collision_mask = {"item-layer", "object-layer", "water-tile", "player-layer"},
			selection_box = {{-0.4, -0.4}, {0.4, 0.4}},
			darkness_of_burnt_tree = 0.5,
			emissions_per_second = -0.0012,
			flags = {
				"placeable-neutral",
				"placeable-off-grid",
				"breaths-air",
				"placeable-player",
				"player-creation"
			},
			icon = "__FoodIndustry__/graphics/icons/trees/"..crop[1].."-young-tree-icon.png",
			icon_size = 64,
			icon_mipmaps = 4,
			max_health = 100,
			healing_per_tick = 0,
			repair_speed_modifier = 0,
			minable = {
				mining_particle = "wooden-particle",
				mining_hardness = 1,
				mining_time = 1.5,
				-- result = crop[1].."-sapling",
				-- count = 1,
				results = {
					{type = "item", name = "wood", amount_min = crop[4]*2, amount_max = crop[4]*4},
					{type = "item", name = "raw-straw", amount = 5, probability = 0.9},
					--{type = "item", name = crop[1], amount_min = math.floor(crop[17]), amount_max = math.floor(crop[17]*2.2) }
				},
			},
			subgroup = "trees",
			pictures = {
				layers = {
					{
						draw_as_shadow = true,
						filename = "__FoodIndustry__/graphics/entity/trees/"..crop[1].."/"..crop[1].."-young-tree-shadow.png",
						priority = "high",
						width = 945,
						height = 771,
						scale = crop[16],
						shift = {0.89, -1.71},
					},
					{
						filename = "__FoodIndustry__/graphics/entity/trees/"..crop[1].."/"..crop[1].."-dirt.png",
						priority = "high",
						width = 945,
						height = 771,
						scale = crop[16],
						shift = {0.89, -1.71},
					},
					{
					filename = "__FoodIndustry__/graphics/entity/trees/"..crop[1].."/"..crop[1].."-young-tree.png",
					priority = "high",
					width = 945,
					height = 771,
					scale = crop[16],
					shift = {0.89, -1.71},
					}
				},
			},
			map_color={r=1, g=0.533333333, b=0},
		},
		
		--------------------- adult trees
		{
			type = "corpse",
			name = crop[1].."-tree-stump",
			icon = "__FoodIndustry__/graphics/icons/trees/"..crop[1].."-tree-stump-icon.png",
			icon_size = 64, icon_mipmaps = 4,
			flags = tree_corpse_flags,
			collision_box = {{-0.2, -0.2}, {0.2, 0.2}},
			selection_box = {{-0.4, -0.4}, {0.4, 0.4}},
			tile_width = 1,
			tile_height = 1,
			selectable_in_game = false,
			time_before_removed = 60 * 60 * 5, -- 5 minutes
			final_render_layer = "remnants",
			subgroup = "remnants",
			order = crop[1].."-5-h",
			animation = {
				layers = {
					{
						filename = "__FoodIndustry__/graphics/entity/trees/"..crop[1].."/"..crop[1].."-dirt.png",
						priority = "high",
						width = 945,
						height = 771,
						frame_count = 1,
						direction_count = 1,
							scale = crop[16],
						shift = {0.89, -1.71},
					},
					{
						filename = "__FoodIndustry__/graphics/entity/trees/"..crop[1].."/"..crop[1].."-tree-stump.png",
						priority = "high",
						width = 945,
						height = 771,
						frame_count = 1,
						direction_count = 1,
							scale = crop[16],
						shift = {0.89, -1.71},
					},
				},
			}
		},
		{
			type = "tree",
			name = crop[1].."-adult-1",
			order = crop[1].."-5-g",
			subgroup = "trees",
			selection_box = {{-0.4, -0.4}, {0.4, 0.4}},
			collision_box = {{-0.2,-0.2},{0.2,0.2}},
			collision_mask = {"item-layer", "object-layer", "water-tile", "player-layer"},
			darkness_of_burnt_tree = 0.5,
			emissions_per_second = -0.001 * 60,
			flags = {
				"placeable-neutral",
				"placeable-off-grid",
				"breaths-air",
				"placeable-player",
				"player-creation"
			},
			icon = "__FoodIndustry__/graphics/icons/trees/"..crop[1].."-tree.png",
			icon_size = 32,
			max_health = 150,
			healing_per_tick = 0,
			repair_speed_modifier = 0,
			minable = {
				mining_particle = "wooden-particle",
				mining_hardness = 1,
				mining_time = 2.5,
				count = crop[17],
				results = {
					{type = "item", name = "wood", amount_min = crop[4]*3, amount_max = crop[4]*6},
					{type = "item", name = "raw-straw", amount = 3, probability = 0.8},
					{type = "item", name = crop[1], amount_min = math.floor(crop[17]), amount_max = math.floor(crop[17]*3) }
				},
				mining_trigger = {
					{
						type = "direct",
						action_delivery =
						{
							{
								type = "instant",
								target_effects = leaf_sound_trigger
							},
							{
								type = "instant",
								target_effects = axe_hitting_wood_trigger
							}
						}
					}
				},
			},
			corpse = crop[1].."-tree-stump",
			damaged_trigger_effect = leaf_sound_trigger,
			mined_sound = leaf_sound,
			remains_when_mined = crop[1].."-tree-stump",
			pictures = {
				-- {
				-- 	filename = "__FoodIndustry__/graphics/entity/trees/"..crop[1].."/"..crop[1].."-fertile-tree.png",
				-- 	priority = "high",
				-- 	width = 945,
				-- 	height = 771,
				-- 	scale = crop[16],
				-- 	shift = {0.89, -1.71},
				-- },
				layers = {
					{
						draw_as_shadow = true,
						filename = "__FoodIndustry__/graphics/entity/trees/"..crop[1].."/"..crop[1].."-tree-shadow.png",
						priority = "high",
						width = 945,
						height = 771,
						scale = crop[16],
						shift = {0.89, -1.71},
					},
					{
						filename = "__FoodIndustry__/graphics/entity/trees/"..crop[1].."/"..crop[1].."-dirt.png",
						priority = "high",
						width = 945,
						height = 771,
						scale = crop[16],
						shift = {0.89, -1.71},
					},
					{
					filename = "__FoodIndustry__/graphics/entity/trees/"..crop[1].."/"..crop[1].."-fertile-tree-1.png",
					priority = "high",
					width = 945,
					height = 771,
					scale = crop[16],
					shift = {0.89, -1.71},
					}
				},
			},
			map_color={r=1, g=0.53, b=0},
			build_effect_smoke = false,
		},
	})

end
