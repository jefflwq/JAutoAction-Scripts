--法师-全专精-爆发技能
if not run("需要开爆发吗") then
    return
end
local v
v = run("准备爆发") if v ~= true then return v end
if talent["能量符文"] and not player.Buff:Has("能量符文") and (player:IsMoving() or (not #能量符文#:ReadyIn(gcdmax * 0.9) and #能量符文#:CastedIn(2))) then return end
v = CastOnTarget(#镜像#, talent["镜像"]) if v then return v end
v = CastNoTarget(#能量符文#, not player.Buff:Has("能量符文"), true, gcdmax * 0.9) if v then return v end
local action = ...
--print(action.Name, gcdmax + 0.2, action:GetCooldown(), action:GetCooldown() < gcdmax + 0.2)
v = CastNoTarget(action, true, true, gcdmax * 0.7) if v then return v end --...is 主要爆发技能
--print("222222", v)
v = CastNoTarget(vars["药水"], vars["药水"] and boss.Exists or false) if v then return v end
v = CastNoTarget(vars["种族爆发"], UnitRace("player")~="血精灵") if v then return v end
return run("开饰品")