--圣骑士-防护-爆发技能

if not run("需要开爆发吗") then
    return
end
local v
v = CastNoTarget(#复仇之怒#, not talent["炽天使"] or player.Buff:Has("炽天使")) if v then return v end
if not player.Buff:Has("复仇之怒") then
    return
end
--v = CastNoTarget(vars["药水"], vars["药水"] and boss.Exists or false) if v then return v end
v = CastNoTarget(vars["种族爆发"], UnitRace("player")~="血精灵") if v then return v end
--return run("开饰品")
