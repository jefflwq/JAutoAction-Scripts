--死亡骑士-邪恶-反魔法护罩
if playerHealthPercent > 0.7 then
    return
end
if not #反魔法护罩#:ReadyIn(0.2) then
    return
end
if playerHealthPercent > 0.35 then
    if player.Buff:Has("冰封之韧") then
        return
    end
end
local dmg = playerHealthWatcher:GetRecentMagicDamagePercent(3)
if dmg > 0.15 then
    return #反魔法护罩#
end
if dmg > 0.11 and playerHealthPercent < 0.5 then
    return #反魔法护罩#
end
if dmg > 0.08 and playerHealthPercent < 0.3 then
    return #反魔法护罩#
end
