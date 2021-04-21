data:extend({
    {
        type = "item",
        name = "seeds-package",
        icon = "__FoodIndustry__/graphics/icons/items/seeds-package.png",
        icon_size = 64,
        icon_mipmaps = 4,
        subgroup = "food-items",
        order = "w-c-0a",
        stack_size = 100
    },
    {
        type = "recipe",
        name = "seeds-package",
        order = "w-d-a-d",
        enabled = true,
        icon = "__FoodIndustry__/graphics/icons/items/seeds-package.png",
        icon_size = 64,
        icon_mipmaps = 4,
        category = "crafting",
        subgroup = "food-items",
        energy_required = 2.5,
        ingredients =
        {
            {type = "item", name = "lettuce", amount = 1},
            {type = "item", name = "cucumber", amount = 1},
            {type = "item", name = "tomato", amount = 1},
        },
        results = 
        {
            {type = "item", name = "seeds-package", amount_min = 5, amount_max = 10},
        },
        --allow_as_intermediate = false,
    },
    {
        type = "recipe",
        name = "seeds-package-loot",
        order = "w-d-a-d",
        enabled = true,
        icon = "__FoodIndustry__/graphics/icons/items/seeds-package.png",
        icon_size = 64,
        icon_mipmaps = 4,
        category = "crafting",
        subgroup = "food-items",
        energy_required = 1,
        ingredients =
        {
            {type = "item", name = "seeds-package", amount = 1},
        },
        results = 
        {
            {type = "item", name = "lettuce",        amount = 1,  probability = 0.1},
            {type = "item", name = "cucumber-seeds", amount = 10, probability = 0.1},
            {type = "item", name = "tomato-seeds",   amount = 10, probability = 0.1},
            {type = "item", name = "potato",         amount = 1,  probability = 0.1},
            {type = "item", name = "corn",           amount = 1,  probability = 0.1},
            {type = "item", name = "soy-seeds",      amount = 10, probability = 0.1},
            {type = "item", name = "rapeseed-seeds", amount = 10, probability = 0.1},
            {type = "item", name = "wheat-seeds",    amount = 10, probability = 0.1},

            {type = "item", name = "apple-seeds",    amount = 10, probability = 0.1},
            {type = "item", name = "orange-seeds",   amount = 10, probability = 0.1},
        },
    },
})
