--法师-冰霜-输出

local v

run("更新冰冷智慧时间")
vars["浮冰"] = player.Buff:Has("浮冰")
v = run("冰川尖刺连击") if v then return v end
v = run("爆发技能", #冰冷血脉#) if v then return v end
v = CastOnTarget(#冰霜射线#, talent["冰霜射线"] and run("需要开爆发吗", true)) if v then return v end
v = AoeFront(#冰锥术#, 8, 140, 10, 0.65, 3, 3) if v then return v end
run("更新咒术洪流层数")
v = CastOnTarget(#彗星风暴#, talent["彗星风暴"] and (vars["咒术洪流层数"] > 3 or not talent["咒术洪流"]) and (targetRange < 10 or target:IsCasting() or target:IsChannaling() or not UnitIsUnit("targettarget", "player"))) if v then return v end
v = run("冰枪术") if v then return v end
if SwitchIsOn("寒冰宝珠") then
    v = run("寒冰宝珠") if v then return v end
end
v = AoeAtCursor(#~暴风雪#, 8, 10, 0.65, 3, (SwitchIsOn("暴风雪") and talent["冰冻之雨"]) and 1 or 3, true, true, true, player.Buff:Has("冰冻之雨")) if v and v ~= 0 then return v end
v = run("寒冰箭斩杀") if v then return v end
v = run("冰川尖刺") if v then return v end
v = run("冰风暴") if v then return v end
v = CastOnTarget(#冰霜射线#, talent["冰霜射线"] and not player.Buff:Has("寒冰指") and #冰霜射线#:GetDamage() * 4 < targetHealth) if v then return v end
v = CastOnTarget(#黑冰箭#, vars["冰冷智慧时间"] == 0 and vars["冰刺数量"] == 5 and talent["黑冰箭"], vars["浮冰"]) if v then return v end

v = run("寒冰新星") if v then return v end

v = CastOnTarget(#寒冰箭#, nil, vars["浮冰"]) if v then return v end
v = CastOnTarget(#冰枪术#, InCombatLockdown()) if v then return v end
