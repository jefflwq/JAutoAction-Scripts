--战士-狂怒-保命

local v
v = AddRaidBuff(#战斗怒吼#) if v then return v end
if playerHealthPercent > 0.4 then
    return
end
if not InCombatLockdown() then
    return
end

vars["2秒总伤害"] = playerHealthWatcher:GetRecentDamagePercent(2)

if instance:InPVE() then
    v = CastNoTarget(#狂怒回复#, playerHealthPercent < (boss.InCombat and 0.25 or 0.35) or vars["2秒总伤害"] > 0.1) if v then return v end
    v = CastNoTarget(#集结呐喊#, playerHealthPercent < 0.25) if v then return v end
else
    v = CastNoTarget(#狂怒回复#, playerHealthPercent < 0.35 or vars["2秒总伤害"] > 0.1) if v then return v end
    v = CastNoTarget(#集结呐喊#, playerHealthPercent < 0.2) if v then return v end
end
