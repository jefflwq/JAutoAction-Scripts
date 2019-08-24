--死亡骑士-鲜血-反魔法护罩
if playerHealthPercent > 0.7 then
    return
end
if not SwitchIsOn("反魔法护罩") then
    return
end
if not #反魔法护罩#:ReadyIn(0.2) then
    return
end
if playerHealthPercent > 0.5 then
    if player.Buff:Has("冰封之韧") then
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
    if player.Buff:Has("吸血鬼之血") then
        return
    end
end
local dmg = playerHealthWatcher:GetRecentMagicDamagePercent(3)
if dmg > 0.15 then
    return #反魔法护罩#
end
if dmg > 0.1 and playerHealthPercent < 0.5 then
    return #反魔法护罩#
end
if dmg > 0.08 and playerHealthPercent < 0.3 then
    return #反魔法护罩#
end
