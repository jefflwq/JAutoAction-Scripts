--法师-火焰-保命
local v
v = AddSelfShield(#烈焰护体#, playerHealthPercent < 0.3 or not (player.Buff:Has("冰冷血脉") or player.Buff:Has("能量符文"))) if v then return v end
vars["3秒总伤害"] = playerHealthWatcher:GetRecentDamagePercent(3)
UpdateReduce("player")
v = CastNoTarget(#寒冰屏障#, not player.Buff:Has("寒冰护体") and not player.Debuff:Has("低温") and IsDying(playerHealthPercent, vars["3秒总伤害"], vars["当前减伤"], 0.3)) if v then return v end
v = AddRaidBuff(#奥术智慧#) if v then return v end
