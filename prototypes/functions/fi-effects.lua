model = model or {}
model.playerEffects = model.playerEffects or {}
function model.playerEffects.new(key, effect_data)
    playerEffect = {}
    playerEffect.name = key
    playerEffect.data = effect_data


    playerEffect.time = effect_data[3]
    playerEffect.activeEffects = effect_data[5]
    playerEffect.isEnabled = playerEffect.activeEffects and #playerEffect.activeEffects > 0
    playerEffect.modifier = 0
    if playerEffect.isEnabled then
        for c,effect in pairs(playerEffect.activeEffects) do
            if effect[2] then
                playerEffect.modifier = playerEffect.modifier + effect[2]
            end
        end 
    end
    return playerEffect
end

function model.playerEffects.forEach(index, fn)
    for k,v in pairs(global.effects[index]) do
        fn(model.playerEffects.new(k,v))
    end
end

function model.playerEffects.get(index, effect_name)
    v = global.effects[index][effect_name]
    if v then
        return model.playerEffects.new(effect_name,v)
    end
end