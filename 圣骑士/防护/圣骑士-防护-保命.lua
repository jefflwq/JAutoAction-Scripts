--圣骑士-防护-保命
v = CastNoTarget(#我_圣光闪现#, playerHealthPercent < 0.85 and (#圣光闪现#:GetCurrentCastingTime() == 0 or player.Buff:Has("圣盾术"))) if v then return v end
v = CastNoTarget(vars["守护者之光"], playerHealthPercent < 0.6) if v then return v end

local v
if player.Buff:Has("圣盾术") then
    return
end
vars["3秒总伤害"] = playerHealthWatcher:GetRecentDamagePercent(3)
UpdateReduce("player")
if IsDying(playerHealthPercent, vars["3秒总伤害"], vars["当前减伤"], 0.25) then
    v = CastNoTarget(#炽热防御者#) if v then return v end
    v = CastNoTarget(#远古列王守卫#, not player.Buff:Has("炽热防御者")) if v then return v end
end

if IsDying(playerHealthPercent, vars["3秒总伤害"], vars["当前减伤"], 0.15) and not player.Buff:Has("炽热防御者") then
    v = CastNoTarget(#我_圣疗术#) if v then return v end
    v = CastNoTarget(#圣盾术#) if v then return v end
end
