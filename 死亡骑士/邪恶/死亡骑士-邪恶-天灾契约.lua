--死亡骑士-邪恶-天灾契约
if playerHealthPercent > 0.25 then
    return
end
if not talent["天灾契约"] then
    return
end
if not #天灾契约#:ReadyIn(0.2) then
    return
end
local dmg = playerHealthWatcher:GetRecentDamagePercent(3)
if playerHealthPercent > 0.15 then
    if player.Buff:Has("冰封之韧") then
        return
    end
    if player.Buff:Has("反魔法护罩") and (dmg - playerHealthWatcher:GetRecentMagicDamagePercent(3)) < 0.05 then
        return --大部分是魔法伤害
    end
end
if dmg > 0.15 then
    return #天灾契约#
end
if dmg > 0.1 and playerHealthPercent < 0.2 then
    return #天灾契约#
end
if dmg > 0.05 and playerHealthPercent < 0.15 then
    return #天灾契约#
end
