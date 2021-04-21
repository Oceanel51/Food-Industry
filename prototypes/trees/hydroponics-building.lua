data:extend({

    -- HYDROPONICS BUILDING
    -- TODO: add pipe connections they should be located on the left and right edges 2.5 squars down from the center.
    {
        type = "assembling-machine",
        name = "fi-hydroponics-building",
        icon = "__FoodIndustry__/graphics/icons/entities/hydroponics-building.png",
        icon_size = 32,
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        minable = {hardness = 0.2, mining_time = 0.5, result = "fi-hydroponics-building"},
        max_health = 300,
        corpse = "big-remnants",
        dying_explosion = "medium-explosion",
        collision_box = {{-4.2, -3.2}, {4.2, 3.2}},
        selection_box = {{-4.5, -3.5}, {4.5, 3.5}},
        fluid_boxes =
        {
            {
                production_type = "input",
                pipe_picture = assembler2pipepictures(),
                pipe_covers = pipecoverspictures(),
                base_area = 10,
                base_level = -1,
                pipe_connections = {{ type="input", position = {-5, 0} }}
            },
        },

        animation =
        {
            layers =
            {
                {
                    filename = "__FoodIndustry__/graphics/entity/hydroponics-building/growing.png",
                    width = 258,
                    height = 186.5,
                    frame_count = 16,
                    line_length = 4,
                    animation_speed = 1/30,
                    shift = util.by_pixel(-1.5, -0.25)
                },
                {
                    filename = "__FoodIndustry__/graphics/entity/hydroponics-building/glass-dome.png",
                    width = 288,
                    height = 224,
                    frame_count = 1,
                    repeat_count = 16,
                    -- frame_count = 16,
                    -- line_length = 4,
                    -- animation_speed = 1 / 30,
                    hr_version =
                    {
                        filename = "__FoodIndustry__/graphics/entity/hydroponics-building/hr-glass-dome.png",
                        width = 576,
                        height = 448,
                        frame_count = 1,
                        repeat_count = 16,
                        -- frame_count = 16,
                        -- line_length = 4,
                        -- animation_speed = 1 / 30,
                        scale = 0.5
                    }
                },
                {
                    filename = "__FoodIndustry__/graphics/entity/hydroponics-building/hydroponics-building-shadow.png",
                    width = 320,
                    height = 207,
                    frame_count = 1,
                    repeat_count = 16,
                    shift = util.by_pixel(16.75, 5.5),
                    draw_as_shadow = true,
                    hr_version =
                    {
                        filename = "__FoodIndustry__/graphics/entity/hydroponics-building/hr-hydroponics-building-shadow.png",
                        width = 641,
                        height = 414,
                        frame_count = 1,
                        repeat_count = 16,
                        shift = util.by_pixel(16.75, 5.5),
                        scale = 0.5,
                        draw_as_shadow = true
                    }
                }
            }
        },
        crafting_categories = {"advanced-tree-growth"},
        crafting_speed = 5,
        energy_source =
        {
            type = "electric",
            usage_priority = "secondary-input",
            -- emissions = 0.05 / 1.5
            --emissions_per_minute = ( 0.05 / 1.5 ) / 100 * 30,
        },
        energy_usage = "800kW",
        ingredient_count = 5,
        -- open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
        -- close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
        vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
        working_sound =
        {
            sound =
            {
                filename = "__base__/sound/lab.ogg",
                volume = 0.7
            },
            apparent_volume = 1
        },
        -- module_specification = { module_slots = 0 }
    },

    {
        type = "item",
        name = "fi-hydroponics-building",
        icon = "__FoodIndustry__/graphics/icons/entities/hydroponics-building.png",
        icon_size = 32,
        subgroup = "food-machines-trees",
        order = "w-a-c2",
        place_result = "fi-hydroponics-building",
        stack_size = 50
    },


    {
        type = "recipe",
        name = "fi-hydroponics-building",
        energy_required = 15,
        ingredients =
        {

            {"steel-plate", 25},
            {"plastic-bar", 80},
            -- {"glass", 80},
            {"stone-brick", 80},
            --{"life-support-unit", 15},
            {"electronic-circuit", 10},
            {"fertilizer", 200}
        },
        result = "fi-hydroponics-building",
        enabled = false,
    },


})