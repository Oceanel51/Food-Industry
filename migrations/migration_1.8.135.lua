for i, force in pairs(game.forces) do
	local technologies = force.technologies;
	local recipes = force.recipes;

	if game.technology_prototypes["effect-capsules"] and technologies["effect-capsules"].researched then
		recipes["simple-capsule-pure-water"].enabled = true
		recipes["simple-capsule-pure-water"].reload()
	end

	force.reset_recipes()
	force.reset_technologies()
end
