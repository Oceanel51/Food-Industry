data:extend({
	
-------------------- recipe["straw"] -------------------------
{
	type = "recipe",
    name = "straw",
    enabled = true,
	icon = "__FoodIndustry__/graphics/icons/items/straw.png",
	icon_size = 64,
	category = "crafting",
	subgroup = "food-items",
	energy_required = 0.5,
    ingredients =
    {
		{"raw-straw", 5}
    },
    results = 
	{
		{"straw", 16}
	}
},
-------------------- recipe["compressed-straw"] -------------------------
{
	type = "recipe",
	name = "compressed-straw",
	enabled = false,
	icon = "__FoodIndustry__/graphics/icons/recipes/compressed-straw.png",
	icon_size = 64,
	category = "advanced-crafting",
	subgroup = "food-items",
	energy_required = 1.5,
	ingredients =
	{
		{"straw", 60}
	},
	results = 
	{
		{"compressed-straw", 1}
	}
},
{
	type = "recipe",
	name = "compressed-straw-disassemble",
	enabled = false,
	icon = "__FoodIndustry__/graphics/icons/recipes/compressed-straw-disassemble.png",
	icon_size = 64,
	category = "advanced-crafting",
	subgroup = "food-items",
	order = "w-b-d",
	energy_required = 1.5,
	ingredients =
	{
		{"compressed-straw", 1}
	},
	results = 
	{
		{"straw", 60}
	}
},
{
	type = "recipe",
	name = "straw-briquettes",
	enabled = false,
	icon = "__FoodIndustry__/graphics/icons/items/straw-briquettes.png",
	icon_size = 64,
	category = "advanced-crafting",
	subgroup = "food-items",
	order = "w-b-e",
	energy_required = 2.0,
	ingredients =
	{
		{"compressed-straw", 2}
	},
	results = 
	{
		{"straw-briquettes", 1}
	}
},
-------------------- recipe["fish-to-meat"] -------------------------
{
	type = "recipe",
	name = "fish-to-meat",
	enabled = true,
	icon = "__FoodIndustry__/graphics/icons/items/biter-meat.png",
	icon_size = 64,
	icon_mipmaps = 4,
	category = "crafting",
	subgroup = "foods-meat",
	order = "w-d-a1",
	energy_required = 0.5,
	main_product = "biter-meat",
	ingredients =
	{
		{"raw-fish", 1}
	},
	results = 
	{
		{type = "item", name = "biter-meat", amount = 1, probability = 0.25},
		{type = "item", name = "fish-bone", amount = 1},
		{type = "item", name = "raw-mince", amount = 2},
	}
},
-- мясо и рыба в фарш, тоже но с примесью костей.
{
	type = "recipe",
	name = "biter-meat-to-raw-mince",
	enabled = false,
	icon = "__FoodIndustry__/graphics/icons/items/raw-mince.png",
	icon_size = 64,
	category = "advanced-crafting",
	subgroup = "foods-meat",
	order = "w-d-a2",
	energy_required = 3.2,
	ingredients =
	{
		{"biter-meat", 1},
	},
	results = 
	{
		{type = "item", name = "raw-mince", amount_min=3, amount_max=4},
	},
  },
  {
	type = "recipe",
	name = "biter-meat-bone-to-raw-mince",
	enabled = false,
	icon = "__FoodIndustry__/graphics/icons/items/raw-mince.png",
	icon_size = 64,
	category = "advanced-crafting",
	subgroup = "foods-meat",
	order = "w-d-a3",
	energy_required = 3.4,
	ingredients =
	{
		{"biter-meat", 1},
		{"bone", 1},
	},
	results = 
	{
		{type = "item", name = "raw-mince", amount_min=4, amount_max=7},
	},
  },
  
-------------------- recipe["compost-2"] -------------------------
{
	type = "recipe",
	name = "compost-2",
	enabled = false,
	icon = "__FoodIndustry__/graphics/icons/recipes/compost-2.png",
	icon_size = 64,
	category = "composting",
	subgroup = "food-items",
	energy_required = 200.0,
	ingredients =
	{
		{"landfill", 1},
	},
	results = 
	{
		{"compost", 60}
	},
	allow_as_intermediate = false,
},
{
	type = "recipe",
	name = "compost-to-landfill",
	enabled = false,
	icon = "__FoodIndustry__/graphics/icons/recipes/compost-to-landfill.png",
	icon_size = 64,
	category = "crafting",
	subgroup = "food-items",
	order = "w-b-f",
	energy_required = 15.0,
	ingredients =
	{
		{"compost", 60}
	},
	results = 
	{
		{"landfill", 1},
	},
},
-------------------- recipe["compost-cracking"] -------------------------
{
    type = "recipe",
    name = "compost-cracking",
    enabled = false,
	icon = "__FoodIndustry__/graphics/icons/recipes/compost-cracking.png",
	icon_size = 32,
	category = "chemistry",
	subgroup = "food-fluids",
	energy_required = 30.0,
    ingredients =
    {
		{"compost", 30},
		{type = "fluid", name = "water", amount = 120},
		{type = "fluid", name = "petroleum-gas", amount = 360},
		
    },
	results = 
	{
		{"unprocessed-fertilizer", 20},
		{type = "fluid", name = "fertilizer-oil", amount = 480}
	},
	crafting_machine_tint = { primary = {r=0.5,g=0.3,b=0.3,a=1}, secondary = {r=0.8,g=0,b=0.7,a=1}, tertiary = {r=0.6,g=0,b=0.5,a=1}}	
},
-------------------- recipe["fertilizer"] -------------------------
{
	type = "recipe",
	name = "fertilizer",
	enabled = false,
	icon = "__FoodIndustry__/graphics/icons/items/fertilizer.png",
	icon_size = 32,
	category = "chemistry",
	subgroup = "food-items",
	energy_required = 20.0,
	ingredients =
	{
		{"unprocessed-fertilizer", 15},
		{"crystal", 4},
		{type = "fluid", name = "sulfuric-acid", amount = 10},
		{type = "fluid", name = "steam", amount = 180}
	},
	results = 
	{
		{type="item", name="fertilizer", amount=10}
	},
	crafting_machine_tint = { primary = {r=0.8,g=0.6,b=0.7,a=1}, secondary = {r=0.8,g=0,b=0.7,a=1}, tertiary = {r=0.8,g=0,b=0.7,a=1}}	
  },
-------------------------------------------------
{
    type = "recipe",
    name = "fertilizer-oil-cracking",
    enabled = false,
	icon = "__FoodIndustry__/graphics/icons/recipes/fertilizer-oil-cracking.png",
	icon_size = 32,
	category = "oil-processing",
	subgroup = "food-fluids",
	energy_required = 0.8,
    ingredients =
    {
		{type = "fluid", name = "fertilizer-oil", amount = 20},
		{type = "fluid", name = "light-oil", amount = 30}
    },
      results = 
	{
		{type = "fluid", name = "heavy-oil", amount = 20},
		{type = "fluid", name = "water", amount = 30},
		{type = "fluid", name = "petroleum-gas", amount = 5}
	},
	allow_as_intermediate = false,
},


-------------------------------------------------
----------------------- species
-------------------------------------------------
{
    type = "recipe",
    name = "crystal-extraction-stone",
    enabled = false,
	icon = "__FoodIndustry__/graphics/icons/foods/crystal.png",
	icon_size = 64,
	category = "mixing",
	subgroup = "foods-species",
	order = "w-b-1",
	energy_required = 20.0,
    ingredients =
    {
		{type = "fluid", name = "water", amount = 250},
		{ "stone", 4 }
    },
      results = 
	{
		{type = "item", name = "crystal", amount = 1, probability = 0.2},
		{type = "fluid", name = "water", amount = 210},
		{ "stone", 3 }
	},
	allow_decomposition = true
},
-------------------------------------------------
{
    type = "recipe",
    name = "crystal-extraction-steam",
	order = "w-b-2",
    enabled = false,
	icon = "__FoodIndustry__/graphics/icons/recipes/crystal-steam.png",
	icon_size = 32,
	category = "chemistry",
	subgroup = "foods-species",
	energy_required = 2.0,
    ingredients =
    {
		{type = "fluid", name = "steam", amount = 5},
		{type = "fluid", name = "water", amount = 10},
		{ "crystal", 24 }
    },
      results = 
	{
		{type = "item", name = "crystal", amount = 24},
		{type = "item", name = "crystal", amount = 1, probability = 0.2}
	},
	crafting_machine_tint = { primary = {r=0.8,g=0.8,b=1,a=1}, secondary = {r=0.9,g=0.9,b=0.9,a=1}, tertiary = {r=0.8,g=0.8,b=0.8,a=1}},
	allow_as_intermediate = false,
},
-------------------------------------------------
{
	type = "recipe",
	name = "canola-oil",
	enabled = false,
	icon = "__FoodIndustry__/graphics/icons/fluids/canola-oil.png",
	icon_size = 32,
	-- TODO find out why it doesn't work categories
	--categories = {"mixing", "chemistry"},
	category = "chemistry",
	subgroup = "food-intermediates",
	energy_required = 2.5,
	ingredients =
	{
		{type = "fluid", name = "steam", amount = 10},
		{ "rapeseed", 2 }
	},
	results = 
	{
		{type = "fluid", name = "canola-oil", amount = 40}
	},
},
-------------------------------------------------
{
    type = "recipe",
    name = "canola-oil-processing",
    enabled = false,
	icon = "__FoodIndustry__/graphics/icons/recipes/canola-oil-processing.png",
	icon_size = 32,
	category = "oil-processing",
	subgroup = "food-intermediates",
	energy_required = 5.0,
    ingredients =
    {
		{type = "fluid", name = "steam", amount = 25},
		{type = "fluid", name = "canola-oil", amount = 100},
    },
      results = 
	{	
		{type = "fluid", name = "water", amount = 30},
		{type = "fluid", name = "light-oil", amount = 60},
		{type = "fluid", name = "petroleum-gas", amount = 10},
	},
},
-------------------------------------------------
{
    type = "recipe",
    name = "canola-oil-lubricant",
    enabled = false,
	icon = "__FoodIndustry__/graphics/icons/recipes/canola-oil-lubricant.png",
	icon_size = 32,
	category = "chemistry",
	subgroup = "food-intermediates",
	energy_required = 1.0,
    ingredients =
    {
		{type = "fluid", name = "canola-oil", amount = 10},
    },
      results = 
	{
		{type = "fluid", name = "lubricant", amount = 15},
	},
    },
-------------------------------------------------


-------------------------------------------------
{
    type = "recipe",
    name = "compost-water",
    enabled = false,
	icon = "__FoodIndustry__/graphics/icons/fluids/compost-water.png",
	icon_size = 32,
	category = "mixing",
	subgroup = "food-fluids",
	energy_required = 1.0,
    ingredients =
    {
		{type = "fluid", name = "water", amount = 55},
		{ "compost", 1 }
    },
	results = 
	{
		{type = "fluid", name = "compost-water", amount = 50}
	},
},
-------------------------------------------------
{
    type = "recipe",
    name = "fertilizer-water",
    enabled = false,
	icon = "__FoodIndustry__/graphics/icons/fluids/fertilizer-water.png",
	icon_size = 32,
	category = "chemistry",
	subgroup = "food-fluids",
	energy_required = 2.0,
    ingredients =
    {
		{type = "fluid", name = "fertilizer-oil", amount = 6},
		{type = "fluid", name = "water", amount = 44},
		{ "fertilizer", 1 }
    },
      results = 
	{
		{type = "fluid", name = "fertilizer-water", amount = 50}
	},
	crafting_machine_tint = { primary = {r=0,g=0.8,b=1,a=1}, secondary = {r=0,g=0.34,b=0.6,a=1}, tertiary = {r=0.34,g=0.2,b=0.6,a=1}}	
},


-------------------------------------------------
------------------- entity
-------------------------------------------------

{
    type = "recipe",
    name = "fi-basic-farmland",
    enabled = true,
	icon = "__FoodIndustry__/graphics/icons/entities/fi-basic-farmland.png",
	icon_size = 32,
	category = "crafting",
	subgroup = "food-machines",
	energy_required = 30.0,
    ingredients =
    {
		{"iron-plate", 6},
		{"wood", 32}
    },
      results = 
	{
		{"fi-basic-farmland", 2}
	}
},
-------------------------------------------------
{
    type = "recipe",
    name = "fi-composter",
    enabled = false,
	icon = "__FoodIndustry__/graphics/icons/entities/fi-composter-icon.png",
	icon_size = 64,
	category = "crafting",
	subgroup = "food-machines",
	energy_required = 8.0,
    ingredients =
    {
		{"stone", 10},
		{"wood", 24}
    },
      results = 
	{
		{"fi-composter", 1}
	}
},
-------------------------------------------------
{
    type = "recipe",
    name = "fi-electric-composter",
    enabled = false,
	icon = "__FoodIndustry__/graphics/icons/entities/fi-electric-composter-icon.png",
	icon_size = 64,
	category = "crafting-with-fluid",
	subgroup = "food-machines",
	energy_required = 20.0,
    ingredients =
    {
		{"fi-composter", 8},
		{"speed-module-2", 1},
		{"processing-unit", 4},
		{"electric-furnace", 2},
		{"compost", 400},
		{type = "fluid", name = "fertilizer-oil", amount = 800}
    },
      results = 
	{
		{"fi-electric-composter", 1}
	}
},
-------------------------------------------------
{
    type = "recipe",
    name = "fi-greenhouse",
    enabled = false,
	icon = "__FoodIndustry__/graphics/icons/entities/fi-greenhouse-icon.png",
	icon_size = 64,
	category = "crafting",
	subgroup = "food-machines",
	energy_required = 10.0,
    ingredients =
    {
		{"small-lamp", 4},
		{"pipe", 5},
		{"landfill", 4},
		{"electronic-circuit", 8},
    },
      results = 
	{
		{"fi-greenhouse", 1}
	}
},
---------------------------------------------
{
    type = "recipe",
    name = "fi-big-greenhouse",
    enabled = false,
	icon = "__FoodIndustry__/graphics/icons/entities/fi-big-greenhouse-icon.png",
	icon_size = 64,
	category = "crafting",
	subgroup = "food-machines",
	energy_required = 15.0,
    ingredients =
    {
		{"fi-greenhouse", 4},
		{"advanced-circuit", 8},
		{"stone-brick", 20},
		{"crystal", 12},
    },
      results = 
	{
		{"fi-big-greenhouse", 1}
	}
},
-------------------------------------------------
{
    type = "recipe",
    name = "fi-incubator",
    enabled = false,
	icon = "__FoodIndustry__/graphics/icons/entities/fi-incubator-icon.png",
	icon_size = 64,
	category = "crafting-with-fluid",
	subgroup = "food-machines",
	energy_required = 30.0,
    ingredients =
    {
		{"fi-big-greenhouse", 1},
		{"productivity-module-3", 1},
		{"electric-furnace", 8},
		{"fertilizer", 40},
		{type = "fluid", name = "fertilizer-oil", amount = 800}
    },
      results = 
	{
		{"fi-incubator", 1}
	}
},
-------------------------------------------------
{
    type = "recipe",
    name = "burner-cooker",
    enabled = false,
	icon = "__FoodIndustry__/graphics/icons/entities/burner-cooker.png",
	icon_size = 32,
	category = "crafting",
	subgroup = "food-machines",
	energy_required = 1.5,
    ingredients =
    {
		{"stone-brick", 4},
		{"stone-furnace", 1},
		{"iron-plate", 5}
    },
      results = 
	{
		{"burner-cooker", 1}
	}
},
-------------------------------------------------
{
	type = "recipe",
	name = "electric-cooker",
	enabled = false,
	icon = "__FoodIndustry__/graphics/icons/entities/electric-cooker.png",
	icon_size = 32,
	category = "crafting",
	subgroup = "food-machines",
	energy_required = 2.5,
	ingredients =
	{
		{"burner-cooker", 1},
		{"electronic-circuit", 4},
		{"copper-cable", 10},
		{"steel-plate", 2},
	},
	results = 
	{
		{"electric-cooker", 1}
	}
},


-------------------------------------------------
---------------- food materials
-------------------------------------------------
{
	type = "recipe",
	name = "corn-flour",
	enabled = false,
	icon = "__FoodIndustry__/graphics/icons/items/corn-flour.png",
	icon_size = 32,
	category = "advanced-crafting",
	subgroup = "corn",
	order = "w-d-c-y",
	energy_required = 1.0,
	ingredients =
	{
		{"corn-seeds", 10},
	},
	results = 
	{
		{"corn-flour", 3}
	}
},
{
	type = "recipe",
	name = "corn-dough",
	enabled = false,
	icon = "__FoodIndustry__/graphics/icons/items/corn-dough.png",
	icon_size = 64,
	category = "cooking",
	subgroup = "corn",
	order = "w-d-c-y",
	energy_required = 2.0,
	ingredients =
	{
		{"corn-flour", 2},
		{type="fluid", name="pure-water", amount=10}
	},
	results = 
	{
		{"corn-dough", 1}
	}
},
	
  {
    type = "recipe",
    name = "soy-milk",
    enabled = false,
	icon = "__FoodIndustry__/graphics/icons/fluids/soy-milk.png",
	icon_size = 32,
	category = "advanced-cooking",
	subgroup = "food-intermediates",
	energy_required = 0.5,
    ingredients =
    {
		{"cooked-soy", 4},
		{type = "fluid", name = "water", amount = 1}
    },
      results = 
	{
		{type = "fluid", name = "soy-milk", amount = 1}
	}
    },
  {
    type = "recipe",
    name = "soy-sauce",
    enabled = false,
	icon = "__FoodIndustry__/graphics/icons/fluids/soy-sauce.png",
	icon_size = 32,
	category = "chemistry",
	subgroup = "food-intermediates",
	energy_required = 0.5,
	ingredients =
	{
		{"soy", 30},
		{type = "fluid", name = "water", amount = 1}
	},
	results = 
	{
		{type = "fluid", name = "soy-sauce", amount = 2}
	}
  },

  {
	type = "recipe",
	name = "raw-fries",
	enabled = false,
	icon = "__FoodIndustry__/graphics/icons/items/raw-fries.png",
	icon_size = 32,
	category = "crafting",
	subgroup = "potato",
	order = "w-d-c-y",
	energy_required = 2.0,
	ingredients =
	{
		{"potato", 2},
	},
	results = 
	{
		{"raw-fries", 1}
	}
  },

  {
    type = "recipe",
    name = "ketchup",
    enabled = false,
	icon = "__FoodIndustry__/graphics/icons/fluids/ketchup.png",
	icon_size = 32,
	category = "cooking",
	subgroup = "food-intermediates",
	energy_required = 10.0,
    ingredients =
    {
		{"tomato", 20},
		{type = "fluid", name = "water", amount = 20}
    },
      results = 
	{
		{type = "fluid", name = "ketchup", amount = 5} -- TODO сделать в рецепте больше единиц жидкости
	}
    },
	
	
  {
	type = "recipe",
	name = "food-science-pack",
	enabled = false,
	icon = "__FoodIndustry__/graphics/icons/items/food-science-pack.png",
	icon_size = 64,
	icon_mipmaps = 4,
	category = "crafting",
	subgroup = "science-pack",
	energy_required = 3.0,
	ingredients =
	{
		{"automation-science-pack", 1},
		{"compost", 5},
	},
	results = 
	{
		{"food-science-pack", 1}
	}
  },
  --[[{
	type = "recipe",
	name = "substance-to-food-science-pack", -- TODO make alternative recipes of food-science-pack
	enabled = false,
	icon = "__FoodIndustry__/graphics/icons/items/food-science-pack.png",
	icon_size = 32,
	category = "crafting",
	subgroup = "science-pack",
	energy_required = 4.0,
	ingredients =
	{
		{"substance-v", 1},
		{"substance-m", 1},
		{"substance-c", 1},
		{"substance-f", 1},
		{"substances-dust", 4},
	},
	results = 
	{
		{"food-science-pack", 1}
	}
  },]]

  {
	type = "recipe",
	name = "bone-gelatine-broth",
	enabled = false,
	icon = "__FoodIndustry__/graphics/icons/fluids/gelatine-broth.png",
	icon_size = 32,
	category = "advanced-cooking",
	subgroup = "foods-species",
	order = "w-b-4",
	energy_required = 10.0,
	ingredients =
	{
		{"bone", 2},
		{type = "fluid", name = "pure-water", amount = 10},
	},
	results = 
	{
		{type = "fluid", name = "gelatine-broth", amount = 10},
	}
  },
  {
	type = "recipe",
	name = "fish-bone-gelatine-broth",
	enabled = false,
	icon = "__FoodIndustry__/graphics/icons/fluids/gelatine-broth.png",
	icon_size = 32,
	category = "advanced-cooking",
	subgroup = "foods-species",
	order = "w-b-4",
	energy_required = 8.0,
	ingredients =
	{
		{"fish-bone", 2},
		{type = "fluid", name = "pure-water", amount = 10},
	},
	results = 
	{
		{type = "fluid", name = "gelatine-broth", amount = 10},
	}
  },
  {
	type = "recipe",
	name = "mince-gelatine-broth",
	enabled = false,
	icon = "__FoodIndustry__/graphics/icons/fluids/gelatine-broth.png",
	icon_size = 32,
	category = "advanced-cooking",
	subgroup = "foods-species",
	order = "w-b-4",
	energy_required = 12.0,
	ingredients =
	{
		{"raw-mince", 4},
		{type = "fluid", name = "pure-water", amount = 10},
	},
	results = 
	{
		{type = "fluid", name = "gelatine-broth", amount = 10},
	}
  },
  {
	type = "recipe",
	name = "broth-gelatine-granules",
	enabled = false,
	icon = "__FoodIndustry__/graphics/icons/foods/gelatine-granules.png",
	icon_size = 64,
	category = "advanced-cooking",
	subgroup = "foods-species",
	order = "w-b-5",
	energy_required = 30.0,
	ingredients =
	{
		{type = "fluid", name = "gelatine-broth", amount = 20},
	},
	results = 
	{
		{"gelatine-granules", 10},
		{type = "fluid", name = "water", amount = 15},
	}
  },

  {
	type = "recipe",
	name = "basic-shell-capsule",
	enabled = false,
	icon = "__FoodIndustry__/graphics/icons/items/basic-shell-capsule.png",
	icon_size = 64,
	category = "cooking",
	subgroup = "foods-species",
	order = "w-b-7",
	energy_required = 10.0,
	ingredients =
	{
		{"gelatine-granules", 1},
	},
	results = 
	{
		{"basic-shell-capsule", 2}
	}
  },
  {
	type = "recipe",
	name = "advanced-shell-capsule",
	enabled = false,
	icon = "__FoodIndustry__/graphics/icons/items/advanced-shell-capsule.png",
	icon_size = 64,
	category = "advanced-cooking",
	subgroup = "foods-species",
	order = "w-b-8",
	energy_required = 15.0,
	ingredients =
	{
		{"basic-shell-capsule", 4},
		{"electronic-circuit", 1},
	},
	results = 
	{
		{"advanced-shell-capsule", 2}
	}
  },

-------------------------------------------------
----------------- food capsules
-------------------------------------------------
{
	type = "recipe",
	name = "food-16-to-12-capsule",
	enabled = false,
	icon = "__FoodIndustry__/graphics/icons/capsules/food-16-to-12-capsule.png",
	icon_size = 64,
	category = "crafting",
	subgroup = "food-capsules",
	order = "w-cb-ab",
	energy_required = 20.0,
	ingredients =
	{
		{"food-16-capsule", 3},
		{"gelatine-granules", 1},
	},
	results = 
	{
		{"food-12-capsule", 1}
	}
},
-------------------------------------------------
{
	type = "recipe",
	name = "food-12-to-16-capsule",
	enabled = true,
	icon = "__FoodIndustry__/graphics/icons/capsules/food-12-to-16-capsule.png",
	icon_size = 64,
	category = "crafting",
	subgroup = "food-capsules",
	order = "w-cb-ad",
	energy_required = 10.0,
	ingredients =
	{
		{"food-12-capsule", 1},
	},
	results = 
	{
		{"food-16-capsule", 3}
	}
},
-------------------------------------------------
{
	type = "recipe",
	name = "food-12-to-1-capsule",
	enabled = false,
	icon = "__FoodIndustry__/graphics/icons/capsules/food-12-to-1-capsule.png",
	icon_size = 64,
	category = "crafting",
	subgroup = "food-capsules",
	order = "w-cb-af",
	energy_required = 40.0,
	ingredients =
	{
		{"food-12-capsule", 2},
		{"gelatine-granules", 2},
	},
	results = 
	{
		{"food-1-capsule", 1}
	}
},
-------------------------------------------------
{
	type = "recipe",
	name = "food-1-to-12-capsule",
	enabled = true,
	icon = "__FoodIndustry__/graphics/icons/capsules/food-1-to-12-capsule.png",
	icon_size = 64,
	category = "crafting",
	subgroup = "food-capsules",
	order = "w-cb-ah",
	energy_required = 6.0,
	ingredients =
	{
		{"food-1-capsule", 1},
	},
	results = 
	{
		{"food-12-capsule", 2}
	}
},
-------------------------------------------------
------------ food capsules to substances
-------------------------------------------------
{
	type = "recipe",
	name = "food-16-to-substances",
	enabled = false,
	icon = "__FoodIndustry__/graphics/icons/substances/food-16-to-substances.png",
	icon_size = 64,
	category = "cooking",
	subgroup = "food-capsules",
	order = "w-cb-ac",
	energy_required = 20.0,
	ingredients =
	{
		{"food-16-capsule", 1},
	},
	results = 
	{
		{"substance-v", 1},
		{type = "item", name = "substance-v", amount = 1, probability = 0.2},
		{"substance-m", 1},
		{type = "item", name = "substance-m", amount = 1, probability = 0.2},
		{"substance-c", 1},
		{type = "item", name = "substance-c", amount = 1, probability = 0.2},
		{type = "item", name = "substance-f", amount = 1, probability = 0.85},
	}
},
-------------------------------------------------
{
	type = "recipe",
	name = "food-12-to-substances",
	enabled = false,
	icon = "__FoodIndustry__/graphics/icons/substances/food-12-to-substances.png",
	icon_size = 64,
	category = "advanced-cooking",
	subgroup = "food-capsules",
	order = "w-cb-ag",
	energy_required = 40.0,
	ingredients =
	{
		{"food-12-capsule", 1},
		{type = "fluid", name = "steam", amount = 30},
	},
	results = 
	{
		{"substance-v", 3},
		{type = "item", name = "substance-v", amount = 1, probability = 0.5},
		{"substance-m", 3},
		{type = "item", name = "substance-m", amount = 1, probability = 0.5},
		{"substance-c", 3},
		{type = "item", name = "substance-c", amount = 1, probability = 0.5},
		{type = "item", name = "substance-f", amount = 2},
		{type = "item", name = "substance-f", amount = 1, probability = 0.55},
		{type = "fluid", name = "pure-water", amount = 20},
	}
},
-------------------------------------------------
{
	type = "recipe",
	name = "food-1-to-substances",
	enabled = false,
	icon = "__FoodIndustry__/graphics/icons/substances/food-1-to-substances.png",
	icon_size = 64,
	category = "advanced-cooking",
	subgroup = "food-capsules",
	order = "w-cb-ak",
	energy_required = 60.0,
	ingredients =
	{
		{"food-1-capsule", 1},
		{type = "fluid", name = "steam", amount = 60},
	},
	results = 
	{
		{"substance-v", 8},
		{"substance-m", 8},
		{"substance-c", 8},
		{"substance-f", 7},
		{type = "fluid", name = "pure-water", amount = 40},
	}
},
-------------------------------------------------

})