--德鲁伊-全专精-旅行保命
if playerHealthPercent > 0.4 then
    return 
end
local v
v = CastNoTarget(#甘霖#, playerHealthPercent < 0.25 and talent["甘霖"]) if v then return v end

vars["3秒总伤害"] = playerHealthWatcher:GetRecentDamagePercent(3)
UpdateReduce("player")
v = CastNoTarget(#生存本能#, not player.Buff:Has("生存本能") and IsDying(playerHealthPercent, vars["3秒总伤害"], vars["当前减伤"], 0.35, 0.12)) if v then return v end
