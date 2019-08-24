--德鲁伊-守护-熊输出
local v
--v = run("爆发技能") if v then return v end
vars["怒气"] = player:GetPower(@怒气@)
v = CastOnTarget(#粉碎#, talent["粉碎"] and player.Buff:Get("粉碎"):GetTimeLeft() < 3) if v then return v end

v = run("铁鬃") if v then return v end

vars["8码目标数"] = player:UpdateNearbyInfo(8).EnemyCount
if vars["8码目标数"] > 0 then
    v = CastNoTarget(#痛击#) if v then return v end
    v = CastOnTarget(#裂伤#) if v then return v end
    v = CastOnTarget(#月火术#, (targetRange < 15 or vars["目标需要攻击"]) and not target.Debuff:Has("月火术")) if v then return v end
    v = CastOnTarget(#重殴#, vars["8码目标数"] < 4 and vars["怒气"] > 90 and playerHealthPercent > 0.7) if v then return v end
    v = CastNoTarget(#横扫#) if v then return v end
end
v = CastOnTarget(#月火术#, (targetRange < 15 or vars["目标需要攻击"]) and not target.Debuff:Has("月火术")) if v then return v end
v = CastOnTarget(#野性冲锋#, talent["野性冲锋"] and SwitchIsOn("野性冲锋")) if v then return v end
v = CastOnTarget(#月火术#, targetRange < 15 or vars["目标需要攻击"]) if v then return v end
