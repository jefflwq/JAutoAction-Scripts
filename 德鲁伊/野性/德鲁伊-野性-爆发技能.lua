--德鲁伊-野性-爆发技能
if not run("需要开爆发吗") then
    return
end
local v
v = run("狂暴化身") if v then return v end
if not player.Buff:Has(vars["狂暴化身"].Name) or not vars["狂暴化身"]:SucceededIn(5) then
   return
end
v = CastNoTarget(vars["药水"], vars["药水"] and boss.Exists or false) if v then return v end
v = CastNoTarget(vars["种族爆发"]) if v then return v end
return run("开饰品")
