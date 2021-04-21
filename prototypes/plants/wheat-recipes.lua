local group_pos = 8

data:extend({

    -- создаём зёрна для посадки
{
    type = "recipe",
    name = "wheat-seeds",
    order = "w-d-b-x",
    enabled = true,
    icon = "__FoodIndustry__/graphics/icons/items/wheat-seeds.png",
    icon_size = 64,
    icon_mipmaps = 4,
    category = "crafting",
    subgroup = "wheat",
    energy_required = 0.75,
    ingredients =
    {
        {"wheat-grains", 6}
    },
      results = 
    {
        {type = "item", name = "wheat-seeds", amount = 1, probability = 0.8},
        {type = "item", name = "raw-straw", amount_min = 1, amount_max = 3, probability = 0.9},
    }
},
{
    type = "recipe",
    name = "wheat-grains",
    enabled = true,
    icon = "__FoodIndustry__/graphics/icons/items/wheat-grains.png",
    icon_size = 64,
    icon_mipmaps = 4,
    category = "crafting",
    subgroup = "wheat",
    order = "w-d-b-y",
    energy_required = 0.75,
    ingredients =
    {
        {"wheat", 1}
    },
      results = 
    {
        {type = "item", name = "wheat-grains", amount_min = 5, amount_max = 20},
        {type = "item", name = "straw", amount_min = 8, amount_max = 15, probability = 0.9},
    }
},
{
    type = "recipe",
    name = "wheat-flour",
    enabled = false,
    icon = "__FoodIndustry__/graphics/icons/items/wheat-flour.png",
    icon_size = 64,
    icon_mipmaps = 4,
    category = "advanced-crafting",
    subgroup = "wheat",
    order = "w-d-c-x",
    energy_required = 1.0,
    ingredients =
    {
        {"wheat-grains", 5}
    },
      results = 
    {
        {type = "item", name = "wheat-flour", amount_min = 1, amount_max = 2}
    }
},
{
    type = "recipe",
    name = "wheat-dough",
    enabled = false,
    icon = "__FoodIndustry__/graphics/icons/items/wheat-dough.png",
    icon_size = 64,
    icon_mipmaps = 4,
    category = "cooking",
    subgroup = "wheat",
    order = "w-d-c-y",
    energy_required = 2.0,
    ingredients =
    {
        {"wheat-flour", 2},
        {type="fluid", name="pure-water", amount=6}
    },
      results = 
    {
        {type = "item", name = "wheat-dough", amount = 1}
    }
},

})
