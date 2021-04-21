-- add migration for global.energy_max[index] with researched technology 
for _, player in pairs(game.players) do
	index = player.index
	if player.valid and player.connected then
		local leftGui = player.gui.left
		
		if not leftGui.frame then
			break
		end

		if not global.fi_achievements[index]["trees-gardener"] then
			-- init empty value of trees-gardener
			global.fi_achievements[index]["trees-gardener"]		 = {false,0,0,nil}
		end

	end

	player.print("FI migration_1.8.107: add new var achievements successful")
end
