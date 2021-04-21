data:extend({

-- fish-meat
  {
    type = "recipe",
    name = "fish-meat",
    enabled = false,
    icon = "__FoodIndustry__/graphics/icons/recipes/fish-meat.png",
    icon_size = 64,
    category = "crafting-with-fluid",
    subgroup = "foods-fish",
    order = "w-b-1",
    energy_required = 20.0,
    ingredients =
    {
        {"raw-fish", 1},
        {type = "fluid", name = "water", amount = 20},
    },
    results = 
    {
        {type = "item", name = "fish-meat-red", amount_min=1, amount_max=3},
        {"fish-bone", 1},
        {type = "fluid", name = "water", amount = 15},
    },
  },
  {
    type = "recipe",
    name = "sturgeon-meat",
    enabled = false,
    icon = "__FoodIndustry__/graphics/icons/recipes/sturgeon-meat.png",
    icon_size = 64,
    category = "crafting-with-fluid",
    subgroup = "foods-fish",
    order = "w-c-1",
    energy_required = 30.0,
    ingredients =
    {
        {"fi-raw-sturgeon", 1},
        {type = "fluid", name = "water", amount = 60},
    },
    results = 
    {
        {type = "item", name = "fish-meat-red", amount_min=4, amount_max=10},
        {"fish-bone", 2},
        {type = "fluid", name = "water", amount = 50},
    },
  },

-- fish-meat with fish-caviar-red
  {
    type = "recipe",
    name = "fish-meat-fish-caviar-red",
    enabled = false,
    icon = "__FoodIndustry__/graphics/icons/recipes/fish-meat-fish-caviar-red.png",
    icon_size = 64,
    category = "crafting-with-fluid",
    subgroup = "foods-fish",
    order = "w-b-2",
    energy_required = 40.0,
    ingredients =
    {
      {"raw-fish", 1},
      {type = "fluid", name = "pure-water", amount = 20},
    },
    results = 
    {
      {type = "item", name = "fish-meat-red", amount_min=2, amount_max=3},
      {"fish-bone", 1},
      {type = "item", name = "fish-caviar-red", amount = 1, probability = 0.25},
      {type = "fluid", name = "water", amount = 15},
    },
  },
  {
    type = "recipe",
    name = "sturgeon-fish-meat-fish-caviar-red",
    enabled = false,
    icon = "__FoodIndustry__/graphics/icons/recipes/sturgeon-fish-meat-fish-caviar-red.png",
    icon_size = 64,
    category = "crafting-with-fluid",
    subgroup = "foods-fish",
    order = "w-c-2",
    energy_required = 40.0,
    ingredients =
    {
      {"fi-raw-sturgeon", 1},
      {type = "fluid", name = "pure-water", amount = 60},
    },
    results = 
    {
      {type = "item", name = "fish-meat-red", amount_min=8, amount_max=12},
      {"fish-bone", 3},
      {type = "item", name = "fish-caviar-red", amount = 1, probability = 0.75},
      {type = "item", name = "fish-caviar-red", amount = 1, probability = 0.5},
      {type = "fluid", name = "water", amount = 50},
    },
  },

-- fish-meat to raw-mince
{
  type = "recipe",
  name = "fish-meat-to-raw-mince",
  enabled = false,
  icon = "__FoodIndustry__/graphics/icons/items/raw-mince.png",
  icon_size = 64,
  category = "advanced-crafting",
  subgroup = "foods-fish",
  order = "w-b-3",
  energy_required = 2.8,
  ingredients =
  {
      {"fish-meat-red", 1},
  },
  results = 
  {
      {type = "item", name = "raw-mince", amount_min=2, amount_max=4},
  },
},
{
  type = "recipe",
  name = "fish-meat-bone-to-raw-mince",
  enabled = false,
  icon = "__FoodIndustry__/graphics/icons/items/raw-mince.png",
  icon_size = 64,
  category = "advanced-crafting",
  subgroup = "foods-fish",
  order = "w-b-4",
  energy_required = 3.2,
  ingredients =
  {
      {"fish-meat-red", 1},
      {"fish-bone", 1},
  },
  results = 
  {
      {type = "item", name = "raw-mince", amount_min=3, amount_max=6},
  },
},

})
