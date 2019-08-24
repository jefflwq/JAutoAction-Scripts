--全职业-全专精-优先开饰品
if SwitchIsOn("饰品1") and trinket1:GetItemName() ~= "帕库冠羽" and trinket1:IsUsable() then
    return &使用饰品1&
end
if SwitchIsOn("饰品2") and trinket2:GetItemName() ~= "帕库冠羽" and trinket2:IsUsable() then
    return &使用饰品2&
end
