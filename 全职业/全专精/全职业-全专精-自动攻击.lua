--全职业-全专精-自动攻击
if not IsAutoAttactModeEnabled() or IsAutoAttactOn() or not InCombatLockdown() then
    return
end
if targetRange > vars["自动攻击"].RangeLimit then
    return
end

if vars["自动攻击"]:HasBindingKey() then
    return vars["自动攻击"]
end
