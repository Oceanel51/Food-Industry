if data.raw.item["glass"] then

data:extend({
  
  {
    type = "technology",
    name = "glass-tara",
    icon = "__FoodIndustry__/graphics/technology/glass-tara.png",
    icon_size = 128,
    prerequisites = {"electric-heating"},
    effects =
    {
        {type = "unlock-recipe", recipe = "glass-bottle"},
        {type = "unlock-recipe", recipe = "glass-bottle-to-glass"},
        {type = "unlock-recipe", recipe = "used-glass-bottle-to-glass"},
    },
    unit =
    {
        time = 50,
        count = 100,
        ingredients =
        {
            {"food-science-pack", 1},
            {"logistic-science-pack", 1},
        },
    },
    order = "w",
  },

})

end



