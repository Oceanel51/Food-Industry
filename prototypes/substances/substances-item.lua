data:extend({
  
  {
    type = "capsule",
    name = "substances-dust",
    icon = "__FoodIndustry__/graphics/icons/substances/substances-dust.png",
    icon_size = 32,

    subgroup = "foods-substances",
    order = "w-s-a",
    stack_size = 100,
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

--[[   {
	type = "item",
	name = "substance-v",
	icon = "__FoodIndustry__/graphics/icons/substances/substance-v.png",
	icon_size = 32,
	flags = {"goes-to-main-inventory"},
    subgroup = "foods-substances",
	order = "w-s-a",
	stack_size = 100,
	fuel_category = "plant",
	fuel_value = "4J"
	}, ]]
  {
    type = "capsule",
    name = "substance-v",
    icon = "__FoodIndustry__/graphics/icons/substances/substance-v.png",
    icon_size = 32,

    subgroup = "foods-substances",
    order = "w-s-b",
    stack_size = 100,
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

--[[  {
	type = "item",
	name = "substance-m",
	icon = "__FoodIndustry__/graphics/icons/substances/substance-m.png",
	icon_size = 32,
	flags = {"goes-to-main-inventory"},
	subgroup = "foods-substances",
	order = "w-s-b",
	stack_size = 100,
	fuel_category = "plant",
	fuel_value = "4J"
  }, ]]
  {
		type = "capsule",
		name = "substance-m",
		icon = "__FoodIndustry__/graphics/icons/substances/substance-m.png",
		icon_size = 32,

		subgroup = "foods-substances",
		order = "w-s-c",
		stack_size = 100,
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

--[[   {
	type = "item",
	name = "substance-c",
	icon = "__FoodIndustry__/graphics/icons/substances/substance-c.png",
	icon_size = 32,
	flags = {"goes-to-main-inventory"},
	subgroup = "foods-substances",
	order = "w-s-c",
	stack_size = 100,
	fuel_category = "plant",
	fuel_value = "4J"
  }, ]]
  {
    type = "capsule",
    name = "substance-c",
    icon = "__FoodIndustry__/graphics/icons/substances/substance-c.png",
    icon_size = 32,

    subgroup = "foods-substances",
    order = "w-s-d",
    stack_size = 100,
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

--[[   {
	type = "item",
	name = "substance-f",
	icon = "__FoodIndustry__/graphics/icons/substances/substance-f.png",
	icon_size = 32,
	flags = {"goes-to-main-inventory"},
	subgroup = "foods-substances",
	order = "w-s-d",
	stack_size = 100,
	fuel_category = "plant",
	fuel_value = "4J"
  }, ]]
  {
    type = "capsule",
    name = "substance-f",
    icon = "__FoodIndustry__/graphics/icons/substances/substance-f.png",
    icon_size = 32,

    subgroup = "foods-substances",
    order = "w-s-e",
    stack_size = 100,
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
