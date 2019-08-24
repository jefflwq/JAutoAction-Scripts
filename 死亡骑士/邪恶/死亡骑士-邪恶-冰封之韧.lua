--死亡骑士-邪恶-冰封之韧
if playerHealthPercent > 0.35 then
    return
end
if not #冰封之韧#:ReadyIn(0.2) then
    return
end
local dmg = playerHealthWatcher:GetRecentDamagePercent(3)
if playerHealthPercent > 0.25 then
    if player.Buff:Has("反魔法护罩") and (dmg - playerHealthWatcher:GetRecentMagicDamagePercent(3)) < 0.05 then
        return --大部分是魔法伤害
    end
end
if dmg > 0.15 then
    return #冰封之韧#
end
if dmg > 0.1 and playerHealthPercent < 0.3 then
    return #冰封之韧#
end
if dmg > 0.05 and playerHealthPercent < 0.25 then
    return #冰封之韧#
end
