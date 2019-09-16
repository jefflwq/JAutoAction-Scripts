--战士-武器-爆发技能
local force = ...
if not force and not run("需要开爆发吗") then
    return
end
local v
if talent["天神下凡"] then
    v = CastNoTarget(#天神下凡#, targetRange < 5 and vars["怒气差"] > 25) if v then return v end
    if not player.Buff:Has("天神下凡") then
        return
    end
end

v = CastNoTarget(vars["药水"], vars["药水"] and boss.Exists or false) if v then return v end
v = CastNoTarget(vars["种族爆发"], UnitRace("player")~="血精灵" or vars["怒气差"] > 25) if v then return v end
return run("开饰品")