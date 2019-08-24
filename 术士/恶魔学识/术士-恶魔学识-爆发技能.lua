--术士-恶魔学识-爆发技能
vars["攒灵魂碎片"] = false
if not run("需要开爆发吗") then
    vars["下次召唤恶魔暴君时间"] = 999
    return
end
local v
vars["下次召唤恶魔暴君时间"] = #召唤恶魔暴君#:GetCooldown()

if talent["虚空传送门"] then
    v = run("虚空传送门") if v then return v end
else
    v = CastOnTarget(#魔典：恶魔卫士#, vars["下次召唤恶魔暴君时间"] < 10 and talent["魔典：恶魔卫士"]) if v then return v end
    v = run("召唤恶魔暴君") if v then return v end
end
local timeLeft = GetSummonedUnitTimeLeft(#召唤恶魔暴君#, 15)
if timeLeft > 0 then
    v = CastNoTarget(vars["药水"], vars["药水"] and boss.Exists or false) if v then return v end
    v = CastNoTarget(vars["种族爆发"], UnitRace("player")~="血精灵") if v then return v end
    return run("开饰品")
end
