for i, force in pairs(game.forces) do
	local technologies = force.technologies;
	local recipes = force.recipes;

	  --if force.technologies["salad"].researched then
	if game.technology_prototypes["fruit-juicing"] and technologies["fruit-juicing"].researched then
		force.recipes["plastic-bottle-apple-juice"].enabled = true
		recipes["plastic-bottle-apple-juice"].reload()
		
		force.recipes["plastic-bottle-orange-juice"].enabled = true
		recipes["plastic-bottle-orange-juice"].reload()
		force.recipes["plastic-bottle-tomato-juice"].enabled = true
		recipes["plastic-bottle-tomato-juice"].reload()
		
		force.recipes["raw-orange-juice"].enabled = true
		recipes["raw-orange-juice"].reload()
		force.recipes["orange-juice"].enabled = true
		recipes["orange-juice"].reload()

		force.recipes["raw-tomato-juice"].enabled = true
		recipes["raw-tomato-juice"].reload()
		force.recipes["tomato-juice"].enabled = true
		recipes["tomato-juice"].reload()
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

		--if not global.effects[index]["overeating"] then
		--	global.effects[index]["overeating"] = {false,0,0,0}	-- init empty value of Overeating
		--end

	end

	player.print("FI migration_1.8.60: reset some recipes successful")
end

