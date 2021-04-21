-- add migration for global.energy_max[index] with researched technology 
for _, player in pairs(game.players) do
	index = player.index
	if player.valid and player.connected then
		local leftGui = player.gui.left
		
		if not leftGui.frame then break end
		
		if not leftGui.frame.flow3.flow34.flow341 then  -- destroy all old frame data of GUI (after 0.16.30)
			leftGui.frame.destroy()
			figui.main.create(index, player)
			player.print("FI migration_1.8.54.0: Old frame data of GUI (after 1.8.53) sucesfuly replaced")
		end

		if global.energy[index] >= global.energy_max[index] * 0.20 then
			for i,ef in pairs(global.effects[index]["speed"][5]) do
				if ef[1] == "code_energy_below_20%" then
					effects_remove(index, i,"speed", -0.3)
				end
			end
		end

	end
	
end
