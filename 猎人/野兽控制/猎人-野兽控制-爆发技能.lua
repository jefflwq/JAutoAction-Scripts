--猎人-野兽控制-爆发技能
if not run("需要开爆发吗") then
    return
end
local v = AoeFront(#群兽奔腾#, 35, 20, 40, 0.65, 3, 1, talent["群兽奔腾"] and SwitchIsOn("群兽奔腾")) if v then return v end
v = CastNoTarget(#野性守护#) if v then return v end
if player.Buff:Get("野性守护"):GetTimeLeft() < 10 then
    return
end

v = CastNoTarget(vars["药水"], vars["药水"] and boss.Exists or false) if v then return v end
v = CastNoTarget(vars["种族爆发"], UnitRace("player")~="血精灵" or vars["集中差值"] > 25) if v then return v end
return run("开饰品")