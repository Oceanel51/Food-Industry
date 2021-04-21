for i, force in pairs(game.forces) do
	local technologies = force.technologies;
	local recipes = force.recipes;

	if game.technology_prototypes["flour"] and technologies["flour"].researched then
		recipes["corn-dough"].enabled = true
		recipes["corn-dough"].reload()
		recipes["wheat-dough"].enabled = true
		recipes["wheat-dough"].reload()
	end

	force.reset_recipes()
	force.reset_technologies()
end
