data:extend({
    {
        type = "recipe",
        name = "cattle-wood-fence",
        category = "crafting",
        enabled = false,
        ingredients = {
            {type = "item", name = "wood", amount = 5}
        },
        results = {
            {"cattle-wood-fence", 1}
        }
    },
    {
        type = "item",
        name = "cattle-wood-fence",
        icon = "__FoodIndustry__/graphics/icons/entities/cattle-wood-fence.png",
        icon_size = 32,

        subgroup = "food-machines-cattle",
        order = "e",
        place_result = "cattle-wood-fence",
        stack_size = 200
    },

    {
        type = "wall",
        name = "cattle-wood-fence",
        icon = "__base__/graphics/icons/wall.png",
        icon_size = 32,
        flags = {"placeable-neutral", "player-creation"},
        collision_box = {{-0.29, -0.29}, {0.29, 0.29}},
        selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
        minable = {mining_time = 0.2, result = "cattle-wood-fence"},
        fast_replaceable_group = "wall",
        max_health = 100,
        repair_speed_modifier = 2,
        corpse = "wall-remnants",
        repair_sound = { filename = "__base__/sound/manual-repair-simple.ogg" },
        mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
        vehicle_impact_sound =  { filename = "__base__/sound/car-stone-impact.ogg", volume = 1.0 },
        -- this kind of code can be used for having walls mirror the effect
        -- there can be multiple reaction items
        --attack_reaction =
        --{
        --{
        ---- how far the mirroring works
        --range = 2,
        ---- what kind of damage triggers the mirroring
        ---- if not present then anything triggers the mirroring
        --damage_type = "physical",
        ---- caused damage will be multiplied by this and added to the subsequent damages
        --reaction_modifier = 0.1,
        --action =
        --{
        --type = "direct",
        --action_delivery =
        --{
        --type = "instant",
        --target_effects =
        --{
        --type = "damage",
        ---- always use at least 0.1 damage
        --damage = {amount = 0.1, type = "physical"}
        --}
        --}
        --},
        --}
        --},
        connected_gate_visualization =
        {
            filename = "__core__/graphics/arrows/underground-lines.png",
            priority = "high",
            width = 64,
            height = 64,
            scale = 0.5
        },
        resistances =
        {
            {
                type = "physical",
                decrease = 3,
                percent = 20
            },
            {
                type = "impact",
                decrease = 45,
                percent = 60
            },
            {
                type = "explosion",
                decrease = 10,
                percent = 30
            },
            {
                type = "fire",
                percent = 100
            },
            {
                type = "acid",
                percent = 80
            },
            {
                type = "laser",
                percent = 70
            }
        },
        pictures = {
            single = {
                {
                    filename = "__FoodIndustry__/graphics/entity/cattle-wood-fence/single.png",
                    priority = "extra-high",
                    width = 32,
                    height = 40,
                    shift = {0, -0.2}
                }
            },
            straight_vertical = {
                {
                    filename = "__FoodIndustry__/graphics/entity/cattle-wood-fence/vertical.png",
                    priority = "extra-high",
                    width = 32,
                    height = 45,
                    shift = {0, -0.2}
                }
            },
            straight_horizontal = {
                {
                    filename = "__FoodIndustry__/graphics/entity/cattle-wood-fence/horizontal-2.png",
                    priority = "extra-high",
                    width = 32,
                    height = 40,
                    shift = {0, -0.2}
                },
                {
                    filename = "__FoodIndustry__/graphics/entity/cattle-wood-fence/horizontal-1.png",
                    priority = "extra-high",
                    width = 32,
                    height = 40,
                    shift = {0, -0.2}
                }
            },
            corner_right_down = {
                {
                    filename = "__FoodIndustry__/graphics/entity/cattle-wood-fence/corner-right.png",
                    priority = "extra-high",
                    width = 32,
                    height = 40,
                    shift = {0, -0.2}
                }
            },
            corner_left_down = {
                {
                    filename = "__FoodIndustry__/graphics/entity/cattle-wood-fence/corner-left.png",
                    priority = "extra-high",
                    width = 32,
                    height = 40,
                    shift = {0, -0.19}
                }
            },
            t_up = {
                {
                    filename = "__FoodIndustry__/graphics/entity/cattle-wood-fence/t-down.png",
                    priority = "extra-high",
                    width = 32,
                    height = 45,
                    shift = {0, -0.2}
                }
            },
            ending_right = {
                {
                    filename = "__FoodIndustry__/graphics/entity/cattle-wood-fence/end-left.png",
                    priority = "extra-high",
                    width = 32,
                    height = 40,
                    shift = {0, -0.2}
                }
            },
            ending_left = {
                {
                    filename = "__FoodIndustry__/graphics/entity/cattle-wood-fence/end-right.png",
                    priority = "extra-high",
                    width = 32,
                    height = 38,
                    shift = {0, -0.2}
                }
            }
        },

        wall_diode_green = util.conditional_return(not data.is_demo,
            {
                sheet =
                {
                    filename = "__base__/graphics/entity/wall/wall-diode-green.png",
                    priority = "extra-high",
                    width = 38,
                    height = 24,
                    --frames = 4, -- this is optional, it will default to 4 for Sprite4Way
                    shift = util.by_pixel(-2, -24),
                    hr_version =
                    {
                        filename = "__base__/graphics/entity/wall/hr-wall-diode-green.png",
                        priority = "extra-high",
                        width = 72,
                        height = 44,
                        --frames = 4,
                        shift = util.by_pixel(-1, -23),
                        scale = 0.5
                    }
                }
            }),
        wall_diode_green_light_top = util.conditional_return(not data.is_demo,
            {
                minimum_darkness = 0.3,
                color = {g=1},
                shift = util.by_pixel(0, -30),
                size = 1,
                intensity = 0.3
            }),
        wall_diode_green_light_right = util.conditional_return(not data.is_demo,
            {
                minimum_darkness = 0.3,
                color = {g=1},
                shift = util.by_pixel(12, -23),
                size = 1,
                intensity = 0.3
            }),
        wall_diode_green_light_bottom = util.conditional_return(not data.is_demo,
            {
                minimum_darkness = 0.3,
                color = {g=1},
                shift = util.by_pixel(0, -17),
                size = 1,
                intensity = 0.3
            }),
        wall_diode_green_light_left = util.conditional_return(not data.is_demo,
            {
                minimum_darkness = 0.3,
                color = {g=1},
                shift = util.by_pixel(-12, -23),
                size = 1,
                intensity = 0.3
            }),

        wall_diode_red = util.conditional_return(not data.is_demo,
            {
                sheet =
                {
                    filename = "__base__/graphics/entity/wall/wall-diode-red.png",
                    priority = "extra-high",
                    width = 38,
                    height = 24,
                    --frames = 4, -- this is optional, it will default to 4 for Sprite4Way
                    shift = util.by_pixel(-2, -24),
                    hr_version =
                    {
                        filename = "__base__/graphics/entity/wall/hr-wall-diode-red.png",
                        priority = "extra-high",
                        width = 72,
                        height = 44,
                        --frames = 4,
                        shift = util.by_pixel(-1, -23),
                        scale = 0.5
                    }
                }
            }),
        wall_diode_red_light_top = util.conditional_return(not data.is_demo,
            {
                minimum_darkness = 0.3,
                color = {r=1},
                shift = util.by_pixel(0, -30),
                size = 1,
                intensity = 0.3
            }),
        wall_diode_red_light_right = util.conditional_return(not data.is_demo,
            {
                minimum_darkness = 0.3,
                color = {r=1},
                shift = util.by_pixel(12, -23),
                size = 1,
                intensity = 0.3
            }),
        wall_diode_red_light_bottom = util.conditional_return(not data.is_demo,
            {
                minimum_darkness = 0.3,
                color = {r=1},
                shift = util.by_pixel(0, -17),
                size = 1,
                intensity = 0.3
            }),
        wall_diode_red_light_left = util.conditional_return(not data.is_demo,
            {
                minimum_darkness = 0.3,
                color = {r=1},
                shift = util.by_pixel(-12, -23),
                size = 1,
                intensity = 0.3
            }),

        circuit_wire_connection_point = circuit_connector_definitions["gate"].points,
        circuit_connector_sprites = circuit_connector_definitions["gate"].sprites,
        circuit_wire_max_distance = default_circuit_wire_max_distance,
        default_output_signal = data.is_demo and {type = "virtual", name = "signal-green"} or {type = "virtual", name = "signal-G"}
    },


    {
        type = "recipe",
        name = "cattle-wood-gate",
        category = "crafting",
        enabled = false,
        ingredients = {
            {"cattle-wood-fence", 1},
            {type = "item", name = "iron-plate", amount = 2},
            {"electronic-circuit", 2}
        },
        results = {
            {"cattle-wood-gate", 1}
        }
    },
    {
        type = "item",
        name = "cattle-wood-gate",
        icon = "__FoodIndustry__/graphics/icons/entities/cattle-wood-fence.png",
        icon_size = 32,

        subgroup = "food-machines-cattle",
        order = "e",
        place_result = "cattle-wood-gate",
        stack_size = 500
    },

    {
        type = "gate",
        name = "cattle-wood-gate",
        icon = "__base__/graphics/icons/gate.png",
        icon_size = 32,
        flags = {"placeable-neutral","placeable-player", "player-creation"},
        fast_replaceable_group = "wall",
        minable = {mining_time = 0.1, result = "cattle-wood-gate"},
        max_health = 50,
        corpse = "small-remnants",
        collision_box = {{-0.29, -0.29}, {0.29, 0.29}},
        selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
        opening_speed = 0.0666666,
        activation_distance = 3,
        timeout_to_close = 5,
        fadeout_interval = 15,
        resistances =
        {
            {
                type = "physical",
                decrease = 3,
                percent = 20
            },
            {
                type = "impact",
                decrease = 45,
                percent = 60
            },
            {
                type = "explosion",
                decrease = 10,
                percent = 30
            },
            {
                type = "fire",
                percent = 100
            },
            {
                type = "laser",
                percent = 70
            }
        },
        vertical_animation =
        {
            layers =
            {
                {
                    filename = "__base__/graphics/entity/gate/gate-vertical.png",
                    line_length = 8,
                    width = 38,
                    height = 62,
                    frame_count = 16,
                    shift = util.by_pixel(0, -14),
                    hr_version =
                    {
                        filename = "__base__/graphics/entity/gate/hr-gate-vertical.png",
                        line_length = 8,
                        width = 78,
                        height = 120,
                        frame_count = 16,
                        shift = util.by_pixel(-1, -13),
                        scale = 0.5
                    }
                },
                {
                    filename = "__base__/graphics/entity/gate/gate-vertical-shadow.png",
                    line_length = 8,
                    width = 40,
                    height = 54,
                    frame_count = 16,
                    shift = util.by_pixel(10, 8),
                    draw_as_shadow = true,
                    hr_version =
                    {
                        filename = "__base__/graphics/entity/gate/hr-gate-vertical-shadow.png",
                        line_length = 8,
                        width = 82,
                        height = 104,
                        frame_count = 16,
                        shift = util.by_pixel(9, 9),
                        draw_as_shadow = true,
                        scale = 0.5
                    }
                }
            }
        },
        horizontal_animation =
        {
            layers =
            {
                {
                    filename = "__base__/graphics/entity/gate/gate-horizontal.png",
                    line_length = 8,
                    width = 34,
                    height = 48,
                    frame_count = 16,
                    shift = util.by_pixel(0, -4),
                    hr_version =
                    {
                        filename = "__base__/graphics/entity/gate/hr-gate-horizontal.png",
                        line_length = 8,
                        width = 66,
                        height = 90,
                        frame_count = 16,
                        shift = util.by_pixel(0, -3),
                        scale = 0.5
                    }
                },
                {
                    filename = "__base__/graphics/entity/gate/gate-horizontal-shadow.png",
                    line_length = 8,
                    width = 62,
                    height = 30,
                    frame_count = 16,
                    shift = util.by_pixel(12, 10),
                    draw_as_shadow = true,
                    hr_version =
                    {
                        filename = "__base__/graphics/entity/gate/hr-gate-horizontal-shadow.png",
                        line_length = 8,
                        width = 122,
                        height = 60,
                        frame_count = 16,
                        shift = util.by_pixel(12, 10),
                        draw_as_shadow = true,
                        scale = 0.5
                    }
                }
            }
        },
        horizontal_rail_animation_left =
        {
            layers =
            {
                {
                    filename = "__base__/graphics/entity/gate/gate-rail-horizontal-left.png",
                    line_length = 8,
                    width = 34,
                    height = 40,
                    frame_count = 16,
                    shift = util.by_pixel(0, -8),
                    hr_version =
                    {
                        filename = "__base__/graphics/entity/gate/hr-gate-rail-horizontal-left.png",
                        line_length = 8,
                        width = 66,
                        height = 74,
                        frame_count = 16,
                        shift = util.by_pixel(0, -7),
                        scale = 0.5
                    }
                },
                {
                    filename = "__base__/graphics/entity/gate/gate-rail-horizontal-shadow-left.png",
                    line_length = 8,
                    width = 62,
                    height = 30,
                    frame_count = 16,
                    shift = util.by_pixel(12, 10),
                    draw_as_shadow = true,
                    hr_version =
                    {
                        filename = "__base__/graphics/entity/gate/hr-gate-rail-horizontal-shadow-left.png",
                        line_length = 8,
                        width = 122,
                        height = 60,
                        frame_count = 16,
                        shift = util.by_pixel(12, 10),
                        draw_as_shadow = true,
                        scale = 0.5
                    }
                }
            }
        },
        horizontal_rail_animation_right =
        {
            layers =
            {
                {
                    filename = "__base__/graphics/entity/gate/gate-rail-horizontal-right.png",
                    line_length = 8,
                    width = 34,
                    height = 40,
                    frame_count = 16,
                    shift = util.by_pixel(0, -8),
                    hr_version =
                    {
                        filename = "__base__/graphics/entity/gate/hr-gate-rail-horizontal-right.png",
                        line_length = 8,
                        width = 66,
                        height = 74,
                        frame_count = 16,
                        shift = util.by_pixel(0, -7),
                        scale = 0.5
                    }
                },
                {
                    filename = "__base__/graphics/entity/gate/gate-rail-horizontal-shadow-right.png",
                    line_length = 8,
                    width = 62,
                    height = 30,
                    frame_count = 16,
                    shift = util.by_pixel(12, 10),
                    draw_as_shadow = true,
                    hr_version =
                    {
                        filename = "__base__/graphics/entity/gate/hr-gate-rail-horizontal-shadow-right.png",
                        line_length = 8,
                        width = 122,
                        height = 58,
                        frame_count = 16,
                        shift = util.by_pixel(12, 11),
                        draw_as_shadow = true,
                        scale = 0.5
                    }
                }
            }
        },
        vertical_rail_animation_left =
        {
            layers =
            {
                {
                    filename = "__base__/graphics/entity/gate/gate-rail-vertical-left.png",
                    line_length = 8,
                    width = 22,
                    height = 62,
                    frame_count = 16,
                    shift = util.by_pixel(0, -14),
                    hr_version =
                    {
                        filename = "__base__/graphics/entity/gate/hr-gate-rail-vertical-left.png",
                        line_length = 8,
                        width = 42,
                        height = 118,
                        frame_count = 16,
                        shift = util.by_pixel(0, -13),
                        scale = 0.5
                    }
                },
                {
                    filename = "__base__/graphics/entity/gate/gate-rail-vertical-shadow-left.png",
                    line_length = 8,
                    width = 44,
                    height = 54,
                    frame_count = 16,
                    shift = util.by_pixel(8, 8),
                    draw_as_shadow = true,
                    hr_version =
                    {
                        filename = "__base__/graphics/entity/gate/hr-gate-rail-vertical-shadow-left.png",
                        line_length = 8,
                        width = 82,
                        height = 104,
                        frame_count = 16,
                        shift = util.by_pixel(9, 9),
                        draw_as_shadow = true,
                        scale = 0.5
                    }
                }
            }
        },
        vertical_rail_animation_right =
        {
            layers =
            {
                {
                    filename = "__base__/graphics/entity/gate/gate-rail-vertical-right.png",
                    line_length = 8,
                    width = 22,
                    height = 62,
                    frame_count = 16,
                    shift = util.by_pixel(0, -14),
                    hr_version =
                    {
                        filename = "__base__/graphics/entity/gate/hr-gate-rail-vertical-right.png",
                        line_length = 8,
                        width = 42,
                        height = 118,
                        frame_count = 16,
                        shift = util.by_pixel(0, -13),
                        scale = 0.5
                    }
                },
                {
                    filename = "__base__/graphics/entity/gate/gate-rail-vertical-shadow-right.png",
                    line_length = 8,
                    width = 44,
                    height = 54,
                    frame_count = 16,
                    shift = util.by_pixel(8, 8),
                    draw_as_shadow = true,
                    hr_version =
                    {
                        filename = "__base__/graphics/entity/gate/hr-gate-rail-vertical-shadow-right.png",
                        line_length = 8,
                        width = 82,
                        height = 104,
                        frame_count = 16,
                        shift = util.by_pixel(9, 9),
                        draw_as_shadow = true,
                        scale = 0.5
                    }
                }
            }
        },
        vertical_rail_base =
        {
            filename = "__base__/graphics/entity/gate/gate-rail-base-vertical.png",
            line_length = 8,
            width = 68,
            height = 66,
            frame_count = 16,
            shift = util.by_pixel(0, 0),
            hr_version =
            {
                filename = "__base__/graphics/entity/gate/hr-gate-rail-base-vertical.png",
                line_length = 8,
                width = 138,
                height = 130,
                frame_count = 16,
                shift = util.by_pixel(-1, 0),
                scale = 0.5
            }
        },
        horizontal_rail_base =
        {
            filename = "__base__/graphics/entity/gate/gate-rail-base-horizontal.png",
            line_length = 8,
            width = 66,
            height = 54,
            frame_count = 16,
            shift = util.by_pixel(0, 2),
            hr_version =
            {
                filename = "__base__/graphics/entity/gate/hr-gate-rail-base-horizontal.png",
                line_length = 8,
                width = 130,
                height = 104,
                frame_count = 16,
                shift = util.by_pixel(0, 3),
                scale = 0.5
            }
        },
        wall_patch =
        {
            layers =
            {
                {
                    filename = "__base__/graphics/entity/gate/gate-wall-patch.png",
                    line_length = 8,
                    width = 34,
                    height = 48,
                    frame_count = 16,
                    shift = util.by_pixel(0, 12),
                    hr_version =
                    {
                        filename = "__base__/graphics/entity/gate/hr-gate-wall-patch.png",
                        line_length = 8,
                        width = 70,
                        height = 94,
                        frame_count = 16,
                        shift = util.by_pixel(-1, 13),
                        scale = 0.5
                    }
                },
                {
                    filename = "__base__/graphics/entity/gate/gate-wall-patch-shadow.png",
                    line_length = 8,
                    width = 44,
                    height = 38,
                    frame_count = 16,
                    shift = util.by_pixel(8, 32),
                    draw_as_shadow = true,
                    hr_version =
                    {
                        filename = "__base__/graphics/entity/gate/hr-gate-wall-patch-shadow.png",
                        line_length = 8,
                        width = 82,
                        height = 72,
                        frame_count = 16,
                        shift = util.by_pixel(9, 33),
                        draw_as_shadow = true,
                        scale = 0.5
                    }
                }
            }
        },

        vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
        open_sound =
        {
            variations = { filename = "__base__/sound/gate-open-1.ogg", volume = 0.5 },
            aggregation =
            {
                max_count = 1,
                remove = true
            }
        },
        close_sound =
        {
            variations = { filename = "__base__/sound/gate-close-1.ogg", volume = 0.5 },
            aggregation =
            {
                max_count = 1,
                remove = true
            }
        }
    },

})
