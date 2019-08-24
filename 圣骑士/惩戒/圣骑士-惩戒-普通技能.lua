--圣骑士-惩戒-普通技能
if vars["神圣能量差"] == 0 then
    return
end
local v
v = AoeFront(#灰烬觉醒#, 12, 140, 15, 0.65, 3, 1, targetRange < 8 and vars["神圣能量差"] > 3 and talent["灰烬觉醒"] and SwitchIsOn("灰烬觉醒")) if v then return v end
v = CastOnTarget(#公正之剑#, vars["神圣能量差"] > 1) if v then return v end
v = CastOnTarget(#审判#) if v then return v end
v = CastOnTarget(#愤怒之锤#) if v then return v end
v = AoeAround(#奉献#, 10, 15, 0.65, 3, 1, targetRange < 8) if v then return v end
v = 0.75 * gcdmax
v = CastOnTarget(#十字军打击#, not (#公正之剑#:ReadyIn(v) or #审判#:ReadyIn(v) or #愤怒之锤#:ReadyIn(v) or #奉献#:ReadyIn(v))) if v then return v end
