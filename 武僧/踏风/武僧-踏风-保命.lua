--武僧-踏风-保命
if not InCombatLockdown() then
    return CastNoTarget(#我_活血术#, playerHealthPercent < 0.75)
end                       
local v
v = CastNoTarget(#我_活血术#, playerHealthPercent < 0.9 and #我_活血术#:GetCurrentCastingTime() == 0) if v then return v end

if not player.Buff:Has("业报之触") then
    UpdateReduce("player")
    vars["3秒魔法伤害"] = playerHealthWatcher:GetRecentMagicDamagePercent(3)
    v = CastNoTarget(#散魔功#, talent["散魔功"] and (IsDying(playerHealthPercent, vars["3秒魔法伤害"], vars["当前魔法减伤"], 0.5) or (playerHealthPercent < 0.5 and player.Debuff:HasAny(3, "Magic")))) if v then return v end
    vars["3秒总伤害"] = playerHealthWatcher:GetRecentDamagePercent(3)
    v = CastNoTarget(#躯不坏#, talent["躯不坏"] and IsDying(playerHealthPercent, vars["3秒总伤害"], vars["当前减伤"], 0.3)) if v then return v end
end

v = AoeAround(#扫堂腿#, 8, 10, 0.74, nil, nil, playerHealthPercent < 0.25) if v then return v end
