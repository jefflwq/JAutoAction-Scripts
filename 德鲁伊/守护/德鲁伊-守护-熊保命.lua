--德鲁伊-守护-熊保命

--vars["目标是你的数量"] = combatUnits:CountTargetsByEnemies()
vars["怒气"] = player:GetPower(@怒气@)
vars["3秒总伤害"] = playerHealthWatcher:GetRecentDamagePercent(3)
UpdateReduce("player")
local v
v = CastNoTarget(#化身：乌索克的守护者#, talent["化身：乌索克的守护者"] and IsDying(playerHealthPercent, vars["3秒总伤害"], vars["当前减伤"], 0.3)) if v then return v end
v = CastNoTarget(#生存本能#, not player.Buff:Has("生存本能") and IsDying(playerHealthPercent, vars["3秒总伤害"], vars["当前减伤"], 0.35, 0.14)) if v then return v end
v = CastNoTarget(#树皮术#, playerHealthPercent < 0.25 or (playerHealthPercent < 0.6 and vars["3秒总伤害"] > 0.15 and vars["当前减伤"] < 0.1)) if v then return v end
v = CastNoTarget(#鬃毛倒竖#, vars["3秒总伤害"] > 0.12 and vars["怒气"] < 70 and talent["鬃毛倒竖"]) if v then return v end
v = CastNoTarget(#狂暴回复#, playerHealthPercent < 0.6 and vars["3秒总伤害"] > 0.15 and #狂暴回复#:GetChargeInfo():IsReachedOrSoon(2, 6)) if v then return v end
v = CastNoTarget(#狂暴回复#, not player.Buff:Has("狂暴回复") and IsDying(playerHealthPercent, vars["3秒总伤害"], vars["当前减伤"], 0.35, 0.2)) if v then return v end
v = run("铁鬃") if v then return v end
v = CastNoTarget(#明月普照#, vars["3秒总伤害"] > 0.12 and playerHealthPercent < 0.5 and talent["明月普照"]) if v then return v end
v = CastNoTarget(#夺魂咆哮#, IsDying(playerHealthPercent, vars["3秒总伤害"], vars["当前减伤"], 0.15, 0.2)) if v then return v end


