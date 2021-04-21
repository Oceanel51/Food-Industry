local util = {}

local mergeIcons = function(icon1, icon_size1, icon2, icon_size2, scale)
    scale = scale or 0.5 
    return {
        {
            icon = icon1,
            icon_size = icon_size1
        },
        {
            icon = icon2,
            icon_size = icon_size2,
            scale = scale,
            shift = { icon_size1 * -0.2, icon_size1 * 0.2}
        }
    }
end


local mergeItemIcons = function(item, icon, icon_size, scale)
    if item.icon == nil then 
        return    
    end
    scale = scale or 0.5 
    return {
        {
            icon = item.icon,
            icon_size = item.icon_size
        },
        {
            icon = icon,
            icon_size = icon_size,
            scale = scale,
            shift = { item.icon_size * -0.2, item.icon_size * 0.2}
        }
    }
end


local mergeItemIcon = function(item, icon, icon_size, scale)
    if item.icon == nil then 
        return    
    end
    scale = scale or 0.5 
    item.icons = {
        {
            icon = item.icon,
            icon_size = item.icon_size
        },
        {
            icon = icon,
            icon_size = icon_size,
            scale = scale,
            shift = { item.icon_size * -0.2, item.icon_size * 0.2}
        }
    }
end

util.mergeItemIcon = mergeItemIcon
util.mergeItemIcons = mergeItemIcons
util.mergeIcons = mergeIcons

return util