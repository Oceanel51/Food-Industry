data:extend({
	
-- Packages
  {
	type = "recipe",
	name = "flask",
	order = "a-b-a",
	enabled = true,
	icon = "__FoodIndustry__/graphics/icons/items/flask.png",
	icon_size = 64,
	category = "crafting",
	subgroup = "drink-empty-packages",
	energy_required = 4.5,
	ingredients =
	{
		{"iron-plate", 1},
	},
	results =
	{
		{"flask", 1}
	}
  },
  {
	type = "recipe",
	name = "flask-recycle",
	order = "a-b-b",
	enabled = true,
	icon = "__FoodIndustry__/graphics/icons/items/flask-recycle.png",
	icon_size = 64,
	category = "crafting",
	subgroup = "drink-empty-packages",
	energy_required = 6,
	ingredients =
	{
		{"flask", 4}
	},
	results =
	{
		{"iron-plate", 1},
	},
	hide_from_stats = true,
	--allow_decomposition = false,
	allow_as_intermediate = false,
	allow_intermediates = false,
  },
  -- hand crafted recipe
  {
	type = "recipe",
	name = "hand-flask-pure-water",
	enabled = true,
	hidden = true,
	icons = {
		{ icon = "__FoodIndustry__/graphics/icons/drinks/flask-full.png", },
		{
			icon = "__FoodIndustry__/graphics/icons/drinks/flask-full-mask.png",
			tint = {r=0.0,g=0.6,b=1.0,a=0.6},
		},
	},
	icon_size = 64,
	category = "food-capsules",
	subgroup = "drinks-pure-water",
	order = "w-d0",
	energy_required = 1.9,
	ingredients = {
		--{"flask", 1},
		--{type="fluid", name="pure-water", amount=30}
	},
	results = {
		{"flask-pure-water", 1},
	},
	allow_decomposition = true
  },
  {
	type = "recipe",
	name = "hand-plastic-bottle-pure-water",
	enabled = true,
	hidden = true,
	icons = {
		{ icon = "__FoodIndustry__/graphics/icons/drinks/plastic-bottle-full.png", },
		{
			icon = "__FoodIndustry__/graphics/icons/drinks/plastic-bottle-full-mask.png",
			tint = {r=0.0,g=0.5,b=1.0,a=0.5},
		},
	},
	icon_size = 64,
	category = "food-capsules",
	subgroup = "drinks-pure-water",
	order = "w-d0",
	energy_required = 3.5,
	ingredients = {},
	results = {
		{"plastic-bottle-pure-water", 1},
	},
	allow_decomposition = true
  },
  -- empty recipe
  {
	type = "recipe",
	name = "to-empty-flask-pure-water",
	enabled = true,
	icon = "__FoodIndustry__/graphics/icons/drinks/to-empty-flask-pure-water.png",
	icon_size = 64,
	category = "crafting-with-fluid",
	subgroup = "drinks-pure-water",
	order = "w-d1",
	energy_required = 0.9,
	ingredients = {
		{"flask-pure-water", 1},
	},
	results = {
		{"flask", 1},
		{type="fluid", name="pure-water", amount=30}
	},
	allow_decomposition = true
  },

  -- plastic-bottles
  {
	type = "recipe",
	name = "plastic-bottle",
	order = "a-c-a",
	enabled = false,
	icon = "__FoodIndustry__/graphics/icons/items/plastic-bottle.png",
	icon_size = 64,
	category = "crafting",
	subgroup = "drink-empty-packages",
	energy_required = 3.0,
	ingredients =
	{
		{"plastic-bar", 1},
	},
	results =
	{
		{"plastic-bottle", 4}
	}
  },


  -- juices fluids
  {
	type = "recipe",
	name = "raw-apple-juice",
	enabled = false,
	icon = "__FoodIndustry__/graphics/icons/fluids/raw-apple-juice.png",
	icon_size = 32,
	category = "crafting-with-fluid",
	--categories = {"crafting-with-fluid", "advanced-cooking"},
	subgroup = "drinks-apple",
	order = "w-d1",
	energy_required = 0.85,
	ingredients = {
		{"apple", 1},
	},
	results = {
		{type="fluid", name="raw-apple-juice", amount=3},
		{type="item", name="raw-straw", amount_min=1, amount_max=3},
	},
	allow_decomposition = true
  },
  {
	type = "recipe",
	name = "apple-juice",
	enabled = false,
	icon = "__FoodIndustry__/graphics/icons/fluids/apple-juice.png",
	icon_size = 32,
	category = "chemistry",
	subgroup = "drinks-apple",
	order = "w-d2",
	energy_required = 0.6,
	ingredients = {
		{type="fluid", name="raw-apple-juice", amount=10},
		{type="fluid", name="pure-water", amount=6},
	},
	results = {
		{type="fluid", name="apple-juice", amount=16},
	},
	allow_decomposition = true
  },
  
  {
	type = "recipe",
	name = "raw-orange-juice",
	enabled = false,
	icon = "__FoodIndustry__/graphics/icons/fluids/raw-orange-juice.png",
	icon_size = 32,
	category = "crafting-with-fluid",
	subgroup = "drinks-orange",
	order = "w-d1",
	energy_required = 0.85,
	ingredients = {
		{"orange", 1},
	},
	results = {
		{type="fluid", name="raw-orange-juice", amount=2},
		{type="item", name="raw-straw", amount_min=1, amount_max=3},
	},
	allow_decomposition = true
  },
  {
	type = "recipe",
	name = "orange-juice",
	enabled = false,
	icon = "__FoodIndustry__/graphics/icons/fluids/orange-juice.png",
	icon_size = 32,
	category = "chemistry",
	subgroup = "drinks-orange",
	order = "w-d2",
	energy_required = 0.6,
	ingredients = {
		{type="fluid", name="raw-orange-juice", amount=10},
		{type="fluid", name="pure-water", amount=10},
	},
	results = {
		{type="fluid", name="orange-juice", amount=20},
	},
	allow_decomposition = true
  },

  {
	type = "recipe",
	name = "raw-tomato-juice",
	enabled = false,
	icon = "__FoodIndustry__/graphics/icons/fluids/raw-tomato-juice.png",
	icon_size = 32,
	category = "crafting-with-fluid",
	subgroup = "drinks-tomato",
	order = "w-d1",
	energy_required = 0.85,
	ingredients = {
		{"tomato", 1},
	},
	results = {
		{type="fluid", name="raw-tomato-juice", amount=3},
		{type="item", name="raw-straw", amount_min=1, amount_max=4},
	},
	allow_decomposition = true
  },
  {
	type = "recipe",
	name = "tomato-juice",
	enabled = false,
	icon = "__FoodIndustry__/graphics/icons/fluids/tomato-juice.png",
	icon_size = 32,
	category = "chemistry",
	subgroup = "drinks-tomato",
	order = "w-d2",
	energy_required = 0.6,
	ingredients = {
		{type="fluid", name="raw-tomato-juice", amount=10},
		{type="fluid", name="pure-water", amount=8},
		-- TODO add "crystal" item or salt, then balancing
	},
	results = {
		{type="fluid", name="tomato-juice", amount=18},
	},
	allow_decomposition = true
  },

})