--死亡骑士-冰霜-冰霜之柱
if vars["冰霜之柱中"] then
    return run("冰霜之柱中")
else
    local v = run("冰霜之柱准备")
    if v == true  then
        if not talent["冰龙吐息"] and run("需要开爆发吗") then
            v = CastNoTarget(vars["药水"], vars["药水"] and boss.Exists or false) if v then return v end
            v = CastNoTarget(vars["种族爆发"], UnitRace("player")~="血精灵") if v then return v end
            v = run("开饰品") if v then return v end
            v = CastNoTarget(#符文武器增效#, vars["符文CDs"][5] > 0 and vars["符文能量差"] >= 5) if v then return v end
        end
        v = CastNoTarget(#冰霜之柱#) if v then return v end
    else
        return v
    end
end
