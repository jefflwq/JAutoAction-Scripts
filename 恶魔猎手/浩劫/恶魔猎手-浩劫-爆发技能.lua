--恶魔猎手-浩劫-爆发技能
if not run("需要开爆发吗") then
    return
end
local v = CastNoTarget(#我_恶魔变形#, targetRange < 5 and ((not vars["混沌变身"]) or (#眼棱#:GetCooldown() > 1 and #刃舞#:GetCooldown() > 1))) if v then return v end
if not #~恶魔变形#:SucceededIn(5) then
    return
end

v = CastNoTarget(vars["药水"], vars["药水"] and boss.Exists or false) if v then return v end
v = CastNoTarget(vars["种族爆发"], UnitRace("player")~="血精灵" or vars["恶魔之怒差值"] > 30) if v then return v end
return run("开饰品")