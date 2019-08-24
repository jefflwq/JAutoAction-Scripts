--法师-冰霜-冰川尖刺连击
if not talent["冰川尖刺"] then
    return
end
vars["冰川尖刺伤害"] = #冰川尖刺#:GetDamage() + vars["冰刺"]:GetDamage() * 5
vars["冰川尖刺施法时间"] = #冰川尖刺#:GetCurrentCastingTime() / 1000
vars["冰川尖刺飞行时间"] = vars["冰川尖刺每码飞行时间"] * targetRange
vars["冰刺数量"] = player.Buff:Get("冰刺").Count
if vars["冰刺数量"] < 5 and player:GetCastingSpell() == "寒冰箭" or #寒冰箭#:IsCasting() or #寒冰箭#:GetSucceededOnTargetTime() < 0.2 then
    vars["冰刺数量"] = vars["冰刺数量"] + 1
end
local tm = #冰川尖刺#:GetSucceededOnTargetTime()
if tm < 0.7 or #冰川尖刺#:IsCasting() then
    if vars["冰冷智慧时间"] > 0 and #冰风暴#:GetCurrentCastingTime() == 0 then
        return #冰风暴#
    end
    if #寒冰箭#:CanBeUsedOnTarget(0.2, vars["浮冰"]) then
        return #寒冰箭#
    end
end
if tm < 4 and tm > 0.7 then
    return run("冰枪术")
end
