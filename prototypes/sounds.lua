data:extend({
	
	{
		type = "sound",
		name = "deconstruct-wood-sound",
		variations =
		{
			{
				filename = "__FoodIndustry__/sounds/deconstruct-wood.ogg",
				volume = 0.9
			},
		},
	},
	{
		type = "sound",
		name = "use-food-capsule-sound",
		variations =
		{
			{
				filename = "__FoodIndustry__/sounds/eating/lineage-ii-potion-use.ogg",
				volume = 1.0
			}
		},
	},
	{
		type = "sound",
		name = "use-lettuce-sound",
		variations =
		{
			{
				filename = "__FoodIndustry__/sounds/eating/lettuce-eating1.ogg",
				volume = 1.0
			},
			{
				filename = "__FoodIndustry__/sounds/eating/lettuce-eating2.ogg",
				volume = 1.0
			}
		},
	},
	{
		type = "sound",
		name = "use-cucumber-sound",
		variations =
		{
			{
				filename = "__FoodIndustry__/sounds/eating/cucumber-eating1.ogg",
				volume = 1.0
			},
			{
				filename = "__FoodIndustry__/sounds/eating/cucumber-eating2.ogg",
				volume = 1.0
			}
		},
	},
	{
		type = "sound",
		name = "use-tomato-sound",
		variations =
		{
			{
				filename = "__FoodIndustry__/sounds/eating/tomato-eating1.ogg",
				volume = 0.8
			},
			{
				filename = "__FoodIndustry__/sounds/eating/tomato-eating2.ogg",
				volume = 1.0
			},
			{
				filename = "__FoodIndustry__/sounds/eating/tomato-eating3.ogg",
				volume = 0.9
			}
		},
	},
	{
		type = "sound",
		name = "use-meat-sound",
		variations =
		{
			{
				filename = "__FoodIndustry__/sounds/eating/meat-eating1.ogg",
				volume = 1.0
			},
			{
				filename = "__FoodIndustry__/sounds/eating/meat-eating2.ogg",
				volume = 1.0
			},
			{
				filename = "__FoodIndustry__/sounds/eating/meat-eating3.ogg",
				volume = 1.0
			}
		},
	},
	{
		type = "sound",
		name = "use-basic-salad-sound",
		variations =
		{
			{
				filename = "__FoodIndustry__/sounds/eating/basic-salad-eating.ogg",
				volume = 1.0
			}
		},
	},
	{
		type = "sound",
		name = "use-seeds-sound",
		variations =
		{
			{
				filename = "__FoodIndustry__/sounds/eating/seeds-eating1.ogg",
				volume = 1.0
			},
			{
				filename = "__FoodIndustry__/sounds/eating/seeds-eating2.ogg",
				volume = 1.0
			},
			{
				filename = "__FoodIndustry__/sounds/eating/seeds-eating3.ogg",
				volume = 1.0
			}
		},
	},
	-- complex food
	--[[{
		type = "sound",
		name = "use-food-sound",
		variations =
		{
			{
				filename = "__FoodIndustry__/sounds/<sounf eat meat, potato>.ogg",
				volume = 0.9
			},
			{
				filename = "__FoodIndustry__/sounds/<sounf eat meat, potato>.ogg",
				volume = 0.9
			},
		},
	},
	{
		type = "sound",
		name = "use-vegan-food-sound",
		variations =
		{
			{
				filename = "__FoodIndustry__/sounds/<sounf eat carrot, salad>.ogg",
				volume = 0.9
			},
			{
				filename = "__FoodIndustry__/sounds/<sounf eat carrot, salad>.ogg",
				volume = 0.9
			},
		},
	},]]

	-- drinks
	{
		type = "sound",
		name = "drink-water-sound",
		variations =
		{
			{
				filename = "__FoodIndustry__/sounds/eating/drink-water.ogg",
				volume = 1.0
			}
		},
	},
	{
		type = "sound",
		name = "bottle-big-full",
		variations =
		{
			{
				filename = "__FoodIndustry__/sounds/liquids/bottle-big-full.ogg",
				volume = 0.7
			}
		},
	},
	{
		type = "sound",
		name = "bottle-mid-full",
		variations =
		{
			{
				filename = "__FoodIndustry__/sounds/liquids/bottle-mid-full.ogg",
				volume = 0.75
			}
		},
	},
	{
		type = "sound",
		name = "bottle-small-full",
		variations =
		{
			{
				filename = "__FoodIndustry__/sounds/liquids/bottle-small-full.ogg",
				volume = 0.8
			}
		},
	},
})


function make_heavy_gunshot_sounds()
	return
	{
		{
			filename = "__base__/sound/fight/heavy-gunshot-1.ogg",
			volume = 0.45
		},
		{
			filename = "__base__/sound/fight/heavy-gunshot-2.ogg",
			volume = 0.45
		},
		{
			filename = "__base__/sound/fight/heavy-gunshot-3.ogg",
			volume = 0.45
		},
		{
			filename = "__base__/sound/fight/heavy-gunshot-4.ogg",
			volume = 0.45
		}
	}
end

function make_light_gunshot_sounds()
	return
	{
		{
			filename = "__base__/sound/fight/light-gunshot-1.ogg",
			volume = 0.3
		},
		{
			filename = "__base__/sound/fight/light-gunshot-2.ogg",
			volume = 0.3
		},
		{
			filename = "__base__/sound/fight/light-gunshot-3.ogg",
			volume = 0.3
		}
	}
end

function make_biter_roars(volume)
	return
	{
		{
			filename = "__base__/sound/creatures/biter-roar-1.ogg",
			volume = volume
		},
		{
			filename = "__base__/sound/creatures/biter-roar-2.ogg",
			volume = volume
		},
		{
			filename = "__base__/sound/creatures/biter-roar-3.ogg",
			volume = volume
		},
		{
			filename = "__base__/sound/creatures/biter-roar-4.ogg",
			volume = volume
		},
		{
			filename = "__base__/sound/creatures/biter-roar-5.ogg",
			volume = volume
		},
		{
			filename = "__base__/sound/creatures/biter-roar-6.ogg",
			volume = volume
		}
	}
end

function make_biter_dying_sounds(volume)
	return
	{
		{
			filename = "__base__/sound/creatures/biter-death-1.ogg",
			volume = volume
		},
		{
			filename = "__base__/sound/creatures/biter-death-2.ogg",
			volume = volume
		},
		{
			filename = "__base__/sound/creatures/biter-death-3.ogg",
			volume = volume
		},
		{
			filename = "__base__/sound/creatures/biter-death-4.ogg",
			volume = volume
		},
		{
			filename = "__base__/sound/creatures/biter-death-5.ogg",
			volume = volume
		}
	}
end

function make_biter_calls(volume)
	return
	{
		{
			filename = "__base__/sound/creatures/biter-call-1.ogg",
			volume = volume
		},
		{
			filename = "__base__/sound/creatures/biter-call-2.ogg",
			volume = volume
		},
		{
			filename = "__base__/sound/creatures/biter-call-3.ogg",
			volume = volume
		},
		{
			filename = "__base__/sound/creatures/biter-call-4.ogg",
			volume = volume
		},
		{
			filename = "__base__/sound/creatures/biter-call-5.ogg",
			volume = volume
		}
	}
end

function make_spitter_roars(volume)
	return
	{
		{
			filename = "__base__/sound/creatures/spitter-1.ogg",
			volume = volume
		},
		{
			filename = "__base__/sound/creatures/spitter-2.ogg",
			volume = volume
		},
		{
			filename = "__base__/sound/creatures/spitter-3.ogg",
			volume = volume
		},
		{
			filename = "__base__/sound/creatures/spitter-4.ogg",
			volume = volume
		},
		{
			filename = "__base__/sound/creatures/spitter-5.ogg",
			volume = volume
		},
		{
			filename = "__base__/sound/creatures/spitter-6.ogg",
			volume = volume
		},
		{
			filename = "__base__/sound/creatures/spitter-7.ogg",
			volume = volume
		},
		{
			filename = "__base__/sound/creatures/spitter-8.ogg",
			volume = volume
		}
	}
end

function make_spitter_dying_sounds(volume)
	return
	{
		{
			filename = "__base__/sound/creatures/spitter-death-1.ogg",
			volume = volume
		},
		{
			filename = "__base__/sound/creatures/spitter-death-2.ogg",
			volume = volume
		},
		{
			filename = "__base__/sound/creatures/spitter-death-3.ogg",
			volume = volume
		},
		{
			filename = "__base__/sound/creatures/spitter-death-4.ogg",
			volume = volume
		},
		{
			filename = "__base__/sound/creatures/spitter-death-5.ogg",
			volume = volume
		}
	}
end


function make_worm_roars(volume)
	return
	{
		{
			filename = "__base__/sound/creatures/worm-roar-1.ogg",
			volume = volume
		},
		{
			filename = "__base__/sound/creatures/worm-roar-2.ogg",
			volume = volume
		},
		{
			filename = "__base__/sound/creatures/worm-roar-3.ogg",
			volume = volume
		},
		{
			filename = "__base__/sound/creatures/worm-roar-4.ogg",
			volume = volume
		}
	}
end

function make_worm_dying_sounds(volume)
	return
	{
		{
			filename = "__base__/sound/creatures/worm-death-1.ogg",
			volume = volume
		},
		{
			filename = "__base__/sound/creatures/worm-death-2.ogg",
			volume = volume
		},
		{
			filename = "__base__/sound/creatures/worm-death-3.ogg",
			volume = volume
		},
		{
			filename = "__base__/sound/creatures/worm-death-4.ogg",
			volume = volume
		},
		{
			filename = "__base__/sound/creatures/worm-death-5.ogg",
			volume = volume
		}
	}
end
