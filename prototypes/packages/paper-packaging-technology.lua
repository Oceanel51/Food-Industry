data:extend({

  {
    type = "technology",
    name = "paper-packaging-tara",
    icon = "__FoodIndustry__/graphics/technology/glass-tara.png",
    icon_size = 128,
    prerequisites = {"electric-heating"},
    effects =
    {
        --{type = "unlock-recipe", recipe = "paper-mass"},
        --{type = "unlock-recipe", recipe = "paper"},
        --{type = "unlock-recipe", recipe = "carton"},
        --{type = "unlock-recipe", recipe = "paper-package"},    -- bag, box
        --{type = "unlock-recipe", recipe = "paper-packaging"},  -- bottle
        --{type = "unlock-recipe", recipe = "used-paper-package"},
    },
    unit =
    {
        time = 45,
        count = 50,
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



