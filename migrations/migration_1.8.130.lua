for i, force in pairs(game.forces) do
	local technologies = force.technologies;
	local recipes = force.recipes;

	if game.technology_prototypes["cooking"] and technologies["cooking"].researched then
		recipes["whole-wheat-cookie"].enabled = true
		recipes["whole-wheat-cookie"].reload()
		recipes["cooked-biter-meat-early"].enabled = true
		recipes["cooked-biter-meat-early"].reload()
	end

	force.reset_recipes()
	force.reset_technologies()
end
