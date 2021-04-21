--[[ for i, force in pairs(game.forces) do
	local technologies = force.technologies;
	local recipes = force.recipes;

	  --if force.technologies["salad"].researched then
	if game.technology_prototypes["nutrient-extraction-2"] and technologies["nutrient-extraction-2"].researched then
		recipes["corn-to-substances-2"].enabled = true
		recipes["corn-to-substances-2"].reload()
	end

	force.reset_recipes()
	force.reset_technologies()
end
 ]]

-- add migration for global.energy_max[index] with researched technology 
for _, player in pairs(game.players) do
	index = player.index

	if player.valid and player.connected then
		local leftGui = player.gui.left
		
		if not leftGui.frame then break end

		leftGui.frame.destroy()
		figui.main.create(index, player)

		player.print("FI migration_1.8.67: main frame of GUI recreated successful")
	end

end
