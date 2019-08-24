--圣骑士-惩戒-爆发技能

if not run("需要开爆发吗") then
    return
end
local v = run("复仇征伐") if v then return v end
if not player.Buff:Has(vars["复仇征伐"].Name) then
    return
end
v = CastNoTarget(vars["药水"], vars["药水"] and boss.Exists or false) if v then return v end
v = CastNoTarget(vars["种族爆发"], UnitRace("player")~="血精灵" or vars["神圣能量差"] > 30) if v then return v end
return run("开饰品")
