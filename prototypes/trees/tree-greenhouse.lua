data:extend({

    {
        type = "recipe-category",
        name = "fi-tree-greenhouse"
    },

    ----Tree Greenhouse (Nursery)
    {
        type= "item",
        name= "fi-tree-greenhouse",
        icon = "__FoodIndustry__/graphics/icons/entities/tree_greenhouse.png",
        icon_size = 32,
        subgroup = "food-machines-trees",
        order = "w-a-c1",
        place_result = "fi-tree-greenhouse",
        stack_size= 50,
    },

    ------ Tree Greenhouse
    {
        type = "assembling-machine",
        name = "fi-tree-greenhouse",
        icon = "__FoodIndustry__/graphics/icons/entities/tree_greenhouse.png",
        icon_size = 32,
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        minable = {hardness = 0.2, mining_time = 0.25, result = "fi-tree-greenhouse"},
        collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
        selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
        max_health = 250,
        corpse = "medium-remnants",
        dying_explosion = "medium-explosion",
        crafting_categories = {"basic-tree-growth"},
        crafting_speed = 1,
        energy_source =
        {
            type = "electric",
            usage_priority = "primary-input",
            drain = "15kW",
            --emissions = -0.1,
            emissions_per_minute = -10 / 100 * 30, -- the "-" means it eats pollution. Absorbs about 10 PU per second
        },

        energy_usage = "50kW",
        ingredient_count = 3,
        resistances =
        {
            {
                type = "fire",
                percent = 70
            }
        },
        fluid_boxes =
        {
            {
                production_type = "input",
                pipe_picture = assembler3pipepictures(),
                pipe_covers = pipecoverspictures(),
                base_area = 10,
                base_level = -1,
                pipe_connections = {{ type="input", position = {0, -2} }}
            },
        },
        module_specification =
        {
            module_slots = 2
        },
        allowed_effects = {"consumption", "speed", "productivity", "pollution"},
        animation =
        {
            filename = "__FoodIndustry__/graphics/entity/tree_greenhouse/tree_greenhouse_off.png",
            width = 113,
            height = 93,
            frame_count = 1,
            scale = 1,
            shift = {0.3, 0}
        },
        working_visualisations =
        {
            {
                light = {intensity = 1, size = 6},
                animation =
                {
                    filename = "__FoodIndustry__/graphics/entity/tree_greenhouse/tree_greenhouse_on.png",
                    width = 113,
                    height = 93,
                    frame_count = 1,
                    scale = 1,
                    shift = {0.3, 0}
                }
            }
        },
        open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
        close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
        vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    },

    --- Tree Greenhouse  (ENTITY)
    {
        type = "recipe",
        name = "fi_recipe_tree_greenhouse",
        icon = "__FoodIndustry__/graphics/icons/entities/tree_greenhouse.png",
        icon_size = 32,
        normal =
        {
            enabled = false,
            energy_required = 5,
            ingredients =
            {
                {"iron-stick",10},
                {"stone",10},
                {"small-lamp",5},
            },
            result = "fi-tree-greenhouse",
            result_count = 1,
        },
        expensive =
        {
            enabled = false,
            energy_required = 8,
            ingredients =
            {
                {"iron-stick",15},
                {"stone",15},
                {"small-lamp",5},
            },
            result = "fi-tree-greenhouse",
            result_count = 1,
        },
        subgroup = "food-machines-trees",
        order = "w-a-c1",
    },
})


