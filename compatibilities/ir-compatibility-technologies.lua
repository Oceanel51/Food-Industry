data:extend({  
--[[ {
    type = "technology",
    name = "food-energy-efficiency-1",
    icon = "__FoodIndustry__/graphics/technology/food-energy-efficiency.png",
    icon_size = 128,
    prerequisites =
    {
      "cooking"
    },
    effects =
    {      
    },
    unit =
    {
      time = 60,
      count = 150,
      ingredients =
      {
        {"automation-science-pack", 1},
		{"logistic-science-pack", 1},
		{"food-science-pack", 1},
      },
    },
    order = "w",
  },
  {
    type = "technology",
    name = "food-energy-efficiency-2",
    icon = "__FoodIndustry__/graphics/technology/food-energy-efficiency-2.png",
    icon_size = 128,
    prerequisites =
    {
      "food-energy-efficiency-1",
    },
    effects =
    {      
    },
    unit =
    {
      time = 60,
      count = 200,
      ingredients =
      {
        {"automation-science-pack", 1},
		{"logistic-science-pack", 1},
		{"food-science-pack", 1},
      },
    },
    order = "w",
  },
  {
    type = "technology",
    name = "food-energy-efficiency-3",
    icon = "__FoodIndustry__/graphics/technology/food-energy-efficiency-3.png",
    icon_size = 128,
    prerequisites =
    {
      "food-energy-efficiency-2","advanced-electronics"
    },
    effects =
    {      
    },
    unit =
    {
      time = 60,
      count = 250,
      ingredients =
      {
        {"automation-science-pack", 1},
		{"logistic-science-pack", 1},
		{"chemical-science-pack", 1},
		{"food-science-pack", 1},
      },
    },
    order = "w",
  },
  {
    type = "technology",
    name = "food-energy-efficiency-4",
    icon = "__FoodIndustry__/graphics/technology/food-energy-efficiency-4.png",
    icon_size = 128,
    prerequisites =
    {
      "food-energy-efficiency-3",
    },
    effects =
    {      
    },
    unit =
    {
      time = 60,
      count = 300,
      ingredients =
      {
        {"automation-science-pack", 1},
		{"logistic-science-pack", 1},
		{"chemical-science-pack", 1},
		{"food-science-pack", 1},
      },
    },
    order = "w",
  },
  {
    type = "technology",
    name = "food-energy-efficiency-5",
    icon = "__FoodIndustry__/graphics/technology/food-energy-efficiency-5.png",
    icon_size = 128,
    prerequisites =
    {
      "food-energy-efficiency-4","modular-armor"
    },
    effects =
    {      
    },
    unit =
    {
      time = 60,
      count = 350,
      ingredients =
      {
        {"automation-science-pack", 1},
		{"logistic-science-pack", 1},
		{"chemical-science-pack", 1},
		{"food-science-pack", 1},
      },
    },
    order = "w",
  },
  {
    type = "technology",
    name = "food-energy-efficiency-6",
    icon = "__FoodIndustry__/graphics/technology/food-energy-efficiency-6.png",
    icon_size = 128,
    prerequisites =
    {
      "food-energy-efficiency-5",
    },
    effects =
    {      
    },
    unit =
    {
      time = 60,
      count = 400,
      ingredients =
      {
        {"automation-science-pack", 1},
		{"logistic-science-pack", 1},
		{"chemical-science-pack", 1},
		{"food-science-pack", 1},
      },
    },
    order = "w",
  },
  {
    type = "technology",
    name = "food-energy-efficiency-7",
    icon = "__FoodIndustry__/graphics/technology/food-energy-efficiency-7.png",
    icon_size = 128,
    prerequisites =
    {
      "food-energy-efficiency-6","power-armor"
    },
    effects =
    {      
    },
    unit =
    {
      time = 60,
      count = 500,
      ingredients =
      {
        {"automation-science-pack", 1},
		{"logistic-science-pack", 1},
		{"chemical-science-pack", 1},
		{"production-science-pack", 1},
		{"food-science-pack", 1},
      },
    },
    order = "w",
  },
  {
    type = "technology",
    name = "food-energy-efficiency-8",
    icon = "__FoodIndustry__/graphics/technology/food-energy-efficiency-8.png",
    icon_size = 128,
    prerequisites =
    {
      "food-energy-efficiency-7",
    },
    effects =
    {      
    },
    unit =
    {
      time = 60,
      count = 600,
      ingredients =
      {
        {"automation-science-pack", 1},
		{"logistic-science-pack", 1},
		{"chemical-science-pack", 1},
		{"production-science-pack", 1},
		{"food-science-pack", 1},
      },
    },
    order = "w",
  },
  {
    type = "technology",
    name = "food-energy-efficiency-9",
    icon = "__FoodIndustry__/graphics/technology/food-energy-efficiency-9.png",
    icon_size = 128,
    prerequisites =
    {
      "food-energy-efficiency-8","power-armor-mk2"
    },
    effects =
    {      
    },
    unit =
    {
      time = 60,
      count = 750,
      ingredients =
      {
        {"automation-science-pack", 1},
		{"logistic-science-pack", 1},
		{"chemical-science-pack", 1},
		{"production-science-pack", 1},		
		{"utility-science-pack", 1},
		{"food-science-pack", 1},
      },
    },
    order = "w",
  },
  {
    type = "technology",
    name = "food-energy-efficiency-10",
    icon = "__FoodIndustry__/graphics/technology/food-energy-efficiency-10.png",
    icon_size = 128,
    prerequisites =
    {
      "food-energy-efficiency-9",
    },
    effects =
    {      
    },
    unit =
    {
      time = 60,
      count = 1000,
      ingredients =
      {
        {"automation-science-pack", 1},
		{"logistic-science-pack", 1},
		{"chemical-science-pack", 1},
		{"production-science-pack", 1},		
		{"utility-science-pack", 1},
		{"food-science-pack", 1},
      },
    },
    order = "w",
  },
  
  
  {
    type = "technology",
    name = "food-energy-efficiency-11",
    icon = "__FoodIndustry__/graphics/technology/food-energy-efficiency-11.png",
    icon_size = 128,
    prerequisites =
    {
      "power-armor-mk2", "food-energy-efficiency-10", "advanced-nutrient-extraction"
    },
    effects =
    {      
    },
    unit =
    {
      time = 60,
      count_formula = "1000+8.333333334*(L-9)*(L-8)*(L-7)",
      ingredients =
      {
        {"automation-science-pack", 1},
		{"logistic-science-pack", 1},
		{"chemical-science-pack", 1},
		{"production-science-pack", 1},
		{"utility-science-pack", 1},
		{"space-science-pack", 1},
		{"food-science-pack", 1},
      },
    },
    order = "e-p-b-c-6",
	upgrade = true,
	max_level = "infinite"
  },]]
    
  
  
  
  {
    type = "technology",
    name = "composting",
    icon = "__FoodIndustry__/graphics/technology/composting.png",
    icon_size = 128,
    prerequisites = {},
    effects =
    {  
        {type = "unlock-recipe", recipe = "fi-composter"},
        {type = "unlock-recipe", recipe = "compost-raw-straw"},
        {type = "unlock-recipe", recipe = "compost-straw"},
        {type = "unlock-recipe", recipe = "compost-compressed-straw"},
        {type = "unlock-recipe", recipe = "food-science-pack"},
    },
    unit =
    {
      time = 10,
      count = 10,
      ingredients =
      {        
		{"automation-science-pack", 1},
      },
    },
    order = "w",
  },
  {
    type = "technology",
    name = "potato-growth",
    icon = "__FoodIndustry__/graphics/technology/potato-growth.png",
    icon_size = 128,
    prerequisites = {"composting"},
    effects =
    {  
		{type = "unlock-recipe", recipe = "potato-growth"},
    },
    unit =
    {
      time = 40,
      count = 5,
      ingredients =
      {        
		{"food-science-pack", 1},
      },
    },
    order = "w",
  },
  {
    type = "technology",
    name = "corn-growth",
    icon = "__FoodIndustry__/graphics/technology/corn-growth.png",
    icon_size = 128,
    prerequisites = {"composting"},
    effects =
    {  
		{type = "unlock-recipe", recipe = "corn-growth"},
    },
    unit =
    {
      time = 40,
      count = 5,
      ingredients =
      {        
		{"food-science-pack", 1},
      },
    },
    order = "w",
  },
  {
    type = "technology",
    name = "soy-growth",
    icon = "__FoodIndustry__/graphics/technology/soy-growth.png",
    icon_size = 128,
    prerequisites = {"composting"},
    effects =
    {  
		{type = "unlock-recipe", recipe = "soy-growth"},
    },
    unit =
    {
      time = 40,
      count = 5,
      ingredients =
      {        
		{"food-science-pack", 1},
      },
    },
    order = "w",
  },
  {
    type = "technology",
    name = "rapeseed-growth",
    icon = "__FoodIndustry__/graphics/technology/rapeseed-growth.png",
    icon_size = 128,
    prerequisites = {"composting"},
    effects =
    {  
		{type = "unlock-recipe", recipe = "rapeseed-growth"},
    },
    unit =
    {
      time = 40,
      count = 5,
      ingredients =
      {        
		{"food-science-pack", 1},
      },
    },
    order = "w",
  },

  {
    type = "technology",
    name = "trees-growth-1",
    icon = "__FoodIndustry__/graphics/technology/trees-growth.png",
    icon_size = 128,
    prerequisites = {"composting"},
    effects =
    {
        {type = "unlock-recipe", recipe = "fruit-scissor"},
    },
    unit =
    {
    time = 30,
    count = 10,
    ingredients =
    {
        {"food-science-pack", 1},
    },
    },
    order = "w",
  },
   --[[{
    type = "technology",
    name = "trees-growth-2",
    icon = "__FoodIndustry__/graphics/technology/trees-growth.png",
    icon_size = 128,
    prerequisites = {"logistics", "trees-growth-1"},
    effects =
    {
      {type = "unlock-recipe", recipe = "food-picker"},
      {type = "unlock-recipe", recipe = "fi_recipe_tree_greenhouse"},
      {type = "unlock-recipe", recipe = "apple-basic-growth-seedling"},
      {type = "unlock-recipe", recipe = "orange-basic-growth-seedling"},
  },
    unit =
    {
    time = 40,
    count = 50,
    ingredients =
    {
        {"logistic-science-pack", 1},
        {"food-science-pack", 1},
    },
    },
    order = "w",
  },

  {
    type = "technology",
    name = "trees-growth-3",
    icon = "__FoodIndustry__/graphics/technology/trees-growth.png",
    icon_size = 128,
    prerequisites = {"fertilization-2", "trees-growth-2"},
    effects =
    {
      {type = "unlock-recipe", recipe = "fi-hydroponics-building"},
      {type = "unlock-recipe", recipe = "apple-advanced-growth-seedling"},
      {type = "unlock-recipe", recipe = "orange-advanced-growth-seedling"},
    },
    unit =
    {
      time = 40,
      count = 150,
      ingredients =
      {
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"food-science-pack", 1},
      },
    },
    order = "w",
  },]]

  {
    type = "technology",
    name = "cattle",
    icon = "__base__/graphics/icons/small-biter.png",
    icon_size = 32,
    prerequisites = {"composting", "automation"},
    effects =
    {
        {type = "unlock-recipe", recipe = "cattle-spawner"},
        {type = "unlock-recipe", recipe = "cattle-feeder"},
        {type = "unlock-recipe", recipe = "cattle-grabber"},
        {type = "unlock-recipe", recipe = "cattle-butcher"},
        {type = "unlock-recipe", recipe = "cattle-meat"},
        {type = "unlock-recipe", recipe = "cattle-wood-fence"},
        {type = "unlock-recipe", recipe = "cattle-wood-gate"},
    },
    unit =
    {
        time = 40,
        count = 15,
        ingredients =
        {
            {"food-science-pack", 1},
        },
    },
    order = "x",
  },
  
  
  {
    type = "technology",
    name = "advanced-composting",
    icon = "__FoodIndustry__/graphics/technology/advanced-composting.png",
    icon_size = 128,
    prerequisites = {"composting", "landfill"},
    effects =
    {  
		{type = "unlock-recipe", recipe = "compost-2"},
    },
    unit =
    {
      time = 20,
      count = 25,
      ingredients =
      {        
		{"logistic-science-pack", 1},
		{"food-science-pack", 1},
      },
    },
    order = "w",
  },
  {
    type = "technology",
    name = "cooking",
    icon = "__FoodIndustry__/graphics/technology/cooking.png",
    icon_size = 128,
    prerequisites = {"automation"},
    effects =
    {
        {type = "unlock-recipe", recipe = "burner-cooker"},
        {type = "unlock-recipe", recipe = "cooked-corn"},
        {type = "unlock-recipe", recipe = "cooked-soy"},
        {type = "unlock-recipe", recipe = "baked-potato"},
        {type = "unlock-recipe", recipe = "cooked-biter-meat"},
        {
        	type = "give-item",
        	item = "food-1-capsule",
        	count = 1
        }
    },
    unit =
    {
        time = 10,
        count = 10,
        ingredients =
        {
            {"automation-science-pack", 1},
        },
    },
    order = "w",
  },
  {
    type = "technology",
    name = "electric-heating",
    icon = "__FoodIndustry__/graphics/technology/electric-heating.png",
    icon_size = 128,
    prerequisites = {"steel-processing", "electronics", "cooking"},
    effects =
    {
        {type = "unlock-recipe", recipe = "electric-cooker"},
    },
    unit =
    {
        time = 60,
        count = 15,
        ingredients =
        {
            {"automation-science-pack", 2},
            {"logistic-science-pack", 2},
            {"food-science-pack", 1},
        },
    },
    order = "w",
  },
 {
    type = "technology",
    name = "canola-oil",
    icon = "__FoodIndustry__/graphics/technology/canola-oil.png",
    icon_size = 128,
    prerequisites = {"electric-heating", "rapeseed-growth"},
    effects =
    {  
		{type = "unlock-recipe", recipe = "canola-oil"},
    },
    unit =
    {
      time = 30,
      count = 30,
      ingredients =
      {        
		{"automation-science-pack", 1},
		{"logistic-science-pack", 1},
		{"food-science-pack", 1},
      },
    },
    order = "w",
  },
  {
    type = "technology",
    name = "canola-oil-processing",
    icon = "__base__/graphics/technology/oil-processing.png",
    icon_size = 128,
    prerequisites = {"canola-oil", "oil-processing"},
    effects =
    {  
		{type = "unlock-recipe", recipe = "canola-oil-processing"},
		{type = "unlock-recipe", recipe = "canola-oil-lubricant"},
    },
    unit =
    {
      time = 30,
      count = 70,
      ingredients =
      {        
		{"automation-science-pack", 1},
		{"logistic-science-pack", 1},
		{"food-science-pack", 1},
      },
    },
    order = "w",
  },
  {
    type = "technology",
    name = "advanced-farming",
    icon = "__FoodIndustry__/graphics/technology/advanced-farming-1.png",
    icon_size = 128,
    prerequisites = {"landfill", "electronics", "logistics", "potato-growth", "corn-growth", "soy-growth", "rapeseed-growth"},
    effects =
    {  
		{type = "unlock-recipe", recipe = "fi-greenhouse"},
		{type = "unlock-recipe", recipe = "lettuce-growth-w"},
		{type = "unlock-recipe", recipe = "cucumber-growth-w"},
		{type = "unlock-recipe", recipe = "tomato-growth-w"},
		{type = "unlock-recipe", recipe = "potato-growth-w"},
		{type = "unlock-recipe", recipe = "corn-growth-w"},
		{type = "unlock-recipe", recipe = "soy-growth-w"},
		{type = "unlock-recipe", recipe = "rapeseed-growth-w"},
		--{type = "unlock-recipe", recipe = "apple-growth-w"},
		--{type = "unlock-recipe", recipe = "orange-growth-w"},
},
    unit =
    {
      time = 60,
      count = 25,
      ingredients =
      {        
		{"automation-science-pack", 2},
		{"logistic-science-pack", 2},
		{"food-science-pack", 1},
      },
    },
    order = "w",
  },
  {
    type = "technology",
    name = "advanced-farming-2",
    icon = "__FoodIndustry__/graphics/technology/advanced-farming-2.png",
    icon_size = 128,
    prerequisites = {"advanced-farming", "advanced-electronics"},
    effects =
    {  
		{type = "unlock-recipe", recipe = "fi-big-greenhouse"},
    },
    unit =
    {
      time = 30,
      count = 150,
      ingredients =
      {        
		{"automation-science-pack", 1},
		{"logistic-science-pack", 1},
		{"chemical-science-pack", 1},
		{"food-science-pack", 1},
      },
    },
    order = "w",
  },
  {
    type = "technology",
    name = "advanced-farming-3",
    icon = "__FoodIndustry__/graphics/technology/advanced-farming-3.png",
    icon_size = 128,
    prerequisites = {"advanced-farming-2", "productivity-module-3", "fertilization-2", "advanced-material-processing-2"},
    effects =
    {  
		{type = "unlock-recipe", recipe = "fi-incubator"},
    },
    unit =
    {
      time = 60,
      count = 800,
      ingredients =
      {        
		{"automation-science-pack", 1},
		{"logistic-science-pack", 1},
		{"chemical-science-pack", 1},
		{"production-science-pack", 1},
		{"utility-science-pack", 1},
		{"food-science-pack", 1},
      },
    },
    order = "w",
  },
  {
    type = "technology",
    name = "crystal-extraction-1",
    icon = "__FoodIndustry__/graphics/technology/crystal-extraction-1.png",
    icon_size = 128,
    prerequisites = {"electric-heating", "fluid-handling"},
    effects =
    {  
      {type = "unlock-recipe", recipe = "crystal-extraction-stone"},
      {type = "unlock-recipe", recipe = "pure-water-boiled"},
    },
    unit =
    {
      time = 30,
      count = 40,
      ingredients =
      {        
		{"automation-science-pack", 1},
		{"logistic-science-pack", 1},
      },
    },
    order = "w",
  },
  {
    type = "technology",
    name = "crystal-extraction-2",
    icon = "__FoodIndustry__/graphics/technology/crystal-extraction-2.png",
    icon_size = 128,
    prerequisites = {"crystal-extraction-1", "oil-processing"},
    effects =
    {  
		{type = "unlock-recipe", recipe = "crystal-extraction-steam"},
    },
    unit =
    {
      time = 40,
      count = 200,
      ingredients =
      {        
		{"automation-science-pack", 1},
		{"logistic-science-pack", 1},
		{"chemical-science-pack", 1},
		{"food-science-pack", 1},
      },
    },
    order = "w",
  },
  {
    type = "technology",
    name = "fertilization",
    icon = "__FoodIndustry__/graphics/technology/fertilization.png",
    icon_size = 128,
    prerequisites = {"electric-heating", "advanced-farming", "advanced-composting"},
    effects =
    {  
		{type = "unlock-recipe", recipe = "compost-water"},
		{type = "unlock-recipe", recipe = "lettuce-growth-c"},
		{type = "unlock-recipe", recipe = "cucumber-growth-c"},
		{type = "unlock-recipe", recipe = "tomato-growth-c"},
		{type = "unlock-recipe", recipe = "potato-growth-c"},
		{type = "unlock-recipe", recipe = "corn-growth-c"},
		{type = "unlock-recipe", recipe = "soy-growth-c"},		
		{type = "unlock-recipe", recipe = "rapeseed-growth-c"},
		--{type = "unlock-recipe", recipe = "apple-growth-c"},
		--{type = "unlock-recipe", recipe = "orange-growth-c"},
},
    unit =
    {
      time = 30,
      count = 50,
      ingredients =
      {        
		{"automation-science-pack", 1},
		{"logistic-science-pack", 1},
		{"food-science-pack", 1},
      },
    },
    order = "w",
  },
  {
    type = "technology",
    name = "fertilization-2",
    icon = "__FoodIndustry__/graphics/technology/fertilization.png",
    icon_size = 128,
    prerequisites = {"fertilization", "advanced-farming-2", "advanced-oil-processing"},
    effects =
    {  
		{type = "unlock-recipe", recipe = "compost-cracking"},
		{type = "unlock-recipe", recipe = "fertilizer"},
		{type = "unlock-recipe", recipe = "fertilizer-water"},
		{type = "unlock-recipe", recipe = "lettuce-growth-f"},
		{type = "unlock-recipe", recipe = "cucumber-growth-f"},
		{type = "unlock-recipe", recipe = "tomato-growth-f"},
		{type = "unlock-recipe", recipe = "potato-growth-f"},
		{type = "unlock-recipe", recipe = "corn-growth-f"},
		{type = "unlock-recipe", recipe = "soy-growth-f"},
		{type = "unlock-recipe", recipe = "rapeseed-growth-f"},
		--{type = "unlock-recipe", recipe = "apple-growth-f"},
		--{type = "unlock-recipe", recipe = "orange-growth-f"},
},
    unit =
    {
      time = 30,
      count = 200,
      ingredients =
      {        
		{"automation-science-pack", 1},
		{"logistic-science-pack", 1},
		{"chemical-science-pack", 1},
		{"food-science-pack", 1},
      },
    },
    order = "w",
  },
  {
    type = "technology",
    name = "fertilizer-oil-cracking",
    icon = "__base__/graphics/technology/oil-processing.png",
    icon_size = 128,
    prerequisites = {"fertilization-2"},
    effects =
    {  
		{type = "unlock-recipe", recipe = "fertilizer-oil-cracking"},
    },
    unit =
    {
      time = 60,
      count = 80,
      ingredients =
      {        
		{"automation-science-pack", 1},
		{"logistic-science-pack", 1},
		{"chemical-science-pack", 1},
		{"production-science-pack", 1},
		{"food-science-pack", 1},
      },
    },
    order = "w",
  },
  {
    type = "technology",
    name = "electric-composting",
    icon = "__FoodIndustry__/graphics/technology/electric-composting.png",
    icon_size = 128,
    prerequisites = {"fertilization-2", "advanced-material-processing-2", "speed-module-2"},
    effects =
    {
        {type = "unlock-recipe", recipe = "fi-electric-composter"},
        {type = "unlock-recipe", recipe = "compost-auto-raw-straw"},
        {type = "unlock-recipe", recipe = "compost-auto-straw"},
        {type = "unlock-recipe", recipe = "compost-auto-compressed-straw"},
        {type = "unlock-recipe", recipe = "compost-auto-lettuce"},
        {type = "unlock-recipe", recipe = "compost-auto-cucumber"},
        {type = "unlock-recipe", recipe = "compost-auto-tomato"},
        {type = "unlock-recipe", recipe = "compost-auto-potato"},
        {type = "unlock-recipe", recipe = "compost-auto-corn"},
        {type = "unlock-recipe", recipe = "compost-auto-soy"},
        {type = "unlock-recipe", recipe = "compost-auto-rapeseed"},
    },
    unit =
    {
        time = 60,
        count = 450,
        ingredients =
        {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
            {"chemical-science-pack", 1},
            {"production-science-pack", 1},
            {"food-science-pack", 1},
        },
    },
    order = "w",
  },
  

  {
    type = "technology",
    name = "salad",
    icon = "__FoodIndustry__/graphics/technology/salad.png",
    icon_size = 128,
    prerequisites = {"cooking", "fish-cooking"},
    effects =
    {
        {type = "unlock-recipe", recipe = "basic-salad"},
        {type = "unlock-recipe", recipe = "fish-salad"},
    },
    unit =
    {
        time = 20,
        count = 40,
        ingredients =
        {
            {"food-science-pack", 1},
        },
    },
    order = "w",
  },

  {
    type = "technology",
    name = "frying",
    icon = "__FoodIndustry__/graphics/technology/frying.png",
    icon_size = 128,
    prerequisites = {"canola-oil", "potato-growth", "flour", "fish-cooking"},
    effects =
    {
        {type = "unlock-recipe", recipe = "raw-fries"},
        {type = "unlock-recipe", recipe = "fries"},
        {type = "unlock-recipe", recipe = "biter-steak"},
        {type = "unlock-recipe", recipe = "schnitzel"},
        {type = "unlock-recipe", recipe = "popcorn"},
        {type = "unlock-recipe", recipe = "fish-steak"},
    },
    unit =
    {
        time = 20,
        count = 70,
        ingredients =
        {
            {"food-science-pack", 1},
        },
    },
    order = "w",
  },
  {
    type = "technology",
    name = "fermentation",
    icon = "__FoodIndustry__/graphics/technology/fermentation.png",
    icon_size = 128,
    prerequisites = {"oil-processing", "cooking", "soy-growth"},
    effects =
    {  
		{type = "unlock-recipe", recipe = "soy-milk"},
		{type = "unlock-recipe", recipe = "tofu"},
		{type = "unlock-recipe", recipe = "pickles"},
    },
    unit =
    {
      time = 20,
      count = 40,
      ingredients =
      {        
		{"food-science-pack", 1},
      },
    },
    order = "w",
  },
  {
    type = "technology",
    name = "flour",
    icon = "__FoodIndustry__/graphics/technology/flour.png",
    icon_size = 128,
    prerequisites = {"cooking", "corn-growth"},
    effects =
    {  
		{type = "unlock-recipe", recipe = "corn-flour"},
		{type = "unlock-recipe", recipe = "corn-bread"},
    },
    unit =
    {
      time = 20,
      count = 20,
      ingredients =
      {        
		{"food-science-pack", 1},
      },
    },
    order = "w",
  },  
  {
    type = "technology",
    name = "seasoning",
    icon = "__FoodIndustry__/graphics/technology/seasoning.png",
    icon_size = 128,
    prerequisites = {"frying", "fermentation"},
    effects =
    {  
		{type = "unlock-recipe", recipe = "soy-sauce"},
		{type = "unlock-recipe", recipe = "best-salad"},
		{type = "unlock-recipe", recipe = "ketchup"},
		{type = "unlock-recipe", recipe = "ketchup-fries"},
  },
    unit =
    {
      time = 20,
      count = 50,
      ingredients =
      {        
		{"food-science-pack", 1},
      },
    },
    order = "w",
  },

  {
    type = "technology",
    name = "complex-foods",
    icon = "__FoodIndustry__/graphics/technology/complex-foods.png",
    icon_size = 128,
    prerequisites = {"seasoning", "salad", "fish-cooking"},
    effects =
    {
        {type = "unlock-recipe", recipe = "pizza"},
        {type = "unlock-recipe", recipe = "burger"},
        {type = "unlock-recipe", recipe = "tofu-pizza"},
        {type = "unlock-recipe", recipe = "tofu-burger"},
        {type = "unlock-recipe", recipe = "fish-pizza"},
        {type = "unlock-recipe", recipe = "fish-burger"},
        {type = "unlock-recipe", recipe = "fish-and-chips"},
    },
    unit =
    {
        time = 60,
        count = 200,
        ingredients =
        {
            {"food-science-pack", 1},
        },
    },
    order = "w",
  },

  ------------------------ Capsule technologies ------------------------
  {
    type = "technology",
    name = "nutrient-extraction",
    icon = "__FoodIndustry__/graphics/technology/nutrient-extraction-1.png",
    icon_size = 128,
    prerequisites = {"cooking"},
    effects =
    {
        {type = "unlock-recipe", recipe = "food-16-capsule"},
        {type = "unlock-recipe", recipe = "food-16-to-substances"},
        {type = "unlock-recipe", recipe = "simple-food-vmc-capsule"},
        {type = "unlock-recipe", recipe = "simple-food-vmf-capsule"},
        {type = "unlock-recipe", recipe = "simple-food-mcf-capsule"},
        {type = "unlock-recipe", recipe = "simple-food-vcf-capsule"},
    },
    unit =
    {
    time = 30,
    count = 50,
    ingredients =
        {
            {"food-science-pack", 1},
            {"automation-science-pack", 1},
        },
    },
    order = "w",
  },
  {
    type = "technology",
    name = "nutrient-extraction-2",
    icon = "__FoodIndustry__/graphics/technology/nutrient-extraction-2.png",
    icon_size = 128,
    prerequisites = {"nutrient-extraction", "gelatine", "electric-heating", "automation-2"}, -- TODO может переделать извлечение веществ 2 на assembling-machine-2
    effects =
    {
        -- TODO добавить сюда рецепты извлечения веществ 2
        {type = "unlock-recipe", recipe = "food-12-capsule"},
        {type = "unlock-recipe", recipe = "food-16-to-12-capsule"},
        {type = "unlock-recipe", recipe = "food-12-to-substances"},
        {type = "unlock-recipe", recipe = "basic-food-vm-capsule"},
        {type = "unlock-recipe", recipe = "basic-food-vc-capsule"},
        {type = "unlock-recipe", recipe = "basic-food-mc-capsule"},
        {type = "unlock-recipe", recipe = "basic-food-cf-capsule"},
    },
    unit =
    {
        time = 40,
        count = 100,
        ingredients =
        {
          {"logistic-science-pack", 1},
          {"chemical-science-pack", 1},
          {"food-science-pack", 1},
        },
    },
    order = "w",
  },
  {
    type = "technology",
    name = "advanced-nutrient-extraction",
    icon = "__FoodIndustry__/graphics/technology/advanced-nutrient-extraction.png",
    icon_size = 128,
    prerequisites = {"nutrient-extraction-2", "complex-foods", "nuclear-power"},
    effects =
    {
        -- TODO сюда включить производство желатина с других тканей и рецепты извлечения веществ 3
        {type = "unlock-recipe", recipe = "food-1-capsule"},
        {type = "unlock-recipe", recipe = "food-12-to-1-capsule"},
        {type = "unlock-recipe", recipe = "food-1-to-substances"},
        {type = "unlock-recipe", recipe = "advanced-food-v-capsule"},
        {type = "unlock-recipe", recipe = "advanced-food-m-capsule"},
        {type = "unlock-recipe", recipe = "advanced-food-c-capsule"},
        {type = "unlock-recipe", recipe = "advanced-food-f-capsule"},
		--{type = "unlock-recipe", recipe = "food-capsule"},
		--{type = "unlock-recipe", recipe = "vegan-food-capsule"},
    },
    unit =
    {
      time = 60,
      count = 600,
      ingredients =
      {        
		{"food-science-pack", 1},
		{"utility-science-pack", 1},
      },
    },
    order = "w",
  },
  {
    type = "technology",
    name = "gelatine",
    icon = "__FoodIndustry__/graphics/technology/gelatine.png",
    icon_size = 128,
    prerequisites = {"nutrient-extraction"},
    effects =
    {
        -- TODO сюда включить желатин и 
        {type = "unlock-recipe", recipe = "bone-gelatine-broth"},
        {type = "unlock-recipe", recipe = "fish-bone-gelatine-broth"},
        {type = "unlock-recipe", recipe = "mince-gelatine-broth"},
        {type = "unlock-recipe", recipe = "gelatine-granules"},
        {type = "unlock-recipe", recipe = "broth-gelatine-granules"},
        {type = "unlock-recipe", recipe = "basic-shell-capsule"},
        {type = "unlock-recipe", recipe = "advanced-shell-capsule"},
        },
    unit =
    {
        time = 30,
        count = 40,
        ingredients =
        {
            {"logistic-science-pack", 1},
            {"food-science-pack", 1},
        },
    },
    order = "w",
  },
  {
    type = "technology",
    name = "effect-capsules",
    icon = "__FoodIndustry__/graphics/technology/effect-capsules-1.png",
    icon_size = 128,
    prerequisites = {"gelatine", "nutrient-extraction"},
    effects =
    {
        {type = "unlock-recipe", recipe = "simple-speed-capsule"},
        {type = "unlock-recipe", recipe = "simple-speed-capsule-2"},
        {type = "unlock-recipe", recipe = "simple-crafting-capsule"},
        {type = "unlock-recipe", recipe = "simple-crafting-capsule-2"},
        {type = "unlock-recipe", recipe = "simple-mining-capsule"},
        {type = "unlock-recipe", recipe = "simple-mining-capsule-2"},
        {type = "unlock-recipe", recipe = "simple-long-reach-capsule"},
        -- TODO add other simple capsules
        {type = "unlock-recipe", recipe = "simple-digestive-capsule"},
        {type = "unlock-recipe", recipe = "simple-neutralizing-capsule"},
    },
    unit =
    {
        time = 40,
        count = 200,
        ingredients =
        {
            {"logistic-science-pack", 1},
            {"food-science-pack", 1},
            {"automation-science-pack", 1},
        },
    },
    order = "w",
  },
  {
    type = "technology",
    name = "effect-capsules-2", -- TODO make technology sprite
    icon = "__FoodIndustry__/graphics/technology/effect-capsules-2.png",
    icon_size = 128,
    prerequisites = {"effect-capsules", "nutrient-extraction-2", "food-energy-efficiency-2"},
    effects =
    {
        {type = "unlock-recipe", recipe = "basic-speed-capsule"},
        {type = "unlock-recipe", recipe = "basic-crafting-capsule"},
        {type = "unlock-recipe", recipe = "basic-mining-capsule"},
        {type = "unlock-recipe", recipe = "basic-long-reach-capsule"},
        {type = "unlock-recipe", recipe = "basic-digestive-capsule"},
        -- TODO add this basic capsules
        --{type = "unlock-recipe", recipe = "basic-neutralizing-capsule"},
        {type = "unlock-recipe", recipe = "basic-sleep-capsule"},
        {type = "unlock-recipe", recipe = "basic-health-buffer-capsule"},
        {type = "unlock-recipe", recipe = "basic-regen-capsule"},
    },
    unit =
    {
      time = 60,
      count = 500,
      ingredients =
      {        
		{"food-science-pack", 2},
		{"utility-science-pack", 1},
		{"production-science-pack", 1},
      },
    },
    order = "w",
  },
  {
    type = "technology",
    name = "effect-capsules-3",
    icon = "__FoodIndustry__/graphics/technology/effect-capsules-3.png",
    icon_size = 128,
    prerequisites = {"effect-capsules-2", "advanced-nutrient-extraction", "fi-tech-more-energy-4", "food-energy-efficiency-5"},
    effects =
    {  
    {type = "unlock-recipe", recipe = "advanced-speed-capsule"},
    {type = "unlock-recipe", recipe = "advanced-crafting-capsule"},
    {type = "unlock-recipe", recipe = "advanced-mining-capsule"},
    {type = "unlock-recipe", recipe = "advanced-long-reach-capsule"},
    {type = "unlock-recipe", recipe = "advanced-digestive-capsule"},
    -- TODO add this advanced capsules
    --{type = "unlock-recipe", recipe = "advanced-neutralizing-capsule"},
    {type = "unlock-recipe", recipe = "advanced-sleep-capsule"},
    {type = "unlock-recipe", recipe = "advanced-health-buffer-capsule"},
    {type = "unlock-recipe", recipe = "advanced-regen-capsule"},
    {type = "unlock-recipe", recipe = "invulnerability-capsule"},
},
    unit =
    {
      time = 60,
      count = 2000,
      ingredients =
      {        
		{"food-science-pack", 4},
		{"utility-science-pack", 1},
		{"production-science-pack", 1},
		{"chemical-science-pack", 1},
      },
    },
    order = "w",
  },
  
  -- More Energy technologies
  
  {
    type = "technology",
    name = "fi-tech-more-energy-1",
    icon = "__FoodIndustry__/graphics/technology/fi-tech-more-energy-1.png",
    icon_size = 128,
    prerequisites = {"composting"},
    effects = {
        {
            type = "nothing",
            effect_description = {'technology-effect.fi-tech-more-energy-bonus', "50"},
            icon = "__FoodIndustry__/graphics/technology/fi-tech-more-energy-bonus-1.png",
            modifier = 50
        },
        {
        	type = "give-item",
        	item = "simple-food-vmc-capsule",
        	count = 2
        }
    },
    unit =
    {
      time = 30,
      count = 20,
      ingredients =
      {        
		{"automation-science-pack", 1},
		{"food-science-pack", 1},
      },
    },
    --upgrade = true,
    order = "w",
  },
  {
    type = "technology",
    name = "fi-tech-more-energy-2",
    icon = "__FoodIndustry__/graphics/technology/fi-tech-more-energy-2.png",
    icon_size = 128,
    prerequisites = {"fi-tech-more-energy-1"},
    effects = {
        {
            type = "nothing",
            effect_description = {'technology-effect.fi-tech-more-energy-bonus', "50"}
        },
        {
        	type = "give-item",
        	item = "simple-food-vmc-capsule",
        	count = 2
        },
        {
        	type = "give-item",
        	item = "simple-food-mcf-capsule",
        	count = 2
        },
        {
        	type = "give-item",
        	item = "simple-speed-capsule",
        	count = 1
        },
        {
        	type = "give-item",
        	item = "simple-crafting-capsule",
        	count = 1
        }
    },
    unit =
    {
      time = 30,
      count = 40,
      ingredients =
      {        
		{"automation-science-pack", 2},
		{"logistic-science-pack", 1},
		{"food-science-pack", 1},
      },
    },
    order = "w",
  },
  -- fi-tech-more-energy-3 +100 = 300,
  {
    type = "technology",
    name = "fi-tech-more-energy-3",
    icon = "__FoodIndustry__/graphics/technology/fi-tech-more-energy-3.png",
    icon_size = 128,
    prerequisites = {"fi-tech-more-energy-2"},
    effects = {
        {
            type = "nothing",
            effect_description = {'technology-effect.fi-tech-more-energy-bonus', "100"}
        },
        {
        	type = "give-item",
        	item = "basic-speed-capsule",
        	count = 1
        },
        {
        	type = "give-item",
        	item = "basic-crafting-capsule",
        	count = 1
        }
    },
    unit =
    {
      time = 30,
      count = 100,
      ingredients =
      {        
		{"logistic-science-pack", 2},
		{"chemical-science-pack", 1},
		{"food-science-pack", 2},
      },
    },
    order = "w",
  },
  -- fi-tech-more-energy-4 +100 = 400, and
  {
    type = "technology",
    name = "fi-tech-more-energy-4",
    icon = "__FoodIndustry__/graphics/technology/fi-tech-more-energy-3.png",
    icon_size = 128,
    prerequisites = {"fi-tech-more-energy-3", "advanced-farming-3"},
    effects = {
        {
            type = "nothing",
            effect_description = {'technology-effect.fi-tech-more-energy-bonus', "100"}
        },
        {
        	type = "give-item",
        	item = "basic-speed-capsule",
        	count = 2
        },
        {
        	type = "give-item",
        	item = "basic-crafting-capsule",
        	count = 2
        }
    },
    unit =
    {
      time = 30,
      count = 100,
      ingredients =
      {        
		{"chemical-science-pack", 2},
		{"utility-science-pack", 1},
		{"food-science-pack", 4},
      },
    },
    order = "w",
  },
  -- fi-tech-more-energy-5 +100 = 500 max.
  {
    type = "technology",
    name = "fi-tech-more-energy-5",
    icon = "__FoodIndustry__/graphics/technology/fi-tech-more-energy-5.png",
    icon_size = 128,
    prerequisites = {"fi-tech-more-energy-4", "advanced-nutrient-extraction"},
    effects = {
        {
            type = "nothing",
            effect_description = {'technology-effect.fi-tech-more-energy-bonus', "100"}
        },
    },
    unit =
    {
      time = 30,
      count = 200,
      ingredients =
      {        
		{"chemical-science-pack", 2},
		{"utility-science-pack", 1},
		{"space-science-pack", 1},
		{"food-science-pack", 4},
      },
    },
    order = "w",
  },
  
  -- TODO Button technologies
  {
    type = "technology",
    name = "fi-tech-eatout-button",
    icon = "__FoodIndustry__/graphics/technology/fi-tech-eatout-button.png",
    icon_size = 128,
    prerequisites = {"cooking", "food-energy-efficiency-1"},
    effects =
    {  
		--{type = "unlock-recipe", recipe = "simple-mining-capsule-food-capsule"},
    },
    unit =
    {
      time = 30,
      count = 50,
      ingredients =
      {        
		{"automation-science-pack", 1},
		{"food-science-pack", 1},
      },
    },
    order = "w",
  },
  {
    type = "technology",
    name = "fi-tech-eating-button",
    icon = "__FoodIndustry__/graphics/technology/fi-tech-eating-button.png",
    icon_size = 128,
    prerequisites = {"cooking", "fi-tech-eatout-button"},
    effects = {},
    unit =
    {
      time = 60,
      count = 60,
      ingredients =
      {        
		{"food-science-pack", 3},
		{"logistic-science-pack", 3},
		{"chemical-science-pack", 2},
		{"utility-science-pack", 1},
      },
    },
    order = "w",
  },

  -- fish technologies
  {
    type = "technology",
    name = "fishing",
    icon = "__FoodIndustry__/graphics/technology/fishing.png",
    icon_size = 128,
    prerequisites = {"automation"},
    effects =
    {
        {type = "unlock-recipe", recipe = "fish-meat"},
    },
    unit =
    {
        time = 20,
        count = 20,
        ingredients =
        {
            {"food-science-pack", 1},
        },
    },
    order = "w",
  },
  {
    type = "technology",
    name = "fish-breeding",
    icon = "__FoodIndustry__/graphics/technology/fish-breeding.png",
    icon_size = 128,
    prerequisites = {"fishing"},
    effects =
    {
        {type = "unlock-recipe", recipe = "fishing-inserter"},
        {type = "unlock-recipe", recipe = "fish-farm"},
    },
    unit =
    {
        time = 30,
        count = 50,
        ingredients =
        {
            {"food-science-pack", 1},
            {"logistic-science-pack", 1},
        },
    },
    order = "w",
  },
  {
    type = "technology",
    name = "fish-breeding-2",
    icon = "__FoodIndustry__/graphics/technology/fish-breeding-2.png",
    icon_size = 128,
    prerequisites = {"fish-breeding"},
    effects =
    {
        {type = "unlock-recipe", recipe = "sturgeon-farm"},
        {type = "unlock-recipe", recipe = "sturgeon-meat"},
        {type = "unlock-recipe", recipe = "sturgeon-fish-meat-fish-caviar-red"},
    },
    unit =
    {
        time = 50,
        count = 150,
        ingredients =
        {
            {"food-science-pack", 2},
            {"logistic-science-pack", 1},
            {"chemical-science-pack", 1},
        },
    },
    order = "w",
  },
  {
    type = "technology",
    name = "fishing-2",
    icon = "__FoodIndustry__/graphics/technology/fishing-2.png",
    icon_size = 128,
    prerequisites = {"fish-breeding"},
    effects =
    {
        {type = "unlock-recipe", recipe = "fi-watertile"},
        {type = "unlock-recipe", recipe = "fi-deepwatertile"},
        {type = "unlock-recipe", recipe = "fi-shovel"},
    },
    unit =
    {
        time = 30,
        count = 100,
        ingredients =
        {
            {"logistic-science-pack", 1},
            {"food-science-pack", 2},
            {"chemical-science-pack", 1},
        },
    },
    order = "w",
  },
  {
    type = "technology",
    name = "fish-cooking",
    icon = "__FoodIndustry__/graphics/technology/fish-cooking.png",
    icon_size = 128,
    prerequisites = {"fishing", "cooking", "flour"},
    effects =
    {
        {type = "unlock-recipe", recipe = "fish-meat-fish-caviar-red"},
        {type = "unlock-recipe", recipe = "cooked-fish-meat"},
        },
    unit =
    {
        time = 30,
        count = 30,
        ingredients =
        {
            {"logistic-science-pack", 1},
            {"food-science-pack", 1},
        },
    },
    order = "w",
  },

  {
    type = "technology",
    name = "fruit-juicing",
    icon = "__FoodIndustry__/graphics/technology/fruit-juicing.png",
    icon_size = 128,
    prerequisites = {"electric-heating", "oil-processing"},
    effects =
    {
        {type = "unlock-recipe", recipe = "raw-apple-juice"},
        {type = "unlock-recipe", recipe = "apple-juice"},
        {type = "unlock-recipe", recipe = "raw-orange-juice"},
        {type = "unlock-recipe", recipe = "orange-juice"},
        {type = "unlock-recipe", recipe = "raw-tomato-juice"},
        {type = "unlock-recipe", recipe = "tomato-juice"},
       -- tara with fruit juices insert to this tech on prototypes\drinks\drinks-item-recipe.lua
    },
    unit =
    {
        time = 50,
        count = 50,
        ingredients =
        {
            {"food-science-pack", 3},
            {"logistic-science-pack", 2},
            {"chemical-science-pack", 1},
        },
    },
    order = "w",
  },

  -- TODO Sleep technologies


  
})