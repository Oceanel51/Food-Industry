local ingredients = {
	--1						2				3	4 
	--plant					energy/water	result	icon-size
	{"raw-straw",			3.0,			4,	64},		--3.4
	{"straw",				0.2,			0.1,	64},	--0.06
	{"compressed-straw",	15.0,			6,	64},		--3.0
	{"lettuce",				3.0,			6,	32},		--5.4
	{"cucumber",			4.5,			6,	32},		--5.1
	{"tomato",				2.0,			4,	32},		--3.6
	{"potato",				5.0,			8,	32},		--7.0
	{"corn",				4.0,			8,	32},		--7.2
	{"soy",					0.5,			1,	32},		--0.9
	{"rapeseed",			0.4,			0.4,	32}	--0.32
}


for index, ingredient in pairs(ingredients) do
	data:extend({
		{
			type = "recipe",
			name = "compost-auto-"..ingredient[1],
			enabled = false,
			icon = "__FoodIndustry__/graphics/icons/items/"..ingredient[1]..".png",
			icon_size = ingredient[4],
			category = "auto-composting",
			subgroup = "food-composting",
			energy_required = ingredient[2],
			ingredients = {
				{type = "fluid", name = "compost-water", amount = ingredient[2]*10},
				{ ingredient[1], 1 }
			},
			results = {
				{type = "item", name = "compost", amount = math.max(ingredient[3],1), probability = math.min(ingredient[3],1)}
			},
		}
	})
end
