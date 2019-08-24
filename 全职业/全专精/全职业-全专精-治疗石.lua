--全职业-全专精-治疗石
if playerHealthPercent > 0.35 then
    return
end
if not SwitchIsOn("治疗石") then
    return
end
if #6262#:FailedOnTarget(20, "物品还没有准备好") then
    return
end
return CastNoTarget(@治疗石@)
