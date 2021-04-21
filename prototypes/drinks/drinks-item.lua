data:extend({
	
  -- basic Drinks items
  {
    type = "item",
    name = "flask",
    icon = "__FoodIndustry__/graphics/icons/items/flask.png",
    icon_size = 64,
    subgroup = "drink-empty-packages",
    order = "a-d",
	  stack_size = 20,
  },
	{
    type = "item",
    name = "plastic-bottle",
    icon = "__FoodIndustry__/graphics/icons/items/plastic-bottle.png",
    icon_size = 64,
    subgroup = "drink-empty-packages",
    order = "a-f",
	  stack_size = 50,
  },
	{
    type = "item",
    name = "plastic-bottle-used",
    icon = "__FoodIndustry__/graphics/icons/items/plastic-bottle-used.png",
    icon_size = 64,
    --dark_background_icon = "__base__/graphics/icons/coal-dark-background.png",
    fuel_category = "chemical",
    fuel_value = "5kJ",
    fuel_emissions_multiplier = 3.4,
    --burnt_result = "",
    subgroup = "drink-empty-packages",
    order = "a-h",
	  stack_size = 200,
  },
  
})

data:extend({
  {
    type = "custom-input",
    name = "get-drink-click",
    key_sequence = "mouse-button-1",
    consuming = "none"
  },
})
