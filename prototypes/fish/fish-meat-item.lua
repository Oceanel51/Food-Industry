data:extend({

  {
    type = "item",
    name = "fish-bone",
    icon = "__FoodIndustry__/graphics/icons/items/fish-bone.png",
    icon_size = 64,

    subgroup = "foods-fish",
    order = "w-d-n",
    stack_size = 50,
  },

-- fish-meat-red
  {
    type = "capsule",
    name = "fish-meat-red",
    icon = "__FoodIndustry__/graphics/icons/items/fish-meat-red.png",
	icon_size = 64,
	icon_mipmaps = 4,
    subgroup = "foods-fish",
    order = "w-a-a",
    stack_size = 10,
	capsule_action = {
        attack_parameters = {
			ammo_category = "capsule",
			ammo_type = {
				action = {
					action_delivery = {
						target_effects = {
							damage = {
								amount = 0,
								type = "physical"
							},
							type = "damage"
						},
						type = "instant"
					},
					type = "direct"
				},
				category = "capsule",
				target_type = "position"
			},
			cooldown = 120,
			range = 0,
			type = "projectile"
        },
        type = "use-on-self"
    },
  },

-- fish-caviar-red
  {
    type = "capsule",
    name = "fish-caviar-red",
    icon = "__FoodIndustry__/graphics/icons/foods/fish-caviar-red.png",
	icon_size = 64,
	icon_mipmaps = 4,
    subgroup = "foods-fish",
    order = "w-a-b",
    stack_size = 20,
	capsule_action = {
        attack_parameters = {
			ammo_category = "capsule",
			ammo_type = {
				action = {
					action_delivery = {
						target_effects = {
							damage = {
								amount = 0,
								type = "physical"
							},
							type = "damage"
						},
						type = "instant"
					},
					type = "direct"
				},
				category = "capsule",
				target_type = "position"
			},
			cooldown = 120,
			range = 0,
			type = "projectile"
        },
        type = "use-on-self"
    },
  },

})
