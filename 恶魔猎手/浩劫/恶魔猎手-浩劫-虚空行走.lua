--恶魔猎手-浩劫-虚空行走
if not talent["虚空行走"] then
    return
end

if playerHealthPercent > 0.12 then
    return
end
if not #虚空行走#:CanBeUsedOnTarget(0.2) then
    return
end
if playerHealthPercent > 0.08 and player.Buff:Has("疾影") then
    return
end
if playerHealthPercent > 0.08 and player.Buff:Has("幻影打击") then
    return
end
if playerHealthPercent > 0.06 then
    if targetRange < 5 and UnitIsPlayer("target") and playerHealthPercent > targetHealthPercent and player:UpdateNearbyInfo(30).EnemyCount == 1 then
        return
    end
end
return #虚空行走#
