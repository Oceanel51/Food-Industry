for i, force in pairs(game.forces) do
	local technologies = force.technologies;
	local recipes = force.recipes;

	if game.technology_prototypes["trees-growth-1"] and technologies["trees-growth-1"].researched then
		recipes["apple-peeled"].enabled = true
		recipes["apple-peeled"].reload()
		recipes["orange-peeled"].enabled = true
		recipes["orange-peeled"].reload()
	end

	force.reset_recipes()
	force.reset_technologies()
end
