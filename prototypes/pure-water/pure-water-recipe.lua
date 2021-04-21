data:extend({

  {
    type = "recipe",
    name = "pure-water-boiled",
    enabled = false,
    icon = "__FoodIndustry__/graphics/icons/fluids/pure-water.png",
    icon_size = 32,
    category = "advanced-cooking",
    subgroup = "drinks-pure-water",
    order = "w-c",
    energy_required = 60.0,
    ingredients =
    {
      {type="fluid", name="water", amount=100},
    },
    results =
    {
      {type="fluid", name="pure-water", amount=60},
      {type = "item", name = "crystal", amount = 1, probability = 0.13},
    }
  },

})