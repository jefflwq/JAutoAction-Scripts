--死亡骑士-冰霜-冰龙吐息
if not talent["冰龙吐息"] or not run("需要开爆发吗") then
    return
end

vars["冰龙吐息中"] = player.Buff:Has("冰龙吐息")
if player.Buff:Has("冰龙吐息") then
    return run("冰龙吐息中")
else
    local v = run("冰龙吐息准备")
    if v == true  then
        --v = run("爆发技能") if v then return v end
        v = CastNoTarget(#符文武器增效#) if v then return v end
        v = CastNoTarget(#冰霜之柱#, targetRange < 5) if v then return v end
        v = CastNoTarget(vars["药水"], vars["药水"] and boss.Exists or false) if v then return v end
        v = CastNoTarget(vars["种族爆发"], UnitRace("player")~="血精灵") if v then return v end
        v = CastNoTarget(#冰龙吐息#) if v then return v end
        v = run("开饰品") if v then return v end
    else
        return v
    end
end
