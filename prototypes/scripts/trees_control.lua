local times = {
    --name
    --    type,         time_min,   time_max
    ["apple"] =  {                                  -- default 1300 (21 Minutes and 40 Seconds) / 0.6 = 2166
        ["seed"]     = {390*60,  390*60*1.2},
        ["seedling"] = {200*60,  200*60*1.1},
        ["sapling"]  = {330*60,  330*60*1.3},
        ["young-1"]  = {380*60,  380*60*1.4},
        ["adult-1"]  = {  5*60,    5*60}
    },
    ["orange"] = {                                  -- default 1570 (26 Minutes and 10 Seconds) / 0.6 = 2616
        ["seed"]     = {440*60,  440*60*1.3},
        ["seedling"] = {290*60,  290*60*1.2},
        ["sapling"]  = {380*60,  380*60*1.2},
        ["young-1"]  = {460*60,  460*60*1.4},
        ["adult-1"]  = {  6*60,    6*60}
    },
    ["wheat"] =  {                                  -- default 600 (10 Minutes and 0 Seconds) / 0.6 = 1000
        ["seed"]     = {130*60,  130*60*1.2},
        ["seedling"] = {160*60,  160*60*1.1},
        ["sapling"]  = {130*60,  130*60*1.2},
        ["young-1"]  = {180*60,  180*60*1.4},
        ["adult-1"]  = {  4*60,    4*60}
    }
}
local treetypes = {"seed", "seedling", "sapling", "young", "adult"}


local function addSeedling(entity, event, time)
    --writeDebug("foodi.add "..entity.name.."") -- DEBUG
    --if entity.valid and isFruitSeedlings[seedling.name] ~= nil then

    local treename
    local treetype
    if string.match(entity.name, "-(.*)-") ~= nil then
        treename = string.match(entity.name, "(.*)-(.*)-") -- "apple-adult-1" = apple
        treetype = string.match(entity.name, "-(.*)")
    else
        treename = string.match(entity.name, "(.*)-")
        treetype = string.match(entity.name, "-(.*)")
    end
    --writeDebug("treename "..treename..", treetype "..treetype) -- DEBUG

    -- second entity filter
    if times[treename] == nil then
        --writeDebug("entity "..entity.name.." [color=1,0,0]not matched[/color]") -- DEBUG
        return
    else
        --writeDebug("entity "..entity.name.." [color=0,1,0]matched[/color] ") -- DEBUG
        --writeDebug(dump(times[treename])) -- DEBUG
    end

    local time_min = 1.6 * 60 * 10
    local time_max = 2.0 * 60 * 10
    if time ~= nil then
        time_min = time[1]
        time_max = time[2]
    else
        time_min = times[treename][treetype][1]
        time_max = times[treename][treetype][2]
    end
    --writeDebug("FI: time_min "..time_min..", time_max "..time_max) -- DEBUG
    
    if entity.valid then
        table.insert(global.foodi.fruitSeedlings,
        {
            seedling = entity,
            fullgrowntick = event.tick + math.random(time_min, time_max)
        })
        --writeDebug("foodi.fruitSeedlings "..entity.name.." [color=0,1,0]added[/color]") -- DEBUG
        
        -- counter of landed seedlings fos statistic and achivements
        if global.fi_achievements[index] ~= nil then
            if global.fi_achievements[index]["trees-gardener"] then
                -- init empty value of trees-gardener
                global.fi_achievements[index]["trees-gardener"][1] = true
                global.fi_achievements[index]["trees-gardener"][2] = global.fi_achievements[index]["trees-gardener"][2] + 1
                --writeDebug(dump(global.fi_achievements[index]["trees-gardener"]))
            else
                writeDebug("[A bug]: global.fi_achievements[trees-gardener] does not exist! Contact the developer.")
            end
        end
        
        return true
    end
    return false
end

local function local_fruittree_tick(event)
    if #global.foodi.fruitSeedlings > 0 then
        for index, fruitSeedling in ipairs(global.foodi.fruitSeedlings) do
            if fruitSeedling ~= nil and fruitSeedling.fullgrowntick < event.tick then
                if not fruitSeedling.seedling.valid then
                    --writeDebug("FI: fruitSeedling entity is not valid  [color=1,0,0]removed[/color]!") -- DEBUG
                    table.remove(global.foodi.fruitSeedlings, index)
                    return
                end
                local surface = fruitSeedling.seedling.surface
                local position = fruitSeedling.seedling.position
                local time = {}
                local fruitSeedlingNew
                --local isFruitSeedling = isFruitSeedlings[fruitSeedling.seedling.name]

                local treename
                local treetype
                local treetypenext
                --writeDebug("FI: name = "..fruitSeedling.seedling.name) -- DEBUG
                if string.match(fruitSeedling.seedling.name, "-(.*)-") ~= nil then
                    treename = string.match(fruitSeedling.seedling.name, "(.*)-(.*)-")
                    treetype = string.match(fruitSeedling.seedling.name, "-(.*)-")
                else
                    treename = string.match(fruitSeedling.seedling.name, "(.*)-")
                    treetype = string.match(fruitSeedling.seedling.name, "-(.*)")
                end
                for i, v in ipairs(treetypes) do
                    if v == treetype then
                        treetypenext = treetypes[i+1]
                        if treetypenext ~= nil and string.match(treetypenext, "young") == treetypenext then
                            treetypenext = "young-1"
                        elseif treetypenext ~= nil and string.match(treetypenext, "adult") == treetypenext then
                            treetypenext = "adult-1"
                        end
                    end
                end
                
                --writeDebug("FI: treename = "..treename..", treetype = "..treetype) -- DEBUG
                --writeDebug("FI: treetypenext = "..treetypenext) -- DEBUG
                --writeDebug("FI: match "..string.match(fruitSeedling.seedling.name, ".+"..treetype)) -- DEBUG
                if string.match(fruitSeedling.seedling.name, ".*"..treetype..".*") == fruitSeedling.seedling.name then
                    table.remove(global.foodi.fruitSeedlings, index)
                    --writeDebug("foodi.fruitSeedlings "..fruitSeedling.seedling.name.." #"..index.." [color=1,0,0]removed[/color] on_tick") -- DEBUG

                    if treetypenext ~= nil then
                        fruitSeedling.seedling.destroy()
                        fruitSeedlingNew = surface.create_entity{name = treename.."-"..treetypenext, position = position}
                        addSeedling(fruitSeedlingNew, event, times[treename][treetypenext])
                    end
                end
                --writeDebug("FI: treename = "..treename..", treetype = "..treetype.. " [color=0,1,0]growed[/color] to --> "..treetypenext) -- DEBUG

                --writeDebug("foodi.fruitSeedlings "..fruitSeedling.seedling.name.." grown up!") -- DEBUG
                --writeDebug(dump(global.foodi.fruitSeedlings)) -- DEBUG
            end
        end
    end
end

local local_fruittree_added = function(entity, event)
    if addSeedling(entity, event) then
        return
    end
end

local local_fruittree_removed = function(entity)
    --if entity.valid and isFruitSeedlings[entity.name] ~= nil then
    if entity.valid then
        for index, fruitseedling in ipairs(global.foodi.fruitSeedlings) do
            if fruitseedling.seedling == entity then
                table.remove(global.foodi.fruitSeedlings, index)
                --writeDebug("foodi.fruitSeedlings "..entity.name.." [color=1,0,0]removed[/color]") -- DEBUG
                return
            end
        end
    end
end

local isInitFruitTrees = false
function initFruitTrees()
    if isInitFruitTrees then
        return
    end
    isInitFruitTrees = true
    if global ~= nil then
        if not global.foodi then global.foodi = {} end
        if not global.foodi.fruittrees then global.foodi.fruittrees = {} end
        if not global.foodi.fruitSeedlings then global.foodi.fruitSeedlings = {} end
    end

    table.insert(foodi.ticks,local_fruittree_tick)
    table.insert(foodi.on_added,local_fruittree_added)
    table.insert(foodi.on_remove,local_fruittree_removed)
end
