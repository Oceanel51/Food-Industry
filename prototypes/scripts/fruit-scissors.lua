
local WILDE_ORANGE_TREE = "orange-wild-tree"
local ORANGE_TREE = "orange-adult-1"

local WILDE_APPLE_TREE = "apple-wild-tree"
local APPLE_TREE = "apple-adult-1"

local isFruitTrees = {
    [WILDE_ORANGE_TREE] = { result = "orange" },
    [ORANGE_TREE] = { result = "orange" },
    [WILDE_APPLE_TREE] = { result = "apple" },
    [APPLE_TREE] = { result = "apple" },
}

local function fruittree_on_FruitScissorClick(event)
    local player = game.players[event.player_index]
    if player.selected == nil then
        return
    end

    if not player.cursor_stack.valid_for_read then
        return
    end
    if player.cursor_stack.name == "fruit-scissor" then
        local fruitTree = isFruitTrees[player.selected.name]
        if fruitTree ~= nil then
            player.begin_crafting{ count = 1, recipe = fruitTree.result.."-pick" }
            -- player.insert({ name = fruitTree.result, count = 1 })
            -- TODO remove fruits from "prototypes/scripts/trees_control" fruittreestable
        end
    end
end

local isInitFruitScissors = false
function initFruitScissors()
    if isInitFruitScissors then
        return
    end
    isInitFruitScissors = true

    script.on_event("fruit-scissor-click", function(event)
        fruittree_on_FruitScissorClick(event)
    end)

end


