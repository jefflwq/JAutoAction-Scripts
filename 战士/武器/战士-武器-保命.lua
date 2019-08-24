--战士-武器-保命
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
    v = CastNoTarget(#剑在人在#, SwitchIsOn("剑在人在") and playerHealthPercent < (boss.InCombat and 0.25 or 0.35) or vars["2秒总伤害"] > 0.1) if v then return v end
    v = CastNoTarget(#集结呐喊#, SwitchIsOn("集结呐喊") and playerHealthPercent < 0.25) if v then return v end
    v = CastNoTarget(#防御姿态#, SwitchIsOn("消失") and playerHealthPercent < 0.15) if v then return v end
else
    v = CastNoTarget(#剑在人在#, SwitchIsOn("剑在人在") and playerHealthPercent < 0.35 or vars["2秒总伤害"] > 0.1) if v then return v end
    v = CastNoTarget(#集结呐喊#, SwitchIsOn("集结呐喊") and playerHealthPercent < 0.2) if v then return v end
    v = CastNoTarget(#防御姿态#, SwitchIsOn("防御姿态") and playerHealthPercent < 0.15) if v then return v end
end
							
