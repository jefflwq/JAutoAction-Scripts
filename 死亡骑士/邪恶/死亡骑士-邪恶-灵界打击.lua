--死亡骑士-邪恶-灵界打击
if targetRange > 5 then
    return
end
vars["需要灵界打击"] = false
if instance:InPVE() then
    if playerHealthPercent > (boss.InCombat and 0.3 or 0.5) then
        return
    end
else
    if playerHealthPercent > 0.7 then
        return
    end
end
if not #灵界打击#:CanBeUsedOnTarget(0.2) then
    vars["需要灵界打击"] = true
    return
end
return #灵界打击#
