--武僧-踏风-爆发技能
if not run("需要开爆发吗") then
    return
end
local v
if targetRange < 5 then
    v = CastOnTarget(#白虎下凡#) if v then return v end
    v = CastNoTarget(#屏气凝神#, talent["屏气凝神"]) if v then return v end
    v = CastNoTarget(#风火雷电#, not talent["屏气凝神"] and not player.Buff:Has("风火雷电") and #怒雷破#:GetCooldown() < 10) if v then return v end
end
if not player.Buff:Has("屏气凝神") and not player.Buff:Has("风火雷电") then
    return
end
v = CastNoTarget(vars["药水"], vars["药水"] and boss.Exists or false) if v then return v end
v = CastNoTarget(vars["种族爆发"], UnitRace("player")~="血精灵" or (player:GetPowerDeficit(@真气@) > 3 and vars["能量回满时间"]>=gcd)) if v then return v end
return run("开饰品")