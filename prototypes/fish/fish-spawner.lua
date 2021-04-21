-- fish spawner
data:extend({

    {
        type = "item",
        name = "fish-farm",
        icon = "__FoodIndustry__/graphics/icons/entities/fishfarm.png",
        icon_size = 32,
        subgroup = "food-machines-fish",
        order = "w-a-k",
        place_result = "fish-farm",
        stack_size = 50
    },

    {
        type = "assembling-machine",
        name = "fish-farm",
        icon = "__FoodIndustry__/graphics/icons/entities/fishfarm.png",
        icon_size = 32,
        flags = {"placeable-player", "placeable-enemy", "not-repairable"},
        minable = {hardness = 0.2, mining_time = 2.0, result = "fish-farm"},
        max_health = 50,
        order="b-b-h",
        subgroup="food-machines-fish",
        working_sound =
        {
            sound =
            {
                {
                    filename = "__base__/sound/creatures/spawner.ogg",
                    volume = 1.0
                }
            },
            apparent_volume = 2
        },
        dying_sound =
        {
            {
                filename = "__base__/sound/creatures/spawner-death-1.ogg",
                volume = 1.0
            },
            {
                filename = "__base__/sound/creatures/spawner-death-2.ogg",
                volume = 1.0
            }
        },
        resistances =
        {
            {
                type = "physical",
                decrease = 2,
                percent = 15
            },
            {
                type = "explosion",
                decrease = 5,
                percent = 15
            },
            {
                type = "fire",
                decrease = 3,
                percent = 60
            }
        },
        healing_per_tick = 0.02,
        collision_mask = {'object-layer',"ground-tile", "train-layer"},
        collision_box = {{-0.5, -0.5}, {1.0, 0.6}},
        selection_box = {{-0.7, -0.7}, {1.2, 0.8}},
        crafting_categories = {"fish-feeding"},
        corpse = "spitter-spawner-corpse",
        dying_explosion = "blood-explosion-huge",
        crafting_speed = 1,
        energy_source =
        {
          type = "void",
        },
        energy_usage = "20kW",
        order = "d-e",
        animation =
        {
          layers =
          {
            {
                filename = "__FoodIndustry__/graphics/entity/fishfarm/fishfarm.png",
                frame_count = 1,
                width = 76,
                height = 46,
                priority = "extra-high",
                shift = {0.5156, 0.0625},
              },
          }
        },
        source_inventory_size = 1,
        result_inventory_size = 1,	
    },
    {
        type = "recipe",
        name = "fish-farm",
        enabled = false,
        energy_required = 60,
        ingredients =
        {
            {"iron-plate", 25},
            {"stone-brick", 80},
            {"electronic-circuit", 10}
        },
        result = "fish-farm"
    },
})
