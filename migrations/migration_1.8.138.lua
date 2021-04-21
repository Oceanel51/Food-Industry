for i, force in pairs(game.forces) do
	local technologies = force.technologies;
	local recipes = force.recipes;

if game.technology_prototypes["modular-armor"] and technologies["modular-armor"].researched then
		recipes["eat-drink-equipment"].enabled = true
		recipes["eat-drink-equipment"].reload()
	end

	force.reset_recipes()
	force.reset_technologies()
end
