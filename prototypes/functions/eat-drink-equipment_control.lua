require "prototypes.functions.fi-GUI"


-- Early game "Eat/Drink" Buttons creation
function figui.eedb.create(index, player)
	-- local leftGui = player.gui.left
	local ScreenGui = player.gui.screen
	
	if not settings.global["food-industry-calculate"].value then
		if ScreenGui.frame_eedb then
			ScreenGui.frame_eedb.destroy()
		end
		return false
	end

	-- if ScreenGui.bar then
	-- 	ScreenGui.bar.destroy()
	-- end

	-- initialize main .frame_eedb
	if not ScreenGui.frame_eedb then
		ScreenGui.add{type = "frame", name = "frame_eedb", direction = "horizontal"}
	end

	if not ScreenGui.frame_eedb.flow1 then
		ScreenGui.frame_eedb.add{type = "flow", name = "flow1", right_padding = 0, left_padding = 0, direction = "horizontal"}
	end
	-- TODO "eat-button-ongui" by Oceanel
	-- if player.force.technologies["fi-tech-eatout-button"] and player.force.technologies["fi-tech-eatout-button"].researched then
	if not ScreenGui.frame_eedb.flow1.eat_button then
		ScreenGui.frame_eedb.flow1.add{
		type = "sprite-button",
		name = "eat_button",
		--caption = {'button.eatout'},
		tooltip = {'button.eatout-tooltip'},
		align = "right",
		vertical_align = "bottom",
		--horizontally_stretchable = true,
		--key_sequence = "SHIFT + E",
		-- height = 14,
		-- width = 16}
		sprite = "item/corn",
		style = "icon_button"}
	end
	-- 	else
	-- 	ScreenGui.frame_eedb.flow6.destroy()
	-- end

	if not ScreenGui.frame_eedb.flow2 then
		ScreenGui.frame_eedb.add{type = "flow", name = "flow2", right_padding = 0, left_padding = 0, width=16, height=32, direction = "vertical"}
	end
	if not ScreenGui.frame_eedb.flow2.sprite_foods_icon then
		ScreenGui.frame_eedb.flow2.add({type="sprite", name="sprite_foods_icon", sprite="foods_icon_gray", scaleable=false, align="left",})
	end
	if not ScreenGui.frame_eedb.flow2.sprite_drinks_icon then
		ScreenGui.frame_eedb.flow2.add({type="sprite", name="sprite_drinks_icon", sprite="drinks_icon_gray", scaleable=false, align="left",})
	end

	if not ScreenGui.frame_eedb.flow3 then
		ScreenGui.frame_eedb.add{type = "flow", name = "flow3", right_padding = 0, left_padding = 0, direction = "horizontal"}
	end
	if not ScreenGui.frame_eedb.flow3.drink_button then
		ScreenGui.frame_eedb.flow3.add{
		type = "sprite-button",
		name = "drink_button",
		--caption = {'button.eatout'},
		tooltip = {'button.eatout-tooltip'},
		align = "right",
		vertical_align = "bottom",
		sprite = "item/flask-pure-water",
		style = "icon_button"}
	end

	--writeDebug("FI: player.display_resolution: "..player.display_resolution.width.."x"..player.display_resolution.height) -- DEBUG
	ScreenGui.frame_eedb.style.padding = 3
	ScreenGui.frame_eedb.style.top_padding = 6
	
	--ScreenGui.frame_eedb.style.natural_width = 114 (minimal_width, maximal_width, etc., also for height)

	ScreenGui.frame_eedb.location = {player.display_resolution.width / 2 / 1.67, player.display_resolution.height - 52}
	--/c game.player.gui.screen.frame_eedb.style.top_padding = 100
	--/c game.player.gui.screen.frame_eedb.location = {575, 968}
	
	return true
end


-- Early game "Eat/Drink" Buttons creation
function figui.eedb.destroy(index, player)
	-- local leftGui = player.gui.left
	local ScreenGui = player.gui.screen

	if not settings.global["food-industry-calculate"].value then
		return false
	end

	if ScreenGui.frame_eedb then
		ScreenGui.frame_eedb.destroy()
	end
	return true
end


function figui.eedb.update(index, player)
	
end
