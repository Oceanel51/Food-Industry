if not util then util = {} end

local function on_player_selected_area(event)
    local player = game.players[event.player_index]
    if player == nil then return end
    if event.item == "fi-shovel" then
        for i,t in pairs(event.tiles) do
            player.surface.create_entity({ position = t.position, name = "tile-ghost", force = player.force, inner_name = "water" })
        end
    end
end

local isInit = false
function initShovel()
    if isInit then return end
    isInit = true

    table.insert(foodi.on_player_selected_area, on_player_selected_area)

end


