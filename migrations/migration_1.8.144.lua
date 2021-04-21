for i, force in pairs(game.forces) do
	local technologies = force.technologies;
	local recipes = force.recipes;

	if game.technology_prototypes["fish-cooking"] and technologies["fish-cooking"].researched then
		recipes["cooked-fish-meat-2"].enabled = true
		recipes["cooked-fish-meat-2"].reload()
	end

	force.reset_recipes()
	force.reset_technologies()
end
