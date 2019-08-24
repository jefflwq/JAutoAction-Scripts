--圣骑士-神圣-保命
local v
--v = HealSIngle(#圣光闪现#, playerHealthPercent < 0.85 and (#圣光闪现#:GetCurrentCastingTime() == 0 or player.Buff:Has("圣盾术"))) if v then return v end
vars["3秒总伤害"] = playerHealthWatcher:GetRecentDamagePercent(3)
UpdateReduce("player")
v = CastNoTarget(#圣佑术#, IsDying(playerHealthPercent, vars["3秒总伤害"], vars["当前减伤"], 0.5)) if v then return v end
if playerHealthPercent < 0.15 or IsDying(playerHealthPercent, vars["3秒总伤害"], vars["当前减伤"], 0.2) then
    v = CastNoTarget(#圣盾术#) if v then return v end
    v = CastNoTarget(#我_圣疗术#) if v then return v end
end



