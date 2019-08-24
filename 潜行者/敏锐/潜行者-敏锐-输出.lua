--潜行者-敏锐-输出
local v
vars["潜行中"] = player.Buff:Has("潜行")
if vars["潜行中"] then
    v = CastOnTarget(#搜索#, not boss.IsTarget and not #搜索#:SucceededOnTarget(100) and not #搜索#:FailedOnTarget(2)) if v then return v end
    v = CastOnTarget(#偷袭#, UnitIsPlayer("target")) if v then return v end
    v = CastOnTarget(#暗影打击#) if v then return v end
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

vars["附近敌人数量"] = player:UpdateNearbyInfo(10).EnemyCount
v = run("暗影之舞") if v then return v end
v = CastOnTarget(#死亡标记#, vars["连击点差"] > 3 and talent["死亡标记"]) if v then return v end
v = CastOnTarget(#影分身#, vars["连击点差"] == 0 and talent["影分身"]) if v then return v end
v = CastNoTarget(#夜刃#, NeedRefill(target.Debuff:Get("夜刃"):GetTimeLeft(), (vars["连击点"] + 1) * 1.8, target:TimeToDie(), 5)) if v then return v end
v = CastOnTarget(#刺骨#, vars["连击点差"] == 0 or vars["附近敌人数量"] > 2 and vars["连击点"] > 2 and player.Buff:Get("袖剑连击").Count > 2) if v then return v end
v = CastNoTarget(#袖剑旋风#, vars["连击点差"] > 0 and vars["附近敌人数量"] > 2 and talent["袖剑旋风"]) if v then return v end
v = run("袖剑风暴") if v then return v end
v = CastOnTarget(#暗影打击#) if v then return v end
v = CastOnTarget(vars["幽暗背刺"], vars["连击点差"] > 0 and vars["附近敌人数量"] < 3 and player:GetPowerTimeToValue(@能量@, 70) < gcdmax) if v then return v end
v = CastOnTarget(#暗影步#, targetRange > 8 and SwitchIsOn("暗影步")) if v then return v end



