--猎人-射击-爆发技能
if not run("需要开爆发吗") then
    return
end
v = CastNoTarget(#百发百中#) if v then return v end
if not #百发百中#:SucceededIn(5) then
    return
end

v = CastNoTarget(vars["药水"], vars["药水"] and boss.Exists or false) if v then return v end
v = CastNoTarget(vars["种族爆发"], UnitRace("player")~="血精灵" or vars["集中差值"] > 25) if v then return v end
return run("开饰品")