--牧师-戒律-保命
local v
v = AddSelfShield(#我_真言术：盾#, not player:HasDebuff("虚弱灵魂")) if v then return v end
vars["3秒总伤害"] = playerHealthWatcher:GetRecentDamagePercent(3)
v = CastNoTarget(#绝望祷言#, playerHealthPercent < 0.2 or (playerHealthPercent < 0.3 and playerHealthWatcher:GetRecentDamagePercent(3) > 0.2)) if v then return v end
UpdateReduce("player")
v = CastNoTarget(#我_痛苦压制#, playerHealthPercent < 0.2 or IsDying(playerHealthPercent, vars["3秒总伤害"], vars["当前减伤"], 0.3)) if v then return v end
v = AddRaidBuff(#我_真言术：韧#) if v then return v end
