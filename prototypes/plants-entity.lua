local plants = {
--1,			2,			3,					4,								5,			6		7								8								9			
--name,			suffix,		autoplace-control,	map_color,						starting,	size,	collision_box,					selection_box,					shift,		
{"lettuce", 	"",			"food-plant",		{r=0.1, g= 0.7, b=0, a=0.9},	15,			0.4,	{{-0.2,-0.2},{0.2,0.2}},		{{-0.4, -0.4}, {0.4, 0.4}},		{0.0, 0.0}	},
{"cucumber",	"-plant",	"food-plant",		{r=0.1, g= 0.7, b=0, a=0.9},	15,			0.4,	{{-0.6,-0.4},{0.2,0.0}},		{{-1.0, -0.6}, {0.4, 0.1}},		{0.0, 0.0}	},
{"tomato", 		"-plant",	"food-plant",		{r=0.1, g= 0.7, b=0, a=0.9},	15,			0.32,	{{-0.15,-0.2},{0.15,0.2}},		{{-0.35, -1.0}, {0.35, 0.1}},	{0.0, 0.0}	},
{"potato", 		"-plant",	"food-plant",		{r=0.1, g= 0.7, b=0, a=0.9},	0,			0.35,	{{-0.2,-0.2},{0.2,0.2}},		{{-0.35, -0.8}, {0.35, 0.3}},	{0.0, 0.0}	},
{"corn", 		"-plant",	"food-plant",		{r=0.1, g= 0.7, b=0, a=0.9},	0,			0.46,	{{-0.15,-0.2},{0.15,0.2}},		{{-0.35, -1.2}, {0.35, 0.1}},	{0.0, 0.0}	},
{"soy", 		"-plant",	"food-plant",		{r=0.1, g= 0.7, b=0, a=0.9},	0,			0.3,	{{-0.15,-0.2},{0.15,0.2}},		{{-0.35, -1.1}, {0.35, 0.1}},	{0.0, 0.0}	},
{"rapeseed", 	"-plant",	"oil-plant",		{r=0.1, g= 0.7, b=0, a=0.9},	0,			0.3,	{{-0.15,-0.2},{0.15,0.2}},		{{-0.35, -1.1}, {0.35, 0.1}},	{0.0, 0.0}	},
}


-- wild plants
for i, plant in pairs(plants) do

data:extend({
	{
		type = "tree",
		name = plant[1].."-plant",
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
			starting_area_amount = 1600,
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
		icon = "__FoodIndustry__/graphics/icons/plants/"..plant[1]..""..plant[2]..".png",
		icon_size = 32,
		max_health = 5,
		minable = {
			count = 1,
			mining_hardness = 0.1,
			mining_time = 0.5,
			result = plant[1]..""..plant[2]
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
	},

	{
		type = "noise-layer",
		name = "wild-"..plant[1]
	}

})
end

