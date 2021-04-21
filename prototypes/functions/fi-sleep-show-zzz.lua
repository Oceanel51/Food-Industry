-- Copyright (C) 2018-2019 ZwerOxotnik <zweroxotnik@gmail.com>
-- Licensed under the EUPL, Version 1.2 only (the "LICENCE");

local amount = {}

-- TODO доделать для показа сна на персонаже
-- вызывать когда sleep = "true"
amount.show_hp = function(character, target)
  local health = character.get_health_ratio()
  if health < 0.98 then
    local surface = character.surface
    local color = {r=68/255, g=71/255, b=255/255, a=1}
    rendering.draw_text{
      text = "💤",
      surface = surface,
      target = character,
      target_offset = {0, 0.2},
      color = color,
      time_to_live = 2,
      players = {target},
      alignment = "center",
      scale_with_zoom = true
    }
  end
end

return amount



для function on_tick()
---------------------------------------
for _, player in pairs(game.connected_players) do
  local character = player.character
  if character and character.health ~= nil and not character.vehicle then
    variants[settings.get_player_settings(player)["shas_hp_player_mode"].value].show_hp(character, player)
    for _, target in pairs(player.force.connected_players) do
      variants[settings.get_player_settings(target)["shas_shield_player_mode"].value].show_shield(character, target)
    end
  end
end
