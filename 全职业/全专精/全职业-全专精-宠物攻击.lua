--全职业-全专精-宠物攻击
if not UnitExists("pet") or UnitIsDead("pet") or UnitIsUnit("pettarget", "target") or UnitName("target") == "爆炸物" then
    return
end
if not &宠物攻击&.Tag then
    &宠物攻击&.Tag = GetTime()
end
local tm = GetTime() - &宠物攻击&.Tag
if tm < 0.3 then
    return CastMacro(&宠物攻击&)
end
if tm > 5 then
    &宠物攻击&.Tag = GetTime()
end
