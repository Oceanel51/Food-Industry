--- Make Farms recipes use glass if Bob's
--@ copyed from "Bio_Industries_0.17.5\prototypes\Bio_Farm\compatible_recipes.lua"
if data.raw.item.glass and mods["bobplates"]  then
	bobmods.lib.recipe.add_new_ingredient ("fi-greenhouse", {type="item", name="glass", amount=10})
	bobmods.lib.recipe.add_new_ingredient ("fi-big-greenhouse", {type="item", name="glass", amount=25})
	bobmods.lib.recipe.add_new_ingredient ("fi-incubator", {type="item", name="glass", amount=40})
end

if data.raw.item["silver-plate"] and mods["bobplates"] then
	bobmods.lib.recipe.replace_ingredient("advanced-shell-capsule", "iron-plate", "silver-plate")
end
