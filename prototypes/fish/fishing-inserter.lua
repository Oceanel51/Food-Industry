-- item
data:extend(
    {
        {
            type = "item",
            name = "burner-fishing-inserter",
            icon = "__FoodIndustry__/graphics/icons/entities/fishing-inserter.png",
            icon_size = 32,

            subgroup = "food-machines-fish",
            order = "w-a-i",
            place_result = "burner-fishing-inserter",
            stack_size = 50
        }
    }
)

-- entity
data:extend(
    {
        {
            type = "inserter",
            name = "burner-fishing-inserter",
            icon = "__FoodIndustry__/graphics/icons/entities/fishing-inserter.png",
            icon_size = 32,
            flags = {"placeable-neutral", "placeable-player", "player-creation"},
            minable = {hardness = 0.2, mining_time = 0.5, result = "burner-fishing-inserter"},
            max_health = 160,
            corpse = "small-remnants",
            filter_count = 0,
            allow_custom_vectors = true,
            resistances =
            {
                {
                    type = "fire",
                    percent = 90
                }
            },
            collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
            selection_box = {{-0.4, -0.35}, {0.4, 0.45}},
            pickup_position = {0, -2},
            insert_position = {0, 1.2},
            energy_per_movement = "5KJ",
            energy_per_rotation = "5KJ",
            rotation_speed = 0.02,
            extension_speed = 0.0457,
            hand_size = 1.5,
            energy_source =
            {
                type = "burner",
                fuel_category = "chemical",
                effectivity = 1,
                fuel_inventory_size = 1,
                smoke =
                {
                    {
                        name = "smoke",
                        deviation = {0.1, 0.1},
                        frequency = 9
                    }
                }
            },
            fast_replaceable_group = "long-handed-inserter",
            vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
            working_sound =
            {
                match_progress_to_activity = true,
                sound =
                {
                    {
                        filename = "__base__/sound/inserter-long-handed-1.ogg",
                        volume = 0.75
                    },
                    {
                        filename = "__base__/sound/inserter-long-handed-2.ogg",
                        volume = 0.75
                    },
                    {
                        filename = "__base__/sound/inserter-long-handed-3.ogg",
                        volume = 0.75
                    },
                    {
                        filename = "__base__/sound/inserter-long-handed-4.ogg",
                        volume = 0.75
                    },
                    {
                        filename = "__base__/sound/inserter-long-handed-5.ogg",
                        volume = 0.75
                    }
                }
            },
            hand_base_picture =
            {
                filename = "__FoodIndustry__/graphics/entity/fishing-inserter/long-handed-inserter-hand-base.png",
                priority = "extra-high",
                width = 8,
                height = 34,
                hr_version =
                {
                    filename = "__FoodIndustry__/graphics/entity/fishing-inserter/hr-long-handed-inserter-hand-base.png",
                    priority = "extra-high",
                    width = 32,
                    height = 136,
                    scale = 0.25
                }
            },
            hand_closed_picture =
            {
                filename = "__FoodIndustry__/graphics/entity/fishing-inserter/long-handed-inserter-hand-closed.png",
                priority = "extra-high",
                width = 18,
                height = 41,
                hr_version =
                {
                    filename = "__FoodIndustry__/graphics/entity/fishing-inserter/hr-long-handed-inserter-hand-closed.png",
                    priority = "extra-high",
                    width = 72,
                    height = 164,
                    scale = 0.25
                }
            },
            hand_open_picture =
            {
                filename = "__FoodIndustry__/graphics/entity/fishing-inserter/long-handed-inserter-hand-open.png",
                priority = "extra-high",
                width = 18,
                height = 41,
                hr_version =
                {
                    filename = "__FoodIndustry__/graphics/entity/fishing-inserter/hr-long-handed-inserter-hand-open.png",
                    priority = "extra-high",
                    width = 72,
                    height = 164,
                    scale = 0.25
                }
            },
            hand_base_shadow =
            {
                filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-base-shadow.png",
                priority = "extra-high",
                width = 8,
                height = 33,
                hr_version =
                {
                    filename = "__base__/graphics/entity/burner-inserter/hr-burner-inserter-hand-base-shadow.png",
                    priority = "extra-high",
                    width = 32,
                    height = 132,
                    scale = 0.25
                }
            },
            hand_closed_shadow =
            {
                filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-closed-shadow.png",
                priority = "extra-high",
                width = 18,
                height = 41,
                hr_version =
                {
                    filename = "__base__/graphics/entity/burner-inserter/hr-burner-inserter-hand-closed-shadow.png",
                    priority = "extra-high",
                    width = 72,
                    height = 164,
                    scale = 0.25
                }
            },
            hand_open_shadow =
            {
                filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-open-shadow.png",
                priority = "extra-high",
                width = 18,
                height = 41,
                hr_version =
                {
                    filename = "__base__/graphics/entity/burner-inserter/hr-burner-inserter-hand-open-shadow.png",
                    priority = "extra-high",
                    width = 72,
                    height = 164,
                    scale = 0.25
                }
            },
            platform_picture =
            {
                sheet =
                {
                    filename = "__FoodIndustry__/graphics/entity/fishing-inserter/long-handed-inserter-platform.png",
                    priority = "extra-high",
                    width = 46,
                    height = 46,
                    shift = {0.09375, 0},
                    hr_version =
                    {
                        filename = "__FoodIndustry__/graphics/entity/fishing-inserter/hr-long-handed-inserter-platform.png",
                        priority = "extra-high",
                        width = 105,
                        height = 79,
                        shift = util.by_pixel(1.5, 7.5-1),
                        scale = 0.5
                    }
                }
            },
            circuit_wire_connection_points = circuit_connector_definitions["inserter"].points,
            circuit_connector_sprites = circuit_connector_definitions["inserter"].sprites,
            circuit_wire_max_distance = inserter_circuit_wire_max_distance,
            default_stack_control_input_signal = inserter_default_stack_control_input_signal
        },
    })

data:extend(
    {
        {
            type = "recipe",
            name = "burner-fishing-inserter",
            enabled = false,
            ingredients =
            {
                {"iron-gear-wheel", 1},
                {"burner-inserter", 1}
            },
            result = "burner-fishing-inserter"
        },
    })

-- item
data:extend(
    {
        {
            type = "item",
            name = "fishing-inserter",
            icon = "__FoodIndustry__/graphics/icons/entities/fishing-inserter.png",
            icon_size = 32,

            subgroup = "food-machines-fish",
            order = "w-a-i",
            place_result = "fishing-inserter",
            stack_size = 50
        }
    }
)

-- entity
data:extend(
    {
        {
            type = "inserter",
            name = "fishing-inserter",
            icon = "__FoodIndustry__/graphics/icons/entities/fishing-inserter.png",
            icon_size = 32,
            flags = {"placeable-neutral", "placeable-player", "player-creation"},
            minable = {hardness = 0.2, mining_time = 0.5, result = "fishing-inserter"},
            max_health = 160,
            corpse = "small-remnants",
            filter_count = 0,
            allow_custom_vectors = true,
            resistances =
            {
                {
                    type = "fire",
                    percent = 90
                }
            },
            collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
            selection_box = {{-0.4, -0.35}, {0.4, 0.45}},
            pickup_position = {0, -2},
            insert_position = {0, 1.2},
            energy_per_movement = "5KJ",
            energy_per_rotation = "5KJ",
            rotation_speed = 0.02,
            extension_speed = 0.0457,
            hand_size = 1.5,
            energy_source =
            {
                type = "electric",
                usage_priority = "secondary-input",
                drain = "0.4kW"
            },
            fast_replaceable_group = "long-handed-inserter",
            vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
            working_sound =
            {
                match_progress_to_activity = true,
                sound =
                {
                    {
                        filename = "__base__/sound/inserter-long-handed-1.ogg",
                        volume = 0.75
                    },
                    {
                        filename = "__base__/sound/inserter-long-handed-2.ogg",
                        volume = 0.75
                    },
                    {
                        filename = "__base__/sound/inserter-long-handed-3.ogg",
                        volume = 0.75
                    },
                    {
                        filename = "__base__/sound/inserter-long-handed-4.ogg",
                        volume = 0.75
                    },
                    {
                        filename = "__base__/sound/inserter-long-handed-5.ogg",
                        volume = 0.75
                    }
                }
            },
            hand_base_picture =
            {
                filename = "__FoodIndustry__/graphics/entity/fishing-inserter/long-handed-inserter-hand-base.png",
                priority = "extra-high",
                width = 8,
                height = 34,
                hr_version =
                {
                    filename = "__FoodIndustry__/graphics/entity/fishing-inserter/hr-long-handed-inserter-hand-base.png",
                    priority = "extra-high",
                    width = 32,
                    height = 136,
                    scale = 0.25
                }
            },
            hand_closed_picture =
            {
                filename = "__FoodIndustry__/graphics/entity/fishing-inserter/long-handed-inserter-hand-closed.png",
                priority = "extra-high",
                width = 18,
                height = 41,
                hr_version =
                {
                    filename = "__FoodIndustry__/graphics/entity/fishing-inserter/hr-long-handed-inserter-hand-closed.png",
                    priority = "extra-high",
                    width = 72,
                    height = 164,
                    scale = 0.25
                }
            },
            hand_open_picture =
            {
                filename = "__FoodIndustry__/graphics/entity/fishing-inserter/long-handed-inserter-hand-open.png",
                priority = "extra-high",
                width = 18,
                height = 41,
                hr_version =
                {
                    filename = "__FoodIndustry__/graphics/entity/fishing-inserter/hr-long-handed-inserter-hand-open.png",
                    priority = "extra-high",
                    width = 72,
                    height = 164,
                    scale = 0.25
                }
            },
            hand_base_shadow =
            {
                filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-base-shadow.png",
                priority = "extra-high",
                width = 8,
                height = 33,
                hr_version =
                {
                    filename = "__base__/graphics/entity/burner-inserter/hr-burner-inserter-hand-base-shadow.png",
                    priority = "extra-high",
                    width = 32,
                    height = 132,
                    scale = 0.25
                }
            },
            hand_closed_shadow =
            {
                filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-closed-shadow.png",
                priority = "extra-high",
                width = 18,
                height = 41,
                hr_version =
                {
                    filename = "__base__/graphics/entity/burner-inserter/hr-burner-inserter-hand-closed-shadow.png",
                    priority = "extra-high",
                    width = 72,
                    height = 164,
                    scale = 0.25
                }
            },
            hand_open_shadow =
            {
                filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-open-shadow.png",
                priority = "extra-high",
                width = 18,
                height = 41,
                hr_version =
                {
                    filename = "__base__/graphics/entity/burner-inserter/hr-burner-inserter-hand-open-shadow.png",
                    priority = "extra-high",
                    width = 72,
                    height = 164,
                    scale = 0.25
                }
            },
            platform_picture =
            {
                sheet =
                {
                    filename = "__FoodIndustry__/graphics/entity/fishing-inserter/long-handed-inserter-platform.png",
                    priority = "extra-high",
                    width = 46,
                    height = 46,
                    shift = {0.09375, 0},
                    hr_version =
                    {
                        filename = "__FoodIndustry__/graphics/entity/fishing-inserter/hr-long-handed-inserter-platform.png",
                        priority = "extra-high",
                        width = 105,
                        height = 79,
                        shift = util.by_pixel(1.5, 7.5-1),
                        scale = 0.5
                    }
                }
            },
            circuit_wire_connection_points = circuit_connector_definitions["inserter"].points,
            circuit_connector_sprites = circuit_connector_definitions["inserter"].sprites,
            circuit_wire_max_distance = inserter_circuit_wire_max_distance,
            default_stack_control_input_signal = inserter_default_stack_control_input_signal
        },
    })

data:extend(
    {
        {
            type = "recipe",
            name = "fishing-inserter",
            enabled = false,
            ingredients =
            {
                {"burner-fishing-inserter", 1},
                {"iron-plate", 1},
                {"electronic-circuit", 2}
            },
            result = "fishing-inserter"
        },
    })