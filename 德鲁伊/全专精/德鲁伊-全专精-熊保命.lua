--德鲁伊-全专精-熊保命

local v


v = CastNoTarget(#生存本能#, not player.Buff:Has("生存本能") and IsDying(playerHealthPercent, vars["3秒总伤害"], vars["当前减伤"], 0.35, 0.12)) if v then return v end
v = CastNoTarget(#树皮术#, playerHealthPercent < 0.25 or (playerHealthPercent < 0.6 and vars["3秒总伤害"] > 0.15 and vars["当前减伤"] < 0.1)) if v then return v end
v = CastNoTarget(#狂暴回复#, playerHealthPercent < 0.7) if v then return v end
v = run("铁鬃") if v then return v end
v = CastNoTarget(#甘霖#, playerHealthPercent < 0.25 and talent["甘霖"]) if v then return v end
