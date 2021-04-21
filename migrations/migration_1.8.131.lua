for _, player in pairs(game.players) do
	index = player.index

	local leftGui = player.gui.left
		
	if not leftGui.frame then break end

	leftGui.frame.destroy()
	figui.main.create(index, player)

	player.print("FI migration_1.8.131: main frame of GUI recreated successful")

end
