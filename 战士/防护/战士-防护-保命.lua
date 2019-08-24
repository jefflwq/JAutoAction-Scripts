--战士-防护-保命
local v
v = AddRaidBuff(#战斗怒吼#) if v then return v end
vars["3秒物理伤害"] = playerHealthWatcher:GetRecentPhysicalDamagePercent(3)
if playerHealthPercent > 0.9 then
    return
end
if not InCombatLockdown() then
    return
end
v = player.Buff:Get("无视苦痛").Value4
vars["怒气"] = player:GetPower(@怒气@)
if v and v < 10000 and vars["怒气"] > 50 and playerHealthPercent < 0.8 then
    v = CastNoTarget(#无视苦痛#) if v then return v end
end

UpdateReduce("player")
v = CastNoTarget(#盾牌格挡#, SwitchIsOn("盾牌格挡") and playerHealthPercent < 0.9 and vars["3秒物理伤害"] > 0.08 and #盾牌格挡#:GetChargeInfo():IsReachedOrSoon() and not player.Buff:Has("盾牌格挡") and (vars["当前减伤"] < 0.15 or playerHealthPercent < 0.2)) if v then return v end
v = CastNoTarget(#挫志怒吼#, SwitchIsOn("挫志怒吼") and playerHealthPercent < 0.65 and vars["3秒物理伤害"] > 0.08 and not player.Buff:Has("盾牌格挡") and (vars["当前减伤"] < 0.15 or playerHealthPercent < 0.2)) if v then return v end
v = CastOnTarget(vars["胜利追击"], targetRange < 5 and TernaryOperator(instance:InPVE(), playerHealthPercent < (boss.InCombat and 0.4 or 0.6), playerHealthPercent < 0.8)) if v then return v end
v = CastNoTarget(#盾牌格挡#, SwitchIsOn("盾牌格挡") and playerHealthPercent < 0.9 and (vars["3秒物理伤害"] > 0.12 or (vars["3秒物理伤害"] > 0.1 and playerHealthPercent < 0.5)) and not player.Buff:Has("盾牌格挡") and (vars["当前减伤"] < 0.15 or playerHealthPercent < 0.2)) if v then return v end




vars["3秒总伤害"] = playerHealthWatcher:GetRecentDamagePercent(3)
v = CastNoTarget(#盾墙#, SwitchIsOn("盾墙") and playerHealthPercent < 0.2 or IsDying(playerHealthPercent, vars["3秒总伤害"], vars["当前减伤"], 0.35)) if v then return v end
v = CastNoTarget(#破釜沉舟#, SwitchIsOn("破釜沉舟") and playerHealthPercent < 0.12 or (playerHealthPercent < 0.2 and not (player.Buff:Has("盾墙") or player.Buff:Has("挫志怒吼") or player.Buff:Has("集结呐喊")))) if v then return v end
v = CastNoTarget(#集结呐喊#, SwitchIsOn("集结呐喊") and playerHealthPercent < 0.12 or (playerHealthPercent < 0.2 and not (player.Buff:Has("盾墙") or player.Buff:Has("挫志怒吼") or player.Buff:Has("破釜沉舟")))) if v then return v end

