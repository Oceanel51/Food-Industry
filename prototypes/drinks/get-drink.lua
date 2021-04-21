--local Position = require('stdlib/area/position')
local Position = require('__stdlib__/stdlib/area/position')


local FLASK = "flask"
local PLASTIC_BOTTLE = "plastic-bottle"
local GLASS_BOTTLE = "glass-bottle"


local PURE_WATER = "pure-water"


local isDrink = {
    [FLASK] = { result = "hand-flask-pure-water" },
    [PLASTIC_BOTTLE] = { result = "hand-plastic-bottle-pure-water" },
    [GLASS_BOTTLE] = { result = "glass-bottle-pure-water" },
}

local function getDrink_on_Click(event)

    local player = game.players[event.player_index]
    if player.selected == nil then
        return
    end

    if not player.cursor_stack.valid_for_read then
        return
    end

    local getDrink = isDrink[player.cursor_stack.name]

    if getDrink ~= nil then
        if player.selected.name == PURE_WATER then
            -- TODO учитывать расстояние до pure-water ресурса в пару тайлов
            local reach = player.character.reach_distance
            local distance = math.floor(Position.distance(player.position, player.selected.position))
            --player.print("dist "..distance..", reach "..reach)
            if distance >= reach then
                player.print({'print.very-far-from-pure-water', "__ITEM__"..player.cursor_stack.name.."__", distance, reach})
                return
            end
            -- take away some amount resource of pure-water
            if player.cursor_stack.name == "flask" and player.selected.amount - 30 > 0 then
                player.selected.amount = player.selected.amount - 30
                player.play_sound({path = "bottle-small-full",volume_modifier = 1.0})
            elseif player.cursor_stack.name == "plastic-bottle" and player.selected.amount - 60 > 0 then
                player.selected.amount = player.selected.amount - 60
                player.play_sound({path = "bottle-big-full",volume_modifier = 1.0})
            elseif player.cursor_stack.name == "glass-bottle" and player.selected.amount - 50 > 0 then
                player.selected.amount = player.selected.amount - 50
                player.play_sound({path = "bottle-mid-full",volume_modifier = 1.0})
            else
                player.print({'print.not-enough-pure-water', "__ITEM__"..player.cursor_stack.name.."__"})
                return
            end
            player.begin_crafting{ count = 1, recipe = getDrink.result }
            --player.play_sound({path = "__core__/sound/mine-fish",volume_modifier = 1.0})

            local inv = player.get_main_inventory()

            if inv.remove{name=player.cursor_stack.name, count=1} == 1 then

            --elseif player.get_quickbar().remove{name=player.cursor_stack.name, count=1} == 1 then -- commented, because 0.17 get error

            elseif player.cursor_stack.count > 1 then
                player.cursor_stack.count = player.cursor_stack.count - 1
            else
                player.cursor_stack.clear()
            end
        end
    end
end

local isInitGetDrink = false
function initGetDrink()
    if isInitGetDrink then
        return
    end
    isInitGetDrink = true

    script.on_event("get-drink-click", function(event)
        getDrink_on_Click(event)
    end)

end


