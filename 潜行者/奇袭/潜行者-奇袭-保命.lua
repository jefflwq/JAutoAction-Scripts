--潜行者-奇袭-保命
local v
v = CastNoTarget(#猩红之瓶#, playerHealthPercent < 0.8 and not InCombatLockdown()) if v then return v end
v = CastNoTarget(#消失#, playerHealthPercent < 0.05 and (not talent["装死"] or (not player.Buff:Has("装死") and player.Debuff:Has("装死")))) if v then return v end

v = CastNoTarget(#闪避#, playerHealthPercent < 0.05 and (not talent["装死"] or (not player.Buff:Has("装死") and player.Debuff:Has("装死")))) if v then return v end

if playerHealthPercent < 0.4 or not talent["飘忽不定"] or not player.Buff:Has("佯攻") then
    v = CastNoTarget(#闪避#, playerHealthPercent < 0.7 and playerHealthWatcher:GetRecentPhysicalDamagePercent(2) > 0.15) if v then return v end
    v = CastNoTarget(#暗影斗篷#, playerHealthPercent < 0.7 and playerHealthWatcher:GetRecentMagicDamagePercent(2) > 0.15) if v then return v end
end

vars["最近伤害"] = playerHealthWatcher:GetRecentDamagePercent(2)
v = CastNoTarget(#佯攻#, not player.Buff:Has("佯攻") and TernaryOpr(talent["飘忽不定"], vars["最近伤害"] > 0.15, vars["最近伤害"] > 0.1)) if v then return v end
v = CastNoTarget(#猩红之瓶#, not player.Buff:Has("猩红之瓶") and ((boss.TargetingYouCount > 0 and playerHealthPercent < 0.75) or (vars["目标是你的数量"] > 2 and playerHealthPercent < 0.5) or playerHealthPercent < 0.3)) if v then return v end
v = CastNoTarget(#消失#, playerHealthPercent < 0.1 and (not talent["装死"] or (not player.Buff:Has("装死") and player.Debuff:Has("装死")))) if v then return v end
