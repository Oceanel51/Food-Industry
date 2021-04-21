data:extend({

  {
    type = "item",
    name = "eat-drink-equipment",
    icon = "__FoodIndustry__/graphics/icons/equipment/eat-drink-equipment-icon.png",
    icon_size = 64,
    placed_as_equipment_result = "eat-drink-equipment",
    subgroup = "food-equipment",
    order = "w-a",
    stack_size = 1,
    fuel_category = "chemical",
    fuel_value = "2MJ",
    fuel_acceleration_multiplier = 0.6,
    fuel_top_speed_multiplier = 0.7,
    fuel_emission_multiplier = 0.4,
    effectivity = 0.8,
  },
  {
    type = "battery-equipment",
    name = "eat-drink-equipment",
    sprite =
    {
    filename = "__FoodIndustry__/graphics/equipment/eat-drink-equipment.png",
      width = 64,
      height = 32,
      priority = "medium"
    },
    shape =
    {
      width = 2,
      height = 1,
      type = "full"
    },
    energy_source =
    {
      type = "electric",
      buffer_capacity = nil,
      input_flow_limit = nil,
      usage_priority = "primary-input"
    },
    energy_input = "5kW",
    --tint = {r = 0, g = 0.1, b = 0, a = 0.2},
    categories = {"armor"}
  },
  {
    type = "recipe",
    name = "eat-drink-equipment",
    enabled = false,
    icon = "__FoodIndustry__/graphics/icons/equipment/eat-drink-equipment-icon.png",
    icon_size = 64,
    category = "crafting",
    subgroup = "food-equipment",
    order = "w-a",
    energy_required = 3.5,
    ingredients =
    {
      {"wood", 8},
      {"electronic-circuit", 4},
      {"copper-cable", 10},
      {"iron-plate", 5}
    },
      results = 
    {
      {"eat-drink-equipment", 1}
    }
  },
-------------------------------------------------

})
