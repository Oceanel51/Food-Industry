for i, force in pairs(game.forces) do
	local technologies = force.technologies;
	local recipes = force.recipes;

	if game.technology_prototypes["advanced-composting"] and technologies["advanced-composting"].researched then
		recipes["straw-briquettes"].enabled = true
		recipes["straw-briquettes"].reload()
		recipes["compressed-straw-disassemble"].enabled = true
		recipes["compressed-straw-disassemble"].reload()
		recipes["compost-to-landfill"].enabled = true
		recipes["compost-to-landfill"].reload()
	end

	force.reset_recipes()
	force.reset_technologies()
end
