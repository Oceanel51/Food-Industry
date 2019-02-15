data:extend({
	
-- Packages
{
	type = "recipe",
	name = "flask",
	order = "a-b-a",
	enabled = true,
	icon = "__FoodIndustry__/graphics/icons/items/flask.png",
	icon_size = 64,
	category = "crafting",
	subgroup = "drink-empty-packages",
	energy_required = 4.5,
	ingredients =
	{
		{"iron-plate", 1},
	},
	results =
	{
		{"flask", 1}
	}
  },
  {
	type = "recipe",
	name = "flask-recycle",
	order = "a-b-b",
	enabled = true,
	icon = "__FoodIndustry__/graphics/icons/items/flask-recycle.png",
	icon_size = 64,
	category = "crafting",
	subgroup = "drink-empty-packages",
	energy_required = 6,
	ingredients =
	{
		{"flask", 4}
	},
	results =
	{
		{"iron-plate", 1},
	},
	hide_from_stats = true,
	--allow_decomposition = false,
	allow_as_intermediate = false,
	allow_intermediates = false,
  },

  {
	type = "recipe",
	name = "plastic-bottle",
	order = "a-c-a",
	enabled = false,
	icon = "__FoodIndustry__/graphics/icons/items/plastic-bottle.png",
	icon_size = 64,
	category = "crafting",
	subgroup = "drink-empty-packages",
	energy_required = 3.0,
	ingredients =
	{
		{"plastic-bar", 1},
	},
	results =
	{
		{"plastic-bottle", 4}
	}
  },

})