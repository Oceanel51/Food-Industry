for i, force in pairs(game.forces) do
	local technologies = force.technologies;
	local recipes = force.recipes;

	if game.technology_prototypes["flour"] and technologies["flour"].researched then
		recipes["wheat-flour"].enabled = true
		recipes["wheat-flour"].reload()
		recipes["bread"].enabled = true
		recipes["bread"].reload()
	end

	force.reset_recipes()
	force.reset_technologies()
end
