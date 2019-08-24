--术士-毁灭-爆发技能
if not run("需要开爆发吗") then
    return
end
local v
if SwitchIsOn("地狱火") then
    v = run("地狱火") if v then return v end
    if vars["地狱火时间"] == 0 or vars["地狱火时间"] > 21 and talent["统御魔典"] then
        return
    end
    if talent["黑暗灵魂：动荡"] then
        v = CastNoTarget(#黑暗灵魂：动荡#) if v then return v end
        if not player.Buff:Has("黑暗灵魂：动荡") then
            return
        end
    end
end
if vars["浩劫"] then
    v = CastNoTarget(vars["药水"], vars["药水"] and boss.Exists or false) if v then return v end
    v = CastNoTarget(vars["种族爆发"], UnitRace("player")~="血精灵") if v then return v end
    return run("开饰品")
end
