if not util then util = {} end

nextTickBoat = 0
local function on_changedPosition(event)

    if game.tick < nextTickBoat then return end
    nextTickBoat = game.tick + 30

    if event.player_index == nil then return end
    local player = game.players[event.player_index]
    if player.vehicle == nil then return end

    --player_print(player.vehicle.prototype.name)

    if player.vehicle.prototype.name ~= "indep-boat" then return end

    local tiles = 8
    local fishes = player.surface.find_entities_filtered(
        { type = "fish", area = {{player.position.x-tiles, player.position.y-tiles}, {player.position.x+tiles, player.position.y+tiles}}})
    local inv = player.vehicle.get_inventory(defines.inventory.car_trunk)
    if inv.get_item_count("fishing-boat-net") > 0 then
        for i,c in pairs(fishes) do
            if c.prototype.mineable_properties.products ~= nil then
                for _, r in ipairs(c.prototype.mineable_properties.products) do
                    inv.insert({ name = r.name, count = r.amount })
                end
            end

            c.destroy()
        end
    end
end

local isInit = false
function initFishingBoatNet()
    if isInit then return end
    isInit = true

    table.insert(foodi.on_changedPosition, on_changedPosition)
end

