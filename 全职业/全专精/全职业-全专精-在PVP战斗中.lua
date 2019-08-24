--全职业-全专精-在PVP战斗中
if target:IsTrainDummy(true) then
    return true
end
if instance:InPVP() then
    return true
end
if instance:InPVE() then
    return
end
if UnitIsPlayer("target") then
    return true
end
if UnitExists("focus") and UnitIsUnit("target", "focuspet") then
    return true
end
