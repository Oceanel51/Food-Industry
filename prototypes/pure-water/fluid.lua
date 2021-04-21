data:extend({

--[[   {
    type = "fluid",
    name = "spring-water",
    default_temperature = 8,
    max_temperature = 100,
    heat_capacity = "0.1KJ",
    base_color = {r=0, g=0, b=0.8,a=1.0},
    flow_color = {r=0, g=0, b=0.8,a=1.0},
    icon = "__FoodIndustry__/graphics/icons/fluids/pure-water-1.png",
    icon_size = 32,
    order = "pure-water",
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
  }, ]]

  -- pure-water
  {
    type = "fluid",
    name = "pure-water",
    default_temperature = 15,
    max_temperature = 100,
    heat_capacity = "0.5KJ",
    base_color = {r=0.61, g=0.76, b=0.78,a=1.0},
    flow_color = {r=0.61, g=0.76, b=0.78,a=1.0},
    icon = "__FoodIndustry__/graphics/icons/fluids/pure-water.png",
    icon_size = 32,
    order = "pure-water",
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
  },

  {
    type = "noise-layer",
    name = "pure-water"
  },
  {
    type = "autoplace-control",
    name = "pure-water",
    richness = true,
    order = "b-f",
    category = "resource",
  },

  {
    type = "resource",
    name = "pure-water",
    icon = "__FoodIndustry__/graphics/icons/fluids/pure-water.png",
    icon_size = 32,
    flags = {"placeable-neutral"},
    category = "basic-fluid",
    order="a-b-a",
    infinite = false,
    highlight = true,
    minimum = 1800,
    normal = 5000,
  	starting = {richness=20, size=1, probability=0.1},
    starting_area_size = 30,
    starting_area_amount = 1300,
    infinite_depletion_amount = 0,
    resource_patch_search_radius = 10,
    tree_removal_probability = 0.6,
    tree_removal_max_distance = 32 * 32,
    minable =
    {
      hardness = 1,
      mining_time = 1,
      results =
      {
        {
          type = "fluid",
          name = "pure-water",
          amount_min = 5,
          amount_max = 10,
          probability = 1
        }
      }
    },
    collision_box = {{ -1.4, -1.4}, {1.4, 1.4}},
    selection_box = {{ -0.5, -0.5}, {0.5, 0.5}},
    autoplace =
    {
      order = "b",
      control = "pure-water",
      sharpness = 0.08,
      max_probability = 0.001,
      richness_base = 10,
      richness_multiplier = 10000,
      richness_multiplier_distance_bonus = 150,
      coverage = (0.006 / 3) ,
      peaks = {
        {
          noise_layer = "pure-water",
          noise_octaves_difference = -0.5,
          noise_persistence = 0.4,
        }
      }
    },
    stage_counts = {0},
    stages = {
      sheet =
      {
        filename = "__FoodIndustry__/graphics/entity/pure-water/pure-water.png",
        priority = "extra-high",
        width = 75,
        height = 61,
        frame_count = 4,
        variation_count = 1
      }
    },
    map_color = {r=0, g=0.4, b=0.8, a=0.7},
    map_grid = false
  },

--[[   {
    type = "fluid",
    name = "biomass-food",
    default_temperature = 1,
    max_temperature = 10,
    heat_capacity = "1KJ",
    base_color = {r=0.7, g=0.5, b=0.5,a=0.4},
    flow_color = {r=0.7, g=0.5, b=0.5,a=0.4},
    icon = "__hardcorio__/graphics/icons/items/biomass-food.png",
    icon_size = 32,
    order = "q-biomass-food",
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
  },
]]

})