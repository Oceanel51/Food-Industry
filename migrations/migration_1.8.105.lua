for i, force in pairs(game.forces) do
	local technologies = force.technologies;
	local recipes = force.recipes;

	if game.technology_prototypes["crystal-extraction-1"] and technologies["crystal-extraction-1"].researched then
		recipes["pure-water-boiled"].enabled = true
		recipes["pure-water-boiled"].reload()
	end
	--if game.technology_prototypes["fishing"] and technologies["fishing"].researched then
	--	recipes["fish-meat-to-raw-mince"].enabled = true
	--	recipes["fish-meat-to-raw-mince"].reload()
	--	recipes["fish-meat-bone-to-raw-mince"].enabled = true
	--	recipes["fish-meat-bone-to-raw-mince"].reload()
	--end

	force.reset_recipes()
	force.reset_technologies()
end
