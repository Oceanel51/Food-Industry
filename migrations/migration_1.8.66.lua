for i, force in pairs(game.forces) do
	local technologies = force.technologies;
	local recipes = force.recipes;

	  --if force.technologies["salad"].researched then
	if game.technology_prototypes["nutrient-extraction-2"] and technologies["nutrient-extraction-2"].researched then
		recipes["corn-to-substances-2"].enabled = true
		recipes["corn-to-substances-2"].reload()
		recipes["cucumber-to-substances-2"].enabled = true
		recipes["cucumber-to-substances-2"].reload()
		recipes["tomato-to-substances-2"].enabled = true
		recipes["tomato-to-substances-2"].reload()
		recipes["lettuce-to-substances-2"].enabled = true
		recipes["lettuce-to-substances-2"].reload()
		recipes["baked-potato-to-substances-2"].enabled = true
		recipes["baked-potato-to-substances-2"].reload()
		recipes["apple-to-substances-2"].enabled = true
		recipes["apple-to-substances-2"].reload()
		recipes["orange-to-substances-2"].enabled = true
		recipes["orange-to-substances-2"].reload()
		recipes["biter-meat-to-substances-2"].enabled = true
		recipes["biter-meat-to-substances-2"].reload()
		recipes["cooked-biter-meat-to-substances-2"].enabled = true
		recipes["cooked-biter-meat-to-substances-2"].reload()
		recipes["fish-meat-red-to-substances-2"].enabled = true
		recipes["fish-meat-red-to-substances-2"].reload()
		recipes["cooked-fish-meat-to-substances-2"].enabled = true
		recipes["cooked-fish-meat-to-substances-2"].reload()
	end

	force.reset_recipes()
	force.reset_technologies()
end


-- add migration for global.energy_max[index] with researched technology 
for _, player in pairs(game.players) do
	index = player.index	
	
	if player.valid and player.connected then
		local leftGui = player.gui.left
		
		if not leftGui.frame then
			break
		end

		if not global.effects[index]["regeneration"] then
			global.effects[index]["regeneration"] = {false,0,0,0,{}} -- init empty value of Regeneration effect
		end

	end

	player.print("FI migration_1.8.66: reset some recipes and added empty value to global variable")
end
