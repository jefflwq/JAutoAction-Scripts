--死亡骑士-鲜血-灵界打击
if vars["符文能量"] > 95 then
    if talent["白骨风暴"] and SwitchIsOn("白骨风暴") and #白骨风暴#:ReadyIn(0.2) then
        return
    end
    if not #灵界打击#:CanBeUsedOnTarget(0.2) then
        return
    end
    return #灵界打击#
end
if playerHealthPercent > 0.93 then
    return
end
if not #灵界打击#:CanBeUsedOnTarget(0.2) then
    return
end
if player.Buff:Get("鲜血护盾"):GetTimeLeft() > 4 then
    return
end

if playerHealthPercent < 0.7 or playerHealthWatcher:GetRecentDamagePercent(5) > 0.3 then
    return #灵界打击#
end
