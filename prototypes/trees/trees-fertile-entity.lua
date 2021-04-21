data:extend(
{

-------------------------------------- Fertile Trees ----------------------------------------

  {
    type = "assembling-machine",
    name = "apple-fertile-tree",
    icon = "__FoodIndustry__/graphics/icons/entities/apple-fertile-tree.png",
    icon_size = 32,
    flags = {"placeable-neutral", "placeable-player", "player-creation", "not-repairable"},
    minable = {hardness = 0.2, mining_time = 0.5},
    max_health = 80,
    resistances =
    {
      {
        type = "physical",
        percent = 2
      }
    },
    selection_box = {{-0.75, -0.75}, {0.75, 0.75}},
    collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
    collision_mask = {"item-layer", "object-layer", "water-tile", "resource-layer", "player-layer"},
    animation =
    {
      layers = {
        {
        filename = "__FoodIndustry__/graphics/entity/trees/apple-fertile-tree.png",
        priority = "high",
        width = 945,
        height = 771,
        scale = 0.4,
        frame_count = 1,
        line_length = 1,
        shift = {0.45, 0.0},
        }
      }
    },
    working_visualisations =
    {
      {
        animation =
        {
        filename = "__FoodIndustry__/graphics/entity/trees/apple-fertile-tree-working.png",
            priority = "high",
            width = 945,
            height = 771,
            frame_count = 1,
            line_length = 1,
            animation_speed = 0.14,
            shift = {0.722, -0.426},
            scale = 0.4,
        run_mode = "forward-then-backward",
        }
        --[[animation =
        {
            filename = "__FoodIndustry__/graphics/entity/farms/fi-basic-farmland-working.png",
            priority = "high",
            width = 481,
            height = 337,
            frame_count = 24,
            line_length = 4,
            animation_speed = 0.08,
            shift = {0.722, -0.426},
            scale = 0.4,
			--repeat_count = 1,
        }]]
      },
--[[       {
        animation =
        {
        filename = "__FoodIndustry__/graphics/entity/fi-table-wood1.png",
        priority = "high",
        width = 168,
        height = 138,
        scale = 0.16,
        frame_count = 1,
        shift = {-2.03, 2.11},
        },
        {
        draw_as_shadow = true,
            filename = "__FoodIndustry__/graphics/entity/fi-table-wood1-shadow.png",
        priority = "high",
        width = 398,
        height = 201,
        scale = 0.16,
        frame_count = 1,
        shift = {-1.40, 2.24},
        }
      },
 ]]    },
    open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
    close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
    working_sound =
    {
      sound = {
        {
          filename = "__base__/sound/assembling-machine-t2-1.ogg",
          volume = 0.0
        }
      },
      idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.0 },
      apparent_volume = 0.0,
    },
    crafting_categories = {"basic-crop-growth"},
    crafting_speed = 0.6,
    energy_source =
    {
    type = "burner",
    usage_priority = "secondary-input",
    fuel_categories = {"humus"},		-- changed by Oceanel
    fuel_inventory_size = 1,
    --emissions = -0.02,
    emissions_per_minute = -2 / 100 * 30,
    light_flicker = { intensity = 0, size = 0}, color = { r = 0.0, g = 0.0, b = 0.0 },
    },
    energy_usage = "500W", 
    ingredient_count = 1,
    module_specification =
    {
      module_slots = 0,
      module_info_icon_shift = {0, 0.5},
      module_info_multi_row_initial_height_modifier = -0.3
    },
    order = "d-a",
    allowed_effects = {}
  },

})