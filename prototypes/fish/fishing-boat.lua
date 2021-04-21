local boat = data.raw["locomotive"]["boat_engine"]
if boat then

    data:extend({

        {
            type = "item",
            name = "fishing-boat-net",
            icon = "__FoodIndustry__/graphics/icons/items/fishing-boat-net.png",
            icon_size = 64,
            subgroup = "food-machines-fish",
            order = "w-a-j",
            stack_size = 1
        },

        {
            type = "recipe",
            name = "fishing-boat-net",
            enabled = true,
            energy_required = 10,
            ingredients =
            {
                {"plastic-bar", 10}
            },
            result = "fishing-boat-net"
        },

    })

end