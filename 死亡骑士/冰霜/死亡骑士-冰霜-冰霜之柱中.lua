--死亡骑士-冰霜-冰霜之柱中
local v
if not talent["冰龙吐息"] and run("需要开爆发吗") then
    v = CastNoTarget(vars["药水"], vars["药水"] and boss.Exists or false) if v then return v end
    v = CastNoTarget(vars["种族爆发"], UnitRace("player")~="血精灵") if v then return v end
    v = run("开饰品") if v then return v end
    v = CastNoTarget(#符文武器增效#, vars["符文CDs"][5] > 0 and vars["符文能量差"] >= 5) if v then return v end
end
v = AoeAround(#冷酷严冬#, 6, 12, 0.65, 3, 1, targetRange < 5 and vars["符文能量差"] > 10) if v then return v end
v = CastNoTarget(#寒冬号角#, talent["寒冬号角"] and vars["符文能量差"] >= 40 and vars["符文CDs"][4] > 3) if v then return v end
v = CastNoTarget(vars["种族爆发"], UnitRace("player")=="血精灵" and vars["符文能量差"] >= 40 and not talent["冰龙吐息"] and run("需要开爆发吗")) if v then return v end
v = CastOnTarget(#寒冰锁链#, vars["符文能量差"] > 10 and talent["冷酷之心"] and player.Buff:Get("冷酷之心").Count >= 20) if v then return v end
v = AoeFront(#凛风冲击#, 5, 100, 8, 0.65, 3, 1, vars["符文能量差"] > 10 and vars["白霜"] and not (talent["湮没"] and vars["杀戮机器"])) if v then return v end
v = AoeFront(#冰霜之镰#, 5, 100, 8, 0.65, vars["杀戮机器"] and 4 or 3, vars["杀戮机器"] and 4 or 2, vars["符文能量差"] > 10) if v then return v end
v = AoeFront(#凛风冲击#, 5, 100, 8, 0.65, 5, 5, vars["符文能量差"] > 10 and not vars["白霜"] and not (talent["湮没"] and vars["杀戮机器"])) if v then return v end
v = CastOnTarget(#湮灭#, vars["符文能量差"] > 20) if v then return v end
v = CastOnTarget(#冰霜打击#, (not (talent["湮没"] and vars["杀戮机器"])) or vars["符文能量差"] < 30) if v then return v end


