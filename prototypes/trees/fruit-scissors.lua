-- item
data:extend({
  {
    type = "selection-tool",
    name = "fruit-scissor",
    icon = "__FoodIndustry__/graphics/icons/items/fruit-scissor.png",
    icon_size = 32,

    subgroup = "food-machines-trees",
    order = "w-a-a",
    stack_size = 1,
    selection_color = { r = 0, g = 1, b = 0 },
    alt_selection_color = { r = 0, g = 1, b = 0 },
    selection_mode = {"trees"},
    alt_selection_mode = {"trees"},
    selection_cursor_box_type = "entity",
    alt_selection_cursor_box_type = "entity",
    can_be_mod_opened = true
  }
})

data:extend({
  {
    type = "recipe",
    name = "fruit-scissor",
    enabled = false,
    ingredients =
    {
        {"iron-plate", 20},
    },
    result = "fruit-scissor"
  },
})

data:extend({
  {
    type = "custom-input",
    name = "fruit-scissor-click",
    key_sequence = "mouse-button-1",
    consuming = "none"
  },
})


