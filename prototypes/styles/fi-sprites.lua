data:extend(
{
  -- Fictive items
  {
    type = "sprite",
    name = "fi_logo_x32",
    filename = "__FoodIndustry__/graphics/icons/fi_icon_x32.png",
    priority = "extra-high-no-scale",
    width = 32,
    height = 32,
  },
  
  -- Effects icons
  {
    type = "sprite",
    name = "unknown_red",
    filename = "__FoodIndustry__/graphics/icons/effects/unknown_red.png",
    priority = "medium",
    width = 32,
    height = 32,
    flags = {"icon"},
  },
  {
    type = "sprite",
    name = "unknown_gray",
    filename = "__FoodIndustry__/graphics/icons/effects/unknown_gray.png",
    priority = "medium",
    width = 32,
    height = 32,
    flags = {"icon"},
  },
  {
    type = "sprite",
    name = "unknown_green",
    filename = "__FoodIndustry__/graphics/icons/effects/unknown_green.png",
    priority = "medium",
    width = 32,
    height = 32,
    flags = {"icon"},
  },
  {
    type = "sprite",
    name = "unknown_blue",
    filename = "__FoodIndustry__/graphics/icons/effects/unknown_blue.png",
    priority = "medium",
    width = 32,
    height = 32,
    flags = {"icon"},
  },
  
  {
    type = "sprite",
    name = "drinks_for_energy_usage",
    filename = "__FoodIndustry__/graphics/icons/effects/drinks_for_energy_usage.png",
    priority = "medium",
    width = 32,
    height = 32,
    flags = {"icon"},
  },
  {
    type = "sprite",
    name = "substances_for_energy_usage",
    filename = "__FoodIndustry__/graphics/icons/effects/substances_for_energy_usage.png",
    priority = "medium",
    width = 32,
    height = 32,
    flags = {"icon"},
  },

  -- GUI icons:
  -- foods,
  {
    type = "sprite",
    name = "foods_icon_blue",
    filename = "__FoodIndustry__/graphics/gui/foods/foods_icon_blue.png",
    priority = "medium",
    width = 16,
    height = 16,
    flags = {"icon"},
  },
  {
    type = "sprite",
    name = "foods_icon_gray",
    filename = "__FoodIndustry__/graphics/gui/foods/foods_icon_gray.png",
    priority = "medium",
    width = 16,
    height = 16,
    flags = {"icon"},
  },
  {
    type = "sprite",
    name = "foods_icon_red",
    filename = "__FoodIndustry__/graphics/gui/foods/foods_icon_red.png",
    priority = "medium",
    width = 16,
    height = 16,
    flags = {"icon"},
  },
  -- drinks,
  {
    type = "sprite",
    name = "drinks_icon_blue",
    filename = "__FoodIndustry__/graphics/gui/drinks/drinks_icon_blue.png",
    priority = "medium",
    width = 16,
    height = 16,
    flags = {"icon"},
  },
  {
    type = "sprite",
    name = "drinks_icon_gray",
    filename = "__FoodIndustry__/graphics/gui/drinks/drinks_icon_gray.png",
    priority = "medium",
    width = 16,
    height = 16,
    flags = {"icon"},
  },
  {
    type = "sprite",
    name = "drinks_icon_red",
    filename = "__FoodIndustry__/graphics/gui/drinks/drinks_icon_red.png",
    priority = "medium",
    width = 16,
    height = 16,
    flags = {"icon"},
  },

})


-- extends Fat sprites
fat_states = {}
for i = 0, 5 do
	table.insert(fat_states, {
		type = "sprite",
    name = "fat_state_" .. tostring(i),
    filename = "__FoodIndustry__/graphics/gui/fat/fat-state-" .. tostring(i) .. ".png",
    priority = "extra-high",
    width = 9,
    height = 16,
	})
end
data:extend(fat_states)

-- extends foods_icons sprites
foods_icon = {}
for i = 0, 4 do
	table.insert(foods_icon, {
		type = "sprite",
    name = "foods_icon" .. tostring(i),
    filename = "__FoodIndustry__/graphics/gui/foods/foods_icon" .. tostring(i) .. ".png",
    priority = "extra-high",
    width = 16,
    height = 16,
	})
end
data:extend(foods_icon)

-- extends drinks_icon sprites
drinks_icon = {}
for i = 0, 5 do
	table.insert(drinks_icon, {
		type = "sprite",
    name = "drinks_icon" .. tostring(i),
    filename = "__FoodIndustry__/graphics/gui/drinks/drinks_icon" .. tostring(i) .. ".png",
    priority = "extra-high",
    width = 16,
    height = 16,
	})
end
data:extend(drinks_icon)

-- extends fullness sprites
fullness_icon = {}
for i = 0, 7 do
	table.insert(fullness_icon, {
		type = "sprite",
    name = "fullness_icon" .. tostring(i),
    filename = "__FoodIndustry__/graphics/gui/fullness/fullness-" .. tostring(i) .. ".png",
    priority = "medium",
    width = 16,
    height = 16,
	})
end
data:extend(fullness_icon)

-- overeating
data:extend({
  {
    type = "sprite",
    name = "overeating",
    filename = "__FoodIndustry__/graphics/gui/fullness/overeating.png",
    priority = "extra-high",
    width = 16,
    height = 16,
    flags = {"icon"},
  },
})
