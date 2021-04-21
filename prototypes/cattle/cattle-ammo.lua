function make_unit_melee_ammo_type(damagevalue)
    return
    {
        category = "melee",
        target_type = "entity",
        action =
        {
            type = "direct",
            action_delivery =
            {
                type = "instant",
                target_effects =
                {
                    type = "damage",
                    damage = { amount = damagevalue , type = "physical"}
                }
            }
        }
    }
end
