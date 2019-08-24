--死亡骑士-鲜血-吸血鬼之血
if playerHealthPercent > 0.65 then
    return
end
if not SwitchIsOn("吸血鬼之血") then
    return
end
if not #吸血鬼之血#:ReadyIn(0.2) then
    return
end
local dmg = playerHealthWatcher:GetRecentDamagePercent(3)
if playerHealthPercent > 0.5 then
    if player.Buff:Has("冰封之韧") then
        return
    end
    if player.Buff:Has("白骨风暴") then
        return
    end
    if player.Buff:Has("符文分流") then
        return
    end
    if player.Buff:Has("符文刃舞") then
        return
    end
    if player.Buff:Has("墓石") then
        return
    end
    if player.Buff:Has("反魔法护罩") and (dmg - playerHealthWatcher:GetRecentMagicDamagePercent(3)) < 0.05 then
        return --大部分是魔法伤害
    end
end
if dmg > 0.12 then
    return #吸血鬼之血#
end
if dmg > 0.08 and playerHealthPercent < 0.5 then
    return #吸血鬼之血#
end
if dmg > 0.04 and playerHealthPercent < 0.3 then
    return #吸血鬼之血#
end
