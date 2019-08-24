--潜行者-奇袭-输出

local v
vars["潜行中"] = player.Buff:Has("潜行")
if vars["潜行中"] then
    v = CastOnTarget(#搜索#, not boss.IsTarget and not #搜索#:SucceededOnTarget(100) and not #搜索#:FailedOnTarget(2)) if v then return v end
    v = CastOnTarget(#偷袭#, UnitIsPlayer("target")) if v then return v end
    v = CastOnTarget(#锁喉#) if v then return v end
elseif not InCombatLockdown() then
    v = CastNoTarget(#潜行#, not #潜行#:SucceededIn(2)) if v then return v end
end
if not InCombatLockdown() then
    return
end

vars["连击点差"] = player:GetPowerDeficit(@连击点@)
vars["连击点"] = player:GetPower(@连击点@)
vars["能量回满时间"] = player:GetPowerTimeToMax(@能量@)
vars["能量差"] = player:GetPowerDeficit(@能量@)

vars["锁喉时间"] = target.Debuff:Get("锁喉"):GetTimeLeft()

v = run("诡诈") if v then return v end
v = CastOnTarget(#死亡标记#, vars["连击点差"] > 3 and talent["死亡标记"]) if v then return v end

v = run("爆发技能") if v then return v end
v = CastOnTarget(#锁喉#, vars["连击点差"] > 0 and not run("诡诈锁喉中") and vars["锁喉时间"] < (18 * (vars["连击点差"] == 1 and 0.35 or 0.28))) if v then return v end
--终结技
vars["割裂时间"] = target.Debuff:Get("割裂"):GetTimeLeft()
vars["深谋远虑时间"] = player.Buff:Get("深谋远虑"):GetTimeLeft()
v = CastOnTarget(#割裂#, vars["割裂时间"] < gcdmax * 2 or (vars["割裂时间"] < ((vars["连击点"] + 1) * 4 * 0.28) and (not talent["深谋远虑"] or vars["深谋远虑时间"] < 0.2))) if v then return v end
v = CastOnTarget(#毒伤#, vars["连击点差"] < 2 and (target.Debuff:Get("毒伤"):GetTimeLeft() < gcdmax or (vars["连击点差"] and vars["深谋远虑时间"] < gcdmax) or (not talent["深谋远虑"] or vars["深谋远虑时间"] < 0.2))) if v then return v end

vars["附近敌人数量"] = player:UpdateNearbyInfo(10).EnemyCount
v = CastOnTarget(#猩红风暴#, vars["连击点差"] == 0 and talent["猩红风暴"] and vars["附近敌人数量"] > 2) if v then return v end
--连击点
v = CastOnTarget(#刀扇#, vars["连击点差"] > 0 and vars["附近敌人数量"] > 2) if v then return v end
v = CastOnTarget(#淬毒之刃#, vars["连击点差"] > 0 and talent["淬毒之刃"] and player:GetPowerTimeToValue(@能量@, 60) < gcdmax) if v then return v end
v = CastOnTarget(#抽血#, talent["抽血"] and vars["锁喉时间"] > 0 and vars["割裂时间"] > 0) if v then return v end
v = CastOnTarget(#侧袭#, vars["连击点差"] > 0 and talent["侧袭"] and player:GetPowerTimeToValue(@能量@, 75) < gcdmax) if v then return v end
v = CastOnTarget(#毁伤#, vars["连击点差"] > 1 and player:GetPowerTimeToValue(@能量@, 90) < gcdmax) if v then return v end


v = CastOnTarget(#暗影步#, targetRange > 8 and SwitchIsOn("暗影步")) if v then return v end

