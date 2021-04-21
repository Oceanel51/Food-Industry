-- entity/decor/tables

data:extend({
	{
		type = "simple-entity",
		name = "fi-table-logo",
		icon = "__FoodIndustry__/graphics/icons/decor/fi-table-logo-icon.png",
		icon_size = 64,
		flags = {"placeable-neutral", "player-creation"},
		render_layer = "object",
		minable = {mining_time = 1, result = "fi-table-logo", count = 1},
		max_health = 40,
		collision_box = {{-0.25, -0.30}, {0.25, 0.28}},
		selection_box = {{-0.44, -0.9}, {0.44, 0.3}},
		drawing_box = {{-0.5, -1.6}, {0.5, 0.5}},
		repair_sound = { filename = "__base__/sound/manual-repair-simple.ogg" },
		mined_sound = { filename = "__FoodIndustry__/sounds/deconstruct-wood.ogg" },
		vehicle_impact_sound = {filename = "__base__/sound/car-wood-impact.ogg", volume = 0.5},
		pictures = {
		layers = {
			{
				filename = "__FoodIndustry__/graphics/entity/decor/fi-table-logo.png",
				priority = "extra-high",
				width = 130,
				height = 168,
				scale = 0.1*2,
				shift = {0.0, -0.34},
				hr_version = {
					filename = "__FoodIndustry__/graphics/entity/decor/hr-fi-table-logo.png",
					priority = "extra-high",
					width = 259,
					height = 336,
					scale = 0.1,
					shift = {0.0, -0.34}
				}
			},
			{
				draw_as_shadow = true,
				filename = "__FoodIndustry__/graphics/entity/decor/fi-table-logo-shadow.png",
				priority = "extra-high",
				width = 323,
				height = 177,
				scale = 0.1*2,
				shift = {0.56, -0.3},
				hr_version = {
					draw_as_shadow = true,
					filename = "__FoodIndustry__/graphics/entity/decor/hr-fi-table-logo-shadow.png",
					priority = "extra-high",
					width = 644,
					height = 350,
					scale = 0.1,
					shift = {0.55, -0.3}
				}
			}
		  }
		},
		loot =
		{
		  {
			count_max = 20,
			count_min = 5,
			item = "wood",
			probability = 1
		  }
		},
        order = "c-a",
	},
	
	
	{
		type = "lamp",
		name = "fi-table-logo-lamp",
		icon = "__FoodIndustry__/graphics/icons/decor/fi-table-logo-lamp-icon.png",
		icon_size = 64,
		flags = {"placeable-neutral", "player-creation"},
		minable = {hardness = 0.2, mining_time = 0.5, result = "fi-table-logo-lamp"},
		max_health = 100,
		corpse = "small-remnants",
		collision_box = {{-0.25, -0.30}, {0.25, 0.28}},
		selection_box = {{-0.44, -0.8}, {0.44, 0.4}},
		repair_sound = { filename = "__base__/sound/manual-repair-simple.ogg" },
		mined_sound = { filename = "__FoodIndustry__/sounds/deconstruct-wood.ogg" },
		vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
		energy_source =
		{
		  type = "electric",
		  usage_priority = "lamp"
		},
		energy_usage_per_tick = "7KW",
		darkness_for_all_lamps_on = 0.5,
		darkness_for_all_lamps_off = 0.3,
		light = {intensity = 0.9, size = 30, color = {r=1.0, g=1.0, b=0.2}},
		light_when_colored = {intensity = 1, size = 6, color = {r=1.0, g=1.0, b=1.0}},
		glow_size = 6,
		glow_color_intensity = 0.135,
		picture_off = {
		layers = {
			{
			  filename = "__FoodIndustry__/graphics/entity/decor/fi-table-logo-lamp.png",
			  priority = "high",
			  width = 116,
			  height = 164,
			  frame_count = 1,
			  axially_symmetrical = false,
			  direction_count = 1,
			  shift = util.by_pixel(0,-7.4),
			  scale = 0.1*2,
			  hr_version = {
				filename = "__FoodIndustry__/graphics/entity/decor/hr-fi-table-logo-lamp.png",
				priority = "high",
				width = 230,
				height = 326,
				frame_count = 1,
				axially_symmetrical = false,
				direction_count = 1,
				shift = util.by_pixel(0,-7.4),
				scale = 0.1
			  }
			},
			{
			  draw_as_shadow = true,
			  filename = "__FoodIndustry__/graphics/entity/decor/fi-table-logo-lamp-shadow.png",
			  priority = "high",
			  width = 265,
			  height = 164,
			  frame_count = 1,
			  axially_symmetrical = false,
			  direction_count = 1,
			  shift = util.by_pixel(15.1,-7.0),
			  scale = 0.1*2,
			  hr_version = {
				draw_as_shadow = true,
				filename = "__FoodIndustry__/graphics/entity/decor/hr-fi-table-logo-lamp-shadow.png",
				priority = "high",
				width = 529,
				height = 328,
				frame_count = 1,
				axially_symmetrical = false,
				direction_count = 1,
				shift = util.by_pixel(16.1,-7.4),
				scale = 0.1
			  }
			}
		  }
		},
		picture_on =
		{
		layers = {
           {
              filename = "__FoodIndustry__/graphics/entity/decor/fi-table-logo-lamp-light.png",
              priority = "high",
              width = 81,
              height = 85,
              frame_count = 1,
              axially_symmetrical = false,
              direction_count = 1,
              shift = util.by_pixel(0.9, -17.1),
              scale = 0.45,
              tint = {r=1.0,g=1.0,b=0.2,a=0.6},
              hr_version = {
                filename = "__FoodIndustry__/graphics/entity/decor/hr-fi-table-logo-lamp-light.png",
                priority = "high",
                width = 161,
                height = 170,
                frame_count = 1,
                axially_symmetrical = false,
                direction_count = 1,
                shift = util.by_pixel(0.9, -17.1),
                scale = 0.45
              }
            },
			---------------------------
           --[[{
              filename = "__base__/graphics/entity/small-lamp/lamp-light.png",
              priority = "high",
              width = 46,
              height = 40,
              frame_count = 1,
              axially_symmetrical = false,
              direction_count = 1,
              shift = util.by_pixel(-4, -22.4),
              scale = 0.8,
              tint = {r=1.0,g=1.0,b=0.2,a=0.6},
              hr_version = {
                filename = "__base__/graphics/entity/small-lamp/hr-lamp-light.png",
                priority = "high",
                width = 90,
                height = 78,
                frame_count = 1,
                axially_symmetrical = false,
                direction_count = 1,
                shift = util.by_pixel(-4, -22.4),
                scale = 0.8
              }
            },
            {
              filename = "__base__/graphics/entity/small-lamp/lamp-light.png",
              priority = "high",
              width = 46,
              height = 40,
              frame_count = 1,
              axially_symmetrical = false,
              direction_count = 1,
              shift = util.by_pixel(6, -19.4),
              tint = {r=1.0,g=1.0,b=0.2,a=0.5},
              scale = 0.35,
              hr_version = {
                filename = "__base__/graphics/entity/small-lamp/hr-lamp-light.png",
                priority = "high",
                width = 90,
                height = 78,
                frame_count = 1,
                axially_symmetrical = false,
                direction_count = 1,
                shift = util.by_pixel(6, -19.4),
                scale = 0.5
              }
            }]]
		  }
		},
		signal_to_color_mapping =
		{
		  {type="virtual", name="signal-red", color={r=1,g=0,b=0}},
		  {type="virtual", name="signal-green", color={r=0,g=1,b=0}},
		  {type="virtual", name="signal-blue", color={r=0,g=0,b=1}},
		  {type="virtual", name="signal-yellow", color={r=1,g=1,b=0}},
		  {type="virtual", name="signal-pink", color={r=1,g=0,b=1}},
		  {type="virtual", name="signal-cyan", color={r=0,g=1,b=1}},
		  {type="virtual", name="signal-white", color={r=0,g=0,b=0}},
		  {type="virtual", name="signal-grey", color={r=0.5,g=0.5,b=0.5}},
		  {type="virtual", name="signal-black", color={r=0.97,g=0.97,b=0.95}},
		},
		
		circuit_wire_connection_point = circuit_connector_definitions["lamp"].points,
		circuit_connector_sprites = circuit_connector_definitions["lamp"].sprites,
		circuit_wire_max_distance = default_circuit_wire_max_distance,
		order = "c-b"
	}
	
})
