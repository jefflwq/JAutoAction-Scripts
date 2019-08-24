--术士-痛苦-爆发技能
--print(run("需要开爆发吗"), vars["种族爆发"].Name, vars["种族爆发"].BindingKey, UnitRace("player")~="血精灵")
if not run("需要开爆发吗") then
    return
end
local v
--v = run("黑暗灵魂：哀难") if v then return v end
--v = run("召唤黑眼") if v then return v end
if totems:Update("黑眼") == 0 then
    return
end
v = CastNoTarget(vars["药水"], vars["药水"] and boss.Exists or false) if v then return v end
v = CastNoTarget(vars["种族爆发"], UnitRace("player")~="血精灵") if v then return v end
return run("开饰品")
