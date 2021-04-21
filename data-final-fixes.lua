for i, t in pairs(data.raw.tree) do
	if t.name == "lettuce-plant" then
		t.minable.result = "lettuce"
	elseif string.find(t.name, "-plant") then
		t.minable.result = t.name
	end
end

data.raw["assembling-machine"].centrifuge.ingredient_count = 74


-- for Bob's chemical-plant 1, 2, 3, 4 compabillity
-- TODO Bob's chemical-plants - проверить и записать в лог
if mods["bobplates"] then
	for i=1,4 do
		if data.raw["assembling-machine"]["chemical-plant-"..i] then
			table.insert(data.raw["assembling-machine"]["chemical-plant-"..i].crafting_categories, "mixing")
			log("Compabillities for Bob's chemical-plant-"..i)
		end
	end
end


if data.raw.capsule["raw-fish"] then
	if data.raw.capsule["raw-fish"].capsule_action.attack_parameters.ammo_type.action.action_delivery.target_effects.damage ~= nil then
		data.raw.capsule["raw-fish"].capsule_action.attack_parameters.ammo_type.action.action_delivery.target_effects.damage.amount = 0
	end
end
data.raw["fish"]["fish"].autoplace.min_influence = 0.01
data.raw["fish"]["fish"].autoplace.max_influence = 0.02


require("compatibilities/data-final-fixes/Krastorio2")
