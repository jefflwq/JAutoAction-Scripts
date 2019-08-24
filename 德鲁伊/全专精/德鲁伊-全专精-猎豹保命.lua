--德鲁伊-全专精-猎豹保命
local v
v = CastNoTarget(#生存本能#, not player.Buff:Has("生存本能") and IsDying(playerHealthPercent, vars["3秒总伤害"], vars["当前减伤"], 0.35, 0.12)) if v then return v end
v = CastNoTarget(#甘霖#, playerHealthPercent < 0.25 and talent["甘霖"]) if v then return v end

--if playerHealthPercent > 0.2 then
--    return
--end
--local recentDamage = playerHealthWatcher:GetRecentDamagePercent(3)
--if recentDamage > 0.12 or playerHealthPercent < 0.1 then
--    return #熊形态#
--end
