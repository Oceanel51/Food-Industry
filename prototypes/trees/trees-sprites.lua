require "prototypes.scripts.trees_control"

--local ICONPATH = "__FoodIndustry__/graphics/icons/"
local ENTITYPATH = "__FoodIndustry__/graphics/entity/trees/apple/"

local 

function fi_sprite(level,xoffset,yoffset)
    return {
        type = "sprite",
        name = "fi-sprite-" .. level,
        filename = "__FoodIndustry__/graphics/nixie-chars-mono.png",
        x = xoffset * 20,
        y = yoffset * 44,
        width = 20,
        height = 44,
        apply_runtime_tint = true,
        shift = {-5/32,-7/32},
    }
end

-- stage le0 vels:
-- sprite level 1 blooming, ripening, harvesting
-- sprite level 2 sick
-- sprite level 3 rezerved
local spritelevels = {
    {"blooming-1", "blooming-2", "blooming-3", "ripening-1", "ripening-2", "ripening-3", "harvesting"},
    {"sick"},
    {"level3"}
}

for index,offset in pairs(spritelevels) do
    data:extend{
       fi_sprite(index,offset.x,offset.y)
    }
end
