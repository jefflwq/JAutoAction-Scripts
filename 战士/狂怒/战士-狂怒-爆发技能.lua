--战士-狂怒-爆发技能
local force = ...
if not force and not run("需要开爆发吗") then
    return
end
local v = CastNoTarget(#鲁莽#, (targetRange < 5 or #冲锋#:CanBeUsedOnTarget(0.2)) and (not talent["狂暴挥砍"] or (vars["狂暴挥砍层数"] == 3 and vars["狂暴挥砍时间"] > 3 * gcdmax))) if v then return v end
if not player.Buff:Has("鲁莽") then
    return
end

v = CastNoTarget(vars["药水"], vars["药水"] and boss.Exists or false) if v then return v end
v = CastNoTarget(vars["种族爆发"], UnitRace("player")~="血精灵" or vars["怒气差"] > 25) if v then return v end
return run("开饰品")