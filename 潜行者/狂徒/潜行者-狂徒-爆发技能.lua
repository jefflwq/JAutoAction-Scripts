--潜行者-狂徒-爆发技能

if not run("需要开爆发吗") then
    return
end
local v
v = CastOnTarget(#影舞步#, talent["影舞步"]) if v then return v end
v = CastNoTarget(#冲动#, targetRange < 5 and vars["能量回满时间"] > gcdmax and not player.Buff:Has("冲动")) if v then return v end
if player.Buff:Get("冲动"):GetTimeLeft() < 8 then
    return
end
v = CastNoTarget(vars["药水"], vars["药水"] and boss.Exists or false) if v then return v end
v = CastNoTarget(vars["种族爆发"], UnitRace("player")~="血精灵" or vars["能量差"] > 30) if v then return v end
return run("开饰品")
