--潜行者-奇袭-爆发技能
if not run("需要开爆发吗") then
    return
end
local v
v = CastNoTarget(#宿敌#, targetRange < 5 and vars["连击点差"] < 4 and (#消失#:ReadyIn(3) or #消失#:GetCooldown() > 20)) if v then return v end
if not player.Buff:Has("宿敌") then
    return
end
v = CastNoTarget(vars["药水"], vars["药水"] and boss.Exists or false) if v then return v end
v = CastNoTarget(vars["种族爆发"], UnitRace("player")~="血精灵" or vars["能量差"] > 30) if v then return v end
return run("开饰品")
