for _, player in pairs(game.players) do
	index = player.index

	local leftGui = player.gui.left
		
	if not leftGui.frame then break end

	
	if player.force.technologies["fi-tech-eatout-button"] and player.force.technologies["fi-tech-eatout-button"].researched then
		if leftGui.frame.flow6 then
			leftGui.frame.flow6.destroy()

			player.print("FI migration_1.8.129: [color=1,0,0]deleted[/color] unused eat_button elements.")
		end
	end
end
