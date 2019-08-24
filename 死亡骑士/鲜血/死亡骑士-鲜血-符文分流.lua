--死亡骑士-鲜血-符文分流
if playerHealthPercent > 0.9 then
    return
end
if not SwitchIsOn("符文分流") then
    return
end
if not talent["符文分流"] then
    return
end
if not #符文分流#:ReadyIn(0.2) then
    return
end
if player.Buff:Has("符文分流") then
    return
end
if #符文分流#:GetChargeInfo():IsReachedOrSoon() then --马上充满
    if playerHealthWatcher:GetRecentDamagePercent(3) > 0.08 then
        return #符文分流#
    end
    return
end
--只有一层
if playerHealthPercent > 0.5 then
    if player.Buff:Has("冰封之韧") then
        return
    end
    if player.Buff:Has("吸血鬼之血") then
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
local dmg = playerHealthWatcher:GetRecentDamagePercent(3)
if dmg > 0.12 then
    return #符文分流#
end
if dmg > 0.08 and playerHealthPercent < 0.7 then
    return #符文分流#
end
if dmg > 0.04 and playerHealthPercent < 0.5 then
    return #符文分流#
end
