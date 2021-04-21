data:extend({

    -- Item
    {
        type = "item",
        name = "fi-watertile",
        icon = "__FoodIndustry__/graphics/icons/tiles/hr_watertile.png",
        icon_size = 128,
        subgroup = "food-machines-fish",
        order = "w-a-l",
        stack_size = 100,
        place_as_tile =
        {
            result = "water",
            condition_size = 1,
            condition = {},
        },
    },

    -- Recipe
    {
        type = "recipe",
        name = "fi-watertile",
        energy_required = 1,
        enabled = false,
        category = "crafting-with-fluid",
        ingredients =
        {
            {type = "fluid", name = "water", amount = 1000},
        },
        result = "fi-watertile",
        result_count = 1,
    },

    -- Item
    {
        type = "item",
        name = "fi-deepwatertile",
        icon = "__FoodIndustry__/graphics/icons/tiles/hr_deepwatertile.png",
        icon_size = 128,
        subgroup = "food-machines-fish",
        order = "w-a-n",
        stack_size = 100,
        place_as_tile =
        {
            result = "deepwater",
            condition_size = 1,
            condition = {}
        },
    },
    -- Recipe
    {
        type = "recipe",
        name = "fi-deepwatertile",
        energy_required = 1,
        enabled = false,
        category = "crafting-with-fluid",
        ingredients =
        {
            {type = "fluid", name = "water", amount = 2000},
        },
        result = "fi-deepwatertile",
        result_count = 1,
    },

    -- shovel
    {
        type = "selection-tool",
        name = "fi-shovel",
        icon = "__FoodIndustry__/graphics/icons/items/shovel.png",
        icon_size = 32,
        subgroup = "food-machines-fish",
        order = "w-a-o",
        stack_size = 1,

        selection_color = { r = 0, g = 1, b = 0 },
        alt_selection_color = { r = 0, g = 1, b = 0 },

        selection_mode = {"any-tile"},
        alt_selection_mode = {"any-tile"},
        selection_cursor_box_type = "copy",
        alt_selection_cursor_box_type = "copy"
    },
    {
        type = "recipe",
        name = "fi-shovel",
        enabled = false,
        ingredients =
        {
            {type="item", name="iron-stick", amount=5},
            {type="item", name="steel-plate", amount=3},
        },
        energy_required = 5,
        result= "fi-shovel",
        result_count = 1
    }
})