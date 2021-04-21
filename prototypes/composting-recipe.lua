local ingredients = {
	--1						2				3				4
	--plant					ingredients,	energy/water,	result	?
	-- TODO set compost receipts
	{"raw-straw",			10,				25.0,			25},		--basic
	{"straw",				100,			10.0,			2},			--0
	{"compressed-straw",	1,				15.0,			6},			--0
	--{"lettuce",				0,				3.0,			6},		--5.4
	--{"cucumber",			0,				4.5,			6},		--5.1
	--{"tomato",				0,				2.0,			4},		--3.6
	--{"potato",				0,				5.0,			8},		--7.0
	--{"corn",				0,				4.0,			8},		--7.2
	--{"soy",					0,				0.5,			1},		--0.9
	--{"rapeseed",			0,				0.4,			0.4}	--0.32
}


for index, ingredient in pairs(ingredients) do
	data:extend({
		{
			type = "recipe",
			name = "compost-"..ingredient[1],
			enabled = false,
			icon = "__FoodIndustry__/graphics/icons/items/compost.png",
			icon_size = 64,
			category = "composting",
			subgroup = "food-composting",
			energy_required = ingredient[3],
			ingredients = {
				{ ingredient[1], ingredient[2] }
			},
			results = {
				{type = "item", name = "compost", amount = ingredient[4]}
			},
		}
	})
end

--[[ {
	type = "recipe",
	name = "compost-1",
	enabled = false,
	icon = "__FoodIndustry__/graphics/icons/recipes/compost-1.png",
	icon_size = 32,
	category = "composting",
	subgroup = "food-items",
	energy_required = 25.0,
	ingredients =
	{
		{"raw-straw", 10},
	},
	results = 
	{
		{"compost", 20} -- OPTIMIZE receipt results
	},
	allow_as_intermediate = false,
  },
 ]]