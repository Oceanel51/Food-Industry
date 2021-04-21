-- add migration for global.energy_max[index] with researched technology 
for _, player in pairs(game.players) do
	index = player.index
	if player.valid and player.connected then
		local leftGui = player.gui.left
		
		if not leftGui.frame then break end
		
		if global.energy[index] >= global.energy_max[index] * 0.20 then
			for i,ef in pairs(global.effects[index]["speed"][5]) do
				if ef[1] == "code_energy_below_20%" then
					effects_remove(index, i,"speed", -0.3)
				end
			end
		end

		if global.effects[index]["speed"][2] == -0.3 then
			global.effects[index]["speed"][2] = 0
		end

		if table.maxn(global.effects[index]["speed"][5]) == 0 then
			game.players[index].character_running_speed_modifier = 0
		end
	end
	
	player.print("FI migration_1.8.55.0: speed effects sucesfuly changed")
end
