--死亡骑士-冰霜-冰龙吐息中
local v
--v = CastNoTarget(#符文武器增效#, vars["符文CDs"][5] > 0 and vars["符文能量差"] > 5) if v then return v end
v = CastNoTarget(#寒冬号角#, talent["寒冬号角"] and vars["符文能量差"] >= 40 and vars["符文CDs"][4] > 3) if v then return v end
v = CastNoTarget(vars["种族爆发"], UnitRace("player")=="血精灵" and vars["符文能量差"] >= 40) if v then return v end
v = CastNoTarget(#冰霜之柱#, targetRange < 5) if v then return v end
v = AoeAround(#冷酷严冬#, 6, 12, 0.65, 3, 1, vars["符文能量差"] > 10) if v then return v end
v = CastOnTarget(#寒冰锁链#, vars["符文能量差"] > 10 and talent["冷酷之心"] and player.Buff:Get("冷酷之心").Count >= 20  and vars["冰霜之柱中"]) if v then return v end
v = AoeFront(#凛风冲击#, 5, 100, 8, 0.65, 3, 1, vars["符文能量差"] > 10 and vars["白霜"]) if v then return v end
v = CastOnTarget(#湮灭#, vars["符文能量"] < 50 or (vars["符文能量差"] > 20 and vars["符文CDs"][5] == 0)) if v then return v end
v = AoeFront(#冰霜之镰#, 5, 100, 8, 0.65, vars["杀戮机器"] and 4 or 3, vars["杀戮机器"] and 4 or 2, vars["符文能量差"] > 10) if v then return v end
v = CastOnTarget(#湮灭#, vars["符文能量差"] > 20 and vars["符文CDs"][3] == 0) if v then return v end
v = AoeFront(#凛风冲击#, 5, 100, 8, 0.65, 5, 5, vars["符文能量差"] > 10 and not vars["白霜"]) if v then return v end
v = CastOnTarget(#湮灭#, vars["符文能量差"] > 20) if v then return v end
v = AoeFront(#凛风冲击#, 5, 100, 8, 0.65, 3, 1, vars["符文能量"] < 20) if v then return v end
return 0