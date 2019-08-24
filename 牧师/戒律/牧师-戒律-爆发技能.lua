--牧师-戒律-爆发技能
if not run("需要开爆发吗") then
    return
end
if talent["教派分歧"] and not target.Debuff:Has("教派分歧") then
    return
end
local v = CastOnTarget(vars["摧心暗影魔"]) if v then return v end

v = CastNoTarget(vars["药水"], vars["药水"] and boss.Exists or false) if v then return v end
v = CastNoTarget(vars["种族爆发"], UnitRace("player")~="血精灵") if v then return v end
return run("开饰品")
