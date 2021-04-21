data:extend(
{
  -------------------- FI main --------------------
  {
    type = "item-group",
    name = "food-industry",
    order = "fi-a",
    inventory_order = "c-a",
    icon = "__FoodIndustry__/graphics/icons/fi_logo_icon.png",
    icon_size = 128,
  },
  {
    type = "item-subgroup",
    name = "food-machines",
    group = "food-industry",
    order = "w-a",
  },
  {
    type = "item-subgroup",
    name = "food-equipment",
    group = "food-industry",
    order = "w-c-a",
  },
  {
    type = "item-subgroup",
    name = "food-items",
    group = "food-industry",
    order = "w-c-b",
  },
  {
    type = "item-subgroup",
    name = "food-fluids",
    group = "food-industry",
    order = "w-c-c",
  },
  {
    type = "item-subgroup",
    name = "effect",
    group = "food-industry",
    order = "w-f",
  },
  {
    type = "item-subgroup",
    name = "food-intermediates",
    group = "food-industry",
    order = "w-g",
  },
  {
    type = "item-subgroup",
    name = "food-composting",
    group = "food-industry",
    order = "w-j",
  },  
  {
    type = "item-subgroup",
    name = "fish-feeding",
    group = "food-industry",
    order = "w-k",
  },
  {
    type = "item-subgroup",
    name = "sturgeon-feeding",
    group = "food-industry",
    order = "w-k-1",
  },  
  {
    type = "item-subgroup",
    name = "cattle-feeding",
    group = "food-industry",
    order = "w-k-2",
  },
  {
    type = "item-subgroup",
    name = "food-cattle",
    group = "food-industry",
    order = "w-e",
  },
  {
    type = "item-subgroup",
    name = "food-machines-cattle",
    group = "food-industry",
    order = "w-a3",
  },
  {
    type = "item-subgroup",
    name = "food-machines-trees",
    group = "food-industry",
    order = "w-a1",
},
{
    type = "item-subgroup",
    name = "food-machines-fish",
    group = "food-industry",
    order = "w-a2",
},

  -- TODO fix categories
  -------------------- foods --------------------
  {
    type = "item-group",
    name = "food-industry-foods",
    order = "fi-b",
    inventory_order = "c-b",
    icon = "__FoodIndustry__/graphics/icons/fi_logo_foods_icon.png",
    icon_size = 128,
  },
  {
    type = "item-subgroup",
    name = "foods",
    group = "food-industry-foods",
    order = "w-g",
  },
  {
    type = "item-subgroup",
    name = "foods-vegan",
    group = "food-industry-foods",
    order = "w-g",
  },
--[[   {
    type = "item-subgroup",
    name = "foods-fruit",
    group = "food-industry-foods",
    order = "w-h",
  }, ]]
  {
    type = "item-subgroup",
    name = "foods-cooked",
    group = "food-industry-foods",
    order = "w-i",
  },
  {
    type = "item-subgroup",
    name = "foods-fish",
    group = "food-industry-foods",
    order = "w-k",
  },
  {
    type = "item-subgroup",
    name = "foods-meat",
    group = "food-industry-foods",
    order = "w-l",
  },
  {
    type = "item-subgroup",
    name = "food-capsules",
    group = "food-industry-foods",
    order = "w-m",
  },
  {
    type = "item-subgroup",
    name = "foods-species",
    group = "food-industry-foods",
    order = "w-n",
  },
  {
    type = "item-subgroup",
    name = "foods-substances",
    group = "food-industry-foods",
    order = "w-o",
  },
  {
    type = "item-subgroup",
    name = "foods-substances1",
    group = "food-industry-foods",
    order = "w-p-a",
  },
  {
    type = "item-subgroup",
    name = "foods-substances2",
    group = "food-industry-foods",
    order = "w-p-b",
  },
  {
    type = "item-subgroup",
    name = "foods-substances3",
    group = "food-industry-foods",
    order = "w-p-c",
  },
  {
    type = "item-subgroup",
    name = "foods-other",
    group = "food-industry-foods",
    order = "w-q",
  },
  -------------------- drinks --------------------
  {
    type = "item-group",
    name = "food-industry-drinks",
    order = "fi-c",
    inventory_order = "c-c",
    icon = "__FoodIndustry__/graphics/icons/fi_logo_drinks_icon.png",
    icon_size = 128,
  },
  {
    type = "item-subgroup",
    name = "drink-empty-packages",
    group = "food-industry-drinks",
    order = "w-b-a",
  },
  {
    type = "item-subgroup",
    name = "drinks-pure-water",
    group = "food-industry-drinks",
    order = "w-b-b-1",
  },
  {
    type = "item-subgroup",
    name = "drinks-apple",
    group = "food-industry-drinks",
    order = "w-b-b-2",
  },
  {
    type = "item-subgroup",
    name = "drinks-orange",
    group = "food-industry-drinks",
    order = "w-b-b-3",
  },
  {
    type = "item-subgroup",
    name = "drinks-tomato",
    group = "food-industry-drinks",
    order = "w-b-b-4",
  },

  -------------------- recipes --------------------

  -- crop growth
  {
    type = "recipe-category",
    name = "basic-crop-growth",
  },
  {
    type = "recipe-category",
    name = "advanced-crop-growth",
  },
  -- tree growth
  {
    type = "recipe-category",
    name = "basic-tree-growth",
  },
  {
    type = "recipe-category",
    name = "advanced-tree-growth",
  },
  -- composting
  {
    type = "recipe-category",
    name = "composting",
  },
  {
    type = "recipe-category",
    name = "auto-composting",
  },
  --
  {
    type = "recipe-category",
    name = "food-cattle",
  },
  {
    type = "recipe-category",
    name = "fish-feeding",
  },
  {
    type = "recipe-category",
    name = "cattle-feeding",
  },
  {
    type = "recipe-category",
    name = "sturgeon-feeding",
  },  
  -- cooking
  {
    type = "recipe-category",
    name = "cooking",	
  },
  {
    type = "recipe-category",
    name = "advanced-cooking", -- for advanced capsules and cooking
  },
  {
    type = "recipe-category",
    name = "food-capsules",  -- for player hand crafting
  },
  --
  {
    type = "recipe-category",
    name = "beverages",	-- напитки
  },
  {
    type = "recipe-category",
    name = "juicing",	-- приготовление соков
  },
  --
  {
    type = "recipe-category",
    name = "mixing",	
  },
  {
    type = "fuel-category",
    name = "plant",	
  },
  {
    type = "fuel-category",
    name = "humus",	 -- changed by Oceanel
  },

	{
    type = "autoplace-control",
    category = "resource",
    name = "food-plant",
    order = "w",
    richness = false,
	}, 
	{
    type = "autoplace-control",
    category = "resource",
    name = "oil-plant",
    order = "w",
    richness = false,
	},
	{
    type = "autoplace-control",
    category = "resource",
    name = "cereal-plant",
    order = "w",
    richness = true,
	},
})