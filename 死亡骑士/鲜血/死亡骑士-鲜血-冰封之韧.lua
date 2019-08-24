--死亡骑士-鲜血-冰封之韧
if playerHealthPercent > (talent["浮空城意志"] and 0.2 or 0.35) then
    return
end
if not SwitchIsOn("冰封之韧") then
    return
end
if not #冰封之韧#:ReadyIn(0.2) then
    return
end
local dmg = playerHealthWatcher:GetRecentDamagePercent(3)
if playerHealthPercent > 0.3 then
    if player.Buff:Has("吸血鬼之血") then
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
if dmg > 0.15 then
    return #冰封之韧#
end
if dmg > 0.1 and playerHealthPercent < 0.2 then
    return #冰封之韧#
end
if dmg > 0.05 and playerHealthPercent < 0.12 then
    return #冰封之韧#
end
