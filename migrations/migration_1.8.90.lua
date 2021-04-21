for i, force in pairs(game.forces) do
	local technologies = force.technologies;
	local recipes = force.recipes;

	  --if force.technologies["trees-growth-3"].researched then
	if game.technology_prototypes["trees-growth-3"] and technologies["trees-growth-3"].researched then
		recipes["advanced-apple-seedling"].enabled = true
		recipes["advanced-apple-seedling"].reload()
		recipes["advanced-orange-seedling"].enabled = true
		recipes["advanced-orange-seedling"].reload()
	end

	force.reset_recipes()
	force.reset_technologies()
end


for _, player in pairs(game.players) do
	index = player.index

	local leftGui = player.gui.left
		
	if not leftGui.frame then break end

	leftGui.frame.destroy()
	figui.main.create(index, player)

	player.print("FI migration_1.8.90: main frame of GUI recreated successful")

end
