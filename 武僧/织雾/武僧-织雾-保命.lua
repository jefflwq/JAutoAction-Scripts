--武僧-织雾-保命
local v
v = CastNoTarget(#金创药#, talent["金创药"] and (playerHealthPercent < 0.3 or (playerHealthPercent < 0.4 and talent["金创药"] and #金创药#:GetChargeInfo():IsReachedOrSoon(2, 5)))) if v then return v end
UpdateReduce("player")
vars["3秒魔法伤害"] = playerHealthWatcher:GetRecentMagicDamagePercent(3)
v = CastNoTarget(#散魔功#, talent["散魔功"] and (IsDying(playerHealthPercent, vars["3秒魔法伤害"], vars["当前魔法减伤"], 0.5) or (playerHealthPercent < 0.5 and player.Debuff:HasAny(3, "Magic")))) if v then return v end
vars["3秒总伤害"] = playerHealthWatcher:GetRecentDamagePercent(3)
v = CastNoTarget(#壮胆酒#, IsDying(playerHealthPercent, vars["3秒总伤害"], vars["当前减伤"], 0.3)) if v then return v end
v = CastNoTarget(#躯不坏#, talent["躯不坏"] and IsDying(playerHealthPercent, vars["3秒总伤害"], vars["当前减伤"], 0.25)) if v then return v end

