--恶魔猎手-复仇-保命
--vars["灵魂残片数"] = player.Buff:Get("灵魂残片").Count
vars["痛苦差值"] = player:GetPowerDeficit(@痛苦@)
--UpdateReduce("player")
--vars["3秒总伤害"] = playerHealthWatcher:GetRecentDamagePercent(3)
vars["3秒物理伤害"] = playerHealthWatcher:GetRecentPhysicalDamagePercent(3)
--vars["3秒魔法伤害"] = playerHealthWatcher:GetRecentMagicDamagePercent(3)

local v
v = CastNoTarget(#恶魔尖刺#, playerHealthPercent < 0.9 and vars["3秒物理伤害"] > 0.08 and run("没有保命Buff") and #恶魔尖刺#:GetChargeInfo():IsReachedOrSoon()) if v then return v end
v = CastNoTarget(#灵魂壁障#, playerHealthPercent < 0.8 and vars["3秒总伤害"] > 0.1 and talent["灵魂壁障"] and run("没有保命Buff")) if v then return v end
v = CastOnTarget(#烈火烙印#, vars["目标需要攻击"] and vars["痛苦差值"] >= 30 and ((not boss.InCombat and target:TimeToDie() > 6) or (boss.IsTarget and (playerHealthPercent < 0.2 or (playerHealthPercent < 0.4 and run("没有保命Buff")))))) if v then return v end

v = AoeFront(#邪能毁灭#, 20, 90, 20, 0.65, nil, nil, playerHealthPercent < 0.5 and talent["邪能毁灭"]) if v then return v end

v = CastNoTarget(#恶魔尖刺#, (vars["3秒物理伤害"] > 0.15 or (playerHealthPercent < 0.5 and vars["3秒物理伤害"] > 0.1)) and run("没有保命Buff")) if v then return v end

vars["3秒总伤害"] = playerHealthWatcher:GetRecentDamagePercent(3)
v = CastNoTarget(#恶魔变形#, playerHealthPercent < 0.35 and vars["3秒总伤害"] > 0.1 and not player.Buff:Has("恶魔变形") and (playerHealthPercent < 0.15 or (playerHealthPercent < 0.25 and run("没有保命Buff")))) if v then return v end
