--术士-痛苦-腐蚀术
if not #腐蚀术#:CanBeUsedOnTarget(0.2) then
    return
end
if vars["目标10码敌人数量"] > 3 then
    return
end
if talent["绝对腐蚀"] and not UnitIsPlayer("target") then
    if target.Debuff:Has("腐蚀术") then
        return
    else
        return #腐蚀术#
    end
end
local duration = #腐蚀术#:GetDuration()
if target.Debuff:Get("腐蚀术"):GetTimeLeft() > duration * 0.28 then
    return
end
if target:TimeToDie() < duration * 0.5 then
    return
end
return #腐蚀术#
