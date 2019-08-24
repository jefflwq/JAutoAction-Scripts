--死亡骑士-鲜血-墓石
if playerHealthPercent > 0.9 then
    return
end
if vars["符文能量差"] < 35 then
    return
end
if not talent["墓石"] then
    return
end
if not #墓石#:ReadyIn(0.2) then
    return
end
if not SwitchIsOn("墓石") then
    return
end

local count = player.Buff:Get("白骨之盾").Count
if count < 5 then
    return
end
local dmg = playerHealthWatcher:GetRecentDamagePercent(3)
if playerHealthPercent > 0.5 then
    if player.Buff:Has("吸血鬼之血") then
        return
    end
    if player.Buff:Has("白骨风暴") then
        return
    end
    if player.Buff:Has("冰封之韧") then
        return
    end
    if player.Buff:Has("符文分流") then
        return
    end
    if player.Buff:Has("符文刃舞") then
        return
    end
    if player.Buff:Has("反魔法护罩") and (dmg - playerHealthWatcher:GetRecentMagicDamagePercent(3)) < 0.05 then
        return --大部分是魔法伤害
    end
end
if dmg > 0.15 then
    return #墓石#
end
if dmg > 0.1 and playerHealthPercent < 0.4 then
    return #墓石#
end
if dmg > 0.05 and playerHealthPercent < 0.3 then
    return #墓石#
end
