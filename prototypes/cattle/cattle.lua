local utils = require("__FoodIndustry__/libs/util")
require "util"

require ("prototypes.cattle.cattle-autoplace")
require ("prototypes.cattle.cattle-spawner-animation")

local cattlescale = 0.5
local calfscale = 0.25
local sounds = require("__base__.prototypes.entity.sounds")

-- spawner
-- feeder
-- butcher
-- cattle
-- cattle-calf
-- cattle-meat
data:extend({
    {
        type = "item",
        name = "cattle",
        icon = "__base__/graphics/icons/small-biter.png",
        icon_size = 64,
        icon_mipmaps = 4,
        subgroup = "food-cattle",
        order = "d",
        stack_size = 10
    },
    {
        type = "unit",
        name = "cattle",
        icon = "__base__/graphics/icons/small-biter.png",
        icon_size = 64,
        icon_mipmaps = 4,
        flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "not-repairable", "breaths-air"},
        max_health = 15,
        order = "b-b-a",
        subgroup="enemies",
        healing_per_tick = 0.01,
        collision_box = {{-0.2, -0.2}, {0.2, 0.2}},
        selection_box = {{-0.4, -0.7}, {0.7, 0.4}},
        attack_parameters =
        {
            type = "projectile",
            range = 0,
            cooldown = 35,
            ammo_category = "melee",
            ammo_type = make_unit_melee_ammo_type(0),
            sound = sounds.biter_roars(0.4),
            animation = biterattackanimation(cattlescale, small_biter_tint1, small_biter_tint2)
        },
        vision_distance = 30,
        movement_speed = 0.2,
        distance_per_frame = 0.1,
        pollution_to_join_attack = 0,
        distraction_cooldown = 300,
        min_pursue_time = 10 * 60,
        max_pursue_distance = 50,
        corpse = "small-biter-corpse",
        dying_explosion = "blood-explosion-small",
        dying_sound = sounds.biter_dying(0.43),
        working_sound = sounds.biter_calls(0.87),
        run_animation = biterrunanimation(cattlescale, small_biter_tint1, small_biter_tint2)
    },
    {
        type = "unit",
        name = "cattle-calf",
        icon = "__base__/graphics/icons/small-biter.png",
        icon_size = 64,
        icon_mipmaps = 4,
        flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "not-repairable", "breaths-air"},
        max_health = 5,
        order = "b-b-a",
        subgroup="enemies",
        healing_per_tick = 0.01,
        collision_box = {{-0.2, -0.2}, {0.2, 0.2}},
        selection_box = {{-0.4, -0.7}, {0.7, 0.4}},
        attack_parameters =
        {
            type = "projectile",
            range = 0,
            cooldown = 35,
            ammo_category = "melee",
            ammo_type = make_unit_melee_ammo_type(0),
            sound = sounds.biter_roars(0.4),
            animation = biterattackanimation(calfscale, small_biter_tint1, small_biter_tint2)
        },
        vision_distance = 30,
        movement_speed = 0.2,
        distance_per_frame = 0.1,
        pollution_to_join_attack = 0,
        distraction_cooldown = 300,
        min_pursue_time = 10 * 60,
        max_pursue_distance = 50,
        corpse = "small-biter-corpse",
        dying_explosion = "blood-explosion-small",
        dying_sound = sounds.biter_dying(0.43),
        working_sound = sounds.biter_calls(0.87),
        run_animation = biterrunanimation(calfscale, small_biter_tint1, small_biter_tint2)
    },
    {
        type = "recipe",
        name = "cattle-meat",
        enabled = false,
        icon = "__FoodIndustry__/graphics/icons/items/biter-meat.png",
        icon_size = 64,
        icon_mipmaps = 4,
        subgroup = "food-machines-cattle",
        category = "food-cattle",
        order = "w-d-b",
        main_product = "biter-meat",
        energy_required = 30,
        ingredients =
        {
            {"cattle", 1}
        },
        results = {
            {"biter-meat", 5},
            {"bone", 2},
            {type = "item", name = "raw-mince", amount = 1, probability = 0.4},
        },
        order = "d",
    },

    {
        type = "item",
        name = "fi-cattle-feed",
        icon = "__FoodIndustry__/graphics/icons/items/straw.png",
        icon_size = 64,
        subgroup = "creatures",
        order = "b-a",
        collision_box = {{-0.75, -0.75}, {0.75, 0.75}},
        selection_box = {{-0.5, -0.3}, {0.5, 0.3}},
        stack_size = 100
    },
})

-- cattle spawner
spitter_spawner_tint = {r=0.99, g=0.09, b=0.09, a=1}

-- cattle spawner
data:extend({
    {
        type = "item",
        name = "cattle-spawner",
        icon = "__base__/graphics/icons/biter-spawner.png",
        icon_size = 64,
        icon_mipmaps = 4,
        subgroup = "food-machines-cattle",
        order = "a",
        place_result = "cattle-spawner",
        stack_size = 50
    },
    {
        type = "unit-spawner",
        name = "cattle-spawner",
        icon = "__base__/graphics/icons/biter-spawner.png",
        icon_size = 64,
        icon_mipmaps = 4,
        flags = {"placeable-player", "placeable-enemy", "not-repairable"},
        minable = {hardness = 0.2, mining_time = 2.0, result = "cattle-spawner"},
        max_health = 50,
        order="b-b-h",
        subgroup="food-machines-cattle",
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
        collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
        selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
        pollution_absorption_absolute = 0,
        pollution_absorption_proportional = 0.01,
        corpse = "spitter-spawner-corpse",
        dying_explosion = "blood-explosion-huge",
        max_count_of_owned_units = 7,
        max_friends_around_to_spawn = 5,
        animations =
        {
            spawner_idle_animation(0, spitter_spawner_tint, 3/5 ),
            spawner_idle_animation(1, spitter_spawner_tint, 3/5 ),
            spawner_idle_animation(2, spitter_spawner_tint, 3/5 ),
            spawner_idle_animation(3, spitter_spawner_tint, 3/5 )
        },
        result_units = (function()
            local res = {}
            res[1] = {"cattle-calf", {{0.0, 0.3}, {0.35, 0}}}
            res[2] = {"cattle-calf", {{0.25, 0.0}, {0.5, 0.3}, {0.7, 0.0}}}
            res[3] = {"cattle-calf", {{0.4, 0.0}, {0.7, 0.3}, {0.9, 0.1}}}
            res[4] = {"cattle-calf", {{0.5, 0.0}, {1.0, 0.4}}}
            res[5] = {"cattle-calf", {{0.9, 0.0}, {1.0, 0.3}}}
            return res
        end)(),
        -- With zero evolution the spawn rate is 12 seconds, with max evolution it is 6 seconds
        spawning_cooldown = {60*60*3, 6*60*60*3},
        spawning_radius = 10,
        spawning_spacing = 3,
        max_spawn_shift = 0,
        max_richness_for_spawn_shift = 100,
        --autoplace = enemy_spawner_autoplace(1),
        call_for_help_radius = 50
    },
    {
        type = "recipe",
        name = "cattle-spawner",
        enabled = false,
        energy_required = 300,
        ingredients =
        {
            {"iron-plate", 100},
            {"wood", 100},
            {"raw-fish", 100},
            {"electronic-circuit", 20}
        },
        result = "cattle-spawner"
    },
    })

-- cattle-feeder
data:extend({
    {
        type = "furnace",
        name = "cattle-feeder",
        icon = "__FoodIndustry__/graphics/icons/entities/cattle-feeder.png",
        icon_size = 32,
        crafting_categories = {"cattle-feeding"},
        crafting_speed = 1,
        flags = {"placeable-neutral", "player-creation"},
        minable = {mining_time = 1, result = "cattle-feeder"},
        max_health = 400,
        corpse = "small-remnants",
        collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
        selection_box = {{-1.0, -1.0}, {1.0, 1.0}},
        inventory_size = 16,
        open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume=0.65 },
        close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.7 },
        vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
        animation =
        {
          layers =
          {
                {
                    filename = "__FoodIndustry__/graphics/entity/cattle/cattle-feeder.png",
                    frame_count = 1,
                    priority = "extra-high",
                    width = 38,
                    height = 32,
                    shift = {0.1875, 0 },
                    scale=2
                }
           }
        },
        height=2,
        width=2,
        circuit_wire_connection_point = circuit_connector_definitions["chest"].points,
        circuit_connector_sprites = circuit_connector_definitions["chest"].sprites,
        circuit_wire_max_distance = default_circuit_wire_max_distance,
        source_inventory_size = 1,
        result_inventory_size = 1,
        energy_source =
        {
          type = "void",
        },
        energy_usage = "20kW",
    },

    {
        type = "item",
        name = "cattle-feeder",
        icon = "__FoodIndustry__/graphics/icons/entities/cattle-feeder.png",
        icon_size = 32,

        subgroup = "food-machines-cattle",
        order = "b",
        place_result = "cattle-feeder",
        stack_size = 50
    },

    {
        type = "recipe",
        name = "cattle-feeder",
        enabled = false,
        ingredients =
        {
            {"iron-plate", 10},
            {"electronic-circuit", 5}
        },
        result = "cattle-feeder"
    },
})

-- cattle butcher
data:extend({
{
    type = "recipe",
    name = "cattle-butcher",
    energy_required = 10,
    enabled = false,
    ingredients = {
        {"iron-plate", 9},
        {"iron-gear-wheel", 5},
        {"electronic-circuit", 3}
    },
    results = {
        {"cattle-butcher", 1}
    }
},

{
    type = "item",
    name = "cattle-butcher",
    icon = "__FoodIndustry__/graphics/icons/entities/cattle-butcher.png",
    icon_size = 64,
    icon_mipmaps = 4,
    subgroup = "food-machines-cattle",
    order = "d",
    place_result = "cattle-butcher",
    stack_size = 10
},

{
    type = "assembling-machine",
    name = "cattle-butcher",
    icon = "__FoodIndustry__/graphics/icons/entities/cattle-butcher.png",
    icon_size = 64,
    icon_mipmaps = 4,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "cattle-butcher"},
    fast_replaceable_group = "cattle-butcher",
    max_health = 100,
    corpse = "medium-remnants",
    dying_explosion = "big-explosion",
--    collision_box = {{-2.4, -2.4}, {2.4, 2.4}},
--    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    module_specification = {
        module_slots = 4
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    crafting_categories = {"food-cattle"},
    crafting_speed = 1,
    energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        -- emissions = 0.01,
        emissions_per_minute = 1 / 100 * 30,
    },
    energy_usage = "150kW",
    ingredient_count = 20,
    animation = {
        layers = {
            {
                filename = "__FoodIndustry__/graphics/entity/cattle-butcher/cattle-butcher.png",
                --priority = "high",
                width = 160,
                height = 248,
                line_length = 12,
                frame_count = 61,
                animation_speed = 0.4,
                shift = util.by_pixel(0, -20),
                scale = 3 /5
            },
            {
                filename = "__FoodIndustry__/graphics/entity/cattle-butcher/shadow.png",
                --priority = "high",
                width = 173,
                height = 168,
                line_length = 11,
                frame_count = 61,
                animation_speed = 0.4,
                draw_as_shadow = true,
                shift = util.by_pixel(12, 8),
                scale = 3 /5
            }
        }
    },
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
    working_sound = {
        sound = {filename = "__FoodIndustry__/sounds/cattle-butcher.ogg", volume = 0.8},
        idle_sound = {filename = "__FoodIndustry__/sounds/cattle-butcher.ogg", volume = 0.6},
        apparent_volume = 2.5
    }
}
    })


    local ingredients = {
        --1						2				3				4
        --plant					ingredients,	energy/water,	result	?
        {"raw-straw",			1,				6.0,			10},		--basic
        {"straw",				1,			    0.6,			1},			--0
        {"compressed-straw",	1,				60.0,			100},			--0
        --{"lettuce",				0,				3.0,			6},		--5.4
        --{"cucumber",			0,				4.5,			6},		--5.1
        --{"tomato",				0,				2.0,			4},		--3.6
        --{"potato",				0,				5.0,			8},		--7.0
        --{"corn",				0,				4.0,			8},		--7.2
        --{"soy",					0,				0.5,			1},		--0.9
        --{"rapeseed",			0,				0.4,			0.4}	--0.32
    }
    
    local function createFeedRecipes(name, feed, tech)
        for index, ingredient in pairs(ingredients) do
            data:extend({
                {
                    type = "recipe",
                    name = name.."-"..ingredient[1],
                    localised_name = {"description."..name, {"item-name." .. ingredient[1]}},
                    enabled = false,
                    icon = "__FoodIndustry__/graphics/icons/items/straw.png",
                    icon_size = 64,
                    icons = utils.mergeIcons("__base__/graphics/icons/small-biter.png", 64, "__FoodIndustry__/graphics/icons/items/"..ingredient[1]..".png", 64),
                    category = name,
                    subgroup = name,
                    energy_required = ingredient[3],
                    ingredients = {
                        { ingredient[1], ingredient[2] }
                    },
                    results = 
                        {
                            {type = "item", name = feed, amount=ingredient[4] },
                        }
                },
                table.insert(data.raw.technology[tech].effects,
                {recipe = name.."-"..ingredient[1], type = "unlock-recipe"}
            )
            })
            
        end
    end
    
    createFeedRecipes("cattle-feeding", "fi-cattle-feed", "cattle")
