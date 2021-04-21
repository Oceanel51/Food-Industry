require ("circuit-connector-generated-definitions")

circuit_connector_definitions["fi-fluid-tank"] = circuit_connector_definitions.create
(
  universal_connector_template,
  {
    { variation = 25, main_offset = util.by_pixel(-10.5, -29.5), shadow_offset = util.by_pixel(-15.5, 11.5), show_shadow = false },
    { variation = 27, main_offset = util.by_pixel(7.5, -28.5), shadow_offset = util.by_pixel(2.5, 10.5), show_shadow = false },
    { variation = 25, main_offset = util.by_pixel(-10.5, -29.5), shadow_offset = util.by_pixel(-15.5, 6.5), show_shadow = false },
    { variation = 27, main_offset = util.by_pixel(7.5, -28.5), shadow_offset = util.by_pixel(2.5, 5.5), show_shadow = false },
  }
)


data:extend(
{

------------------------------- Fluid storage-tanks ---------------------------------

  {
    type = "storage-tank",
    name = "fi-fluid-tank",
    icon = "__FoodIndustry__/graphics/icons/storages/fi-fluid-tank-icon.png",
    icon_size = 64,
    flags = {"placeable-player", "player-creation"},
    minable = {mining_time = 1.2, result = "fi-fluid-tank"},
    max_health = 300,
    corpse = "small-remnants",
    collision_box = {{-0.37, -0.37}, {0.37, 0.37}},
    selection_box = {{-0.55, -0.55}, {0.55, 0.55}},
    fluid_box =
    {
      base_area = 30,
      --pipe_picture = assembler2pipepictures(),
      pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        { position = {0, -0.95} },
        { position = {0, 0.95} }
      },
      -- set_filter = "water", "pure-water", "ketchup", "soy-milk", "soy-sauce", "canola-oil",
    },
    two_direction_only = true,
    window_bounding_box = {{0.2, -0.39}, {-0.2, 0.075}},
    pictures =
    {
      picture =
      {
        sheets =
        {
          {
            filename = "__FoodIndustry__/graphics/entity/storages/fi-fluid-tank.png",
            priority = "extra-high",
            frames = 2,
            width = 168/2,
            height = 171,
            scale = 0.41,
            shift = util.by_pixel(-0.4, -16),
            hr_version =
            {
              filename = "__FoodIndustry__/graphics/entity/storages/hr-fi-fluid-tank.png",
              priority = "extra-high",
              frames = 2,
              width = 336/2,
              height = 340,
              shift = util.by_pixel(-0.4, -16),
              scale = 0.21
            }
          },
          {
            filename = "__FoodIndustry__/graphics/entity/storages/fi-fluid-tank-shadow.png",
            priority = "extra-high",
            frames = 2,
            width = 460/2,
            height = 172,
            scale = 0.41,
            shift = util.by_pixel(30, -15),
            draw_as_shadow = true,
            hr_version =
            {
              filename = "__FoodIndustry__/graphics/entity/storages/hr-fi-fluid-tank-shadow.png",
              priority = "extra-high",
              frames = 2,
              width = 916/2,
              height = 343,
              shift = util.by_pixel(30, -15),
              scale = 0.21,
              draw_as_shadow = true
            }
          }
        }
      },
      fluid_background =
      {
        filename = "__base__/graphics/entity/storage-tank/fluid-background.png",
        priority = "extra-high",
        width = 32,
        height = 15
      },
      window_background =
      {
        filename = "__FoodIndustry__/graphics/entity/storages/fi-fluid-tank-window-background.png",
        priority = "extra-high",
        width = 18,
        height = 24,
        hr_version =
        {
          filename = "__FoodIndustry__/graphics/entity/storages/hr-fi-fluid-tank-window-background.png",
          priority = "extra-high",
          width = 34,
          height = 48,
          scale = 0.5
        }
      },
      flow_sprite =
      {
        filename = "__base__/graphics/entity/pipe/fluid-flow-low-temperature.png",
        priority = "extra-high",
        width = 160,
        height = 20
      },
      gas_flow =
      {
        filename = "__base__/graphics/entity/pipe/steam.png",
        priority = "extra-high",
        line_length = 10,
        width = 24,
        height = 15,
        frame_count = 60,
        axially_symmetrical = false,
        direction_count = 1,
        animation_speed = 0.25,
        hr_version =
        {
          filename = "__base__/graphics/entity/pipe/hr-steam.png",
          priority = "extra-high",
          line_length = 10,
          width = 48,
          height = 30,
          frame_count = 60,
          axially_symmetrical = false,
          animation_speed = 0.25,
          direction_count = 1
        }
      }
    },
    flow_length_in_ticks = 360,
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound =
      {
          filename = "__base__/sound/storage-tank.ogg",
          volume = 0.8
      },
      match_volume_to_activity = true,
      apparent_volume = 1.5,
      max_sounds_per_type = 3
    },
    circuit_wire_connection_points = circuit_connector_definitions["fi-fluid-tank"].points,
    circuit_connector_sprites = circuit_connector_definitions["fi-fluid-tank"].sprites,
    circuit_wire_max_distance = default_circuit_wire_max_distance
  },

})