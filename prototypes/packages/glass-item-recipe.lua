if data.raw.item["glass"] and not mods["angelssmelting"] then

    -- replace "glass" icon with new
    data.raw.item["glass"].icon = "__FoodIndustry__/graphics/icons/items/glass.png"
    data.raw.item["glass"].icon_size = 64

end

if data.raw.item["glass"] then

data:extend({
  
  --TODO add glass tara: item, recipes
  {
    type = "item",
    name = "glass-bottle",
    icon = "__FoodIndustry__/graphics/icons/items/raw-straw.png",
    icon_size = 32,

    subgroup = "drink-empty-packages",
    order = "a-e",
    stack_size = 20,
    --fuel_category = "ore",
    --fuel_value = "5J"
  },
  {
    type = "item",
    name = "used-glass-bottle",
    icon = "__FoodIndustry__/graphics/icons/items/raw-straw.png",
    icon_size = 32,

    subgroup = "drink-empty-packages",
    order = "a-e",
    stack_size = 20,
    --fuel_category = "ore",
    --fuel_value = "5J"
  },

  {
    type = "recipe",
    name = "glass-bottle",
    order = "a-d-a",
    enabled = false,
    icon = "__FoodIndustry__/graphics/icons/items/plastic-bottle.png",
    icon_size = 64,
    category = "smelting",
    subgroup = "drink-empty-packages",
    energy_required = 4.0,
    ingredients =
    {
      {"glass", 1},
    },
    results =
    {
      {"glass-bottle", 2}
    }
  },
  
  -- recicle recipes
  -- 1. smelt glass-bottle to glass 2:1
  {
    type = "recipe",
    name = "glass-bottle-to-glass",
    order = "a-d-a",
    enabled = false,
    --icon = "__bobplates__/graphics/icons/glass.png",
    --icon_size = 32,
    category = "smelting",
    subgroup = "drink-empty-packages",
    energy_required = 2.5,
    ingredients =
    {
      {"glass-bottle", 2},
    },
    results =
    {
      {"glass", 1}
    }
  },
  -- 2. smelt used-glass-bottle to glass 2:1
  {
    type = "recipe",
    name = "used-glass-bottle-to-glass",
    order = "a-d-a",
    enabled = false,
    --icon = "__bobplates__/graphics/icons/glass.png",
    --icon_size = 32,
    category = "smelting",
    subgroup = "drink-empty-packages",
    energy_required = 2.8,
    ingredients =
    {
      {"used-glass-bottle", 2},
    },
    results =
    {
      {"glass", 1}
    }
  },
  
})

end



