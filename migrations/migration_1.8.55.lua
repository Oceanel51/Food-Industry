-- add migration for global.energy_max[index] with researched technology 
for _, player in pairs(game.players) do
	index = player.index
	if player.valid and player.connected then
		local leftGui = player.gui.left
		
		if not leftGui.frame then break end
		
		if not global.foods_eaten[index][1] then  -- destroy all old frame data of GUI (after 0.16.30)
			--							foods,	eaten Energy,	drinks,	drunk fluids,	used substances,	types of used food
			global.foods_eaten[index] =	{0,		0,				0,		0,				{v=0,m=0,c=0,f=0},	{}} -- values of current Foods Eaten of connected player (new!)
		end

	end
	
	player.print("FI migration_1.8.55: data sucesfuly changed")
end
