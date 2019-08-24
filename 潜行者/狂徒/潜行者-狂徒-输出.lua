--潜行者-狂徒-输出
local v
vars["潜行中"] = player.Buff:Has("潜行")
vars["附近敌人数量"] = player:UpdateNearbyInfo(vars["攻击距离"]).EnemyCount
--vars["面前敌人数量"] = player:UpdateFrontInfo(vars["攻击距离"], 30).EnemyCount
--print(vars["附近敌人数量"], vars["面前敌人数量"])
vars["连击点"] = player:GetPower(@连击点@)
vars["连击点差"] = player:GetPowerDeficit(@连击点@)
if vars["潜行中"] then
    v = CastOnTarget(#搜索#, not boss.IsTarget and not #搜索#:SucceededOnTarget(100) and not #搜索#:FailedOnTarget(2)) if v then return v end
    v = CastOnTarget(#死亡标记#, vars["连击点差"] > 3 and talent["死亡标记"]) if v then return v end
    v = CastNoTarget(#剑刃乱舞#, SwitchIsOn("剑刃乱舞") and not player.Buff:Has("剑刃乱舞") and vars["附近敌人数量"] > 1 and targetRange < vars["攻击距离"]) if v then return v end
    v = CastOnTarget(#偷袭#, UnitIsPlayer("target")) if v then return v end
    v = CastOnTarget(#伏击#) if v then return v end
elseif not InCombatLockdown() then
    v = CastNoTarget(#潜行#, not #潜行#:SucceededIn(2)) if v then return v end
end
if not InCombatLockdown() then
    return
end

v = CastOnTarget(#毒刃#, UnitIsPlayer("target")) if v then return v end

v = CastOnTarget(#死亡标记#, vars["连击点差"] > 3 and talent["死亡标记"]) if v then return v end
v = CastNoTarget(#剑刃乱舞#, SwitchIsOn("剑刃乱舞") and not player.Buff:Has("剑刃乱舞") and vars["附近敌人数量"] > 1) if v then return v end


vars["能量差"] = player:GetPowerDeficit(@能量@)
vars["能量回满时间"] = player:GetPowerTimeToMax(@能量@)
v = CastOnTarget(#刀锋冲刺#, vars["能量回满时间"] > gcdmax and vars["附近敌人数量"] > 2 and talent["刀锋冲刺"]) if v then return v end
v = run("爆发技能") if v then return v end
if (vars["袖里乾坤"] > 0) then
    v = CastOnTarget(#正中眉心#, vars["连击点"] > 3) if v then return v end
    if vars["连击点差"] == 0 and vars["能量回满时间"] > #正中眉心#:GetCooldown() then
        return 0
    end
else
    v = CastOnTarget(#正中眉心#, vars["神射手"] > 1 or (vars["连击点差"] == 0 and (vars["神射手"] > 0 or player.Buff:Has("残忍精准")))) if v then return v end
end
if talent["切割"] then
    v = CastNoTarget(#切割#, targetRange < 5 and NeedRefill(player.Buff:Get("切割"):GetTimeLeft(), (vars["连击点"] + 1) * 1.8, target:TimeToDie(), 5)) if v then return v end
else
    v = run("命运骨骰") if v then return v end
end
v = CastOnTarget(#刀锋冲刺#, SwitchIsOn("刀锋冲刺") and vars["能量回满时间"] > gcdmax and talent["刀锋冲刺"]) if v then return v end
v = CastOnTarget(#斩击#, vars["连击点差"] == 0) if v then return v end
v = CastOnTarget(#鬼魅攻击#, vars["连击点差"] > 0 and talent["鬼魅攻击"]) if v then return v end
v = CastOnTarget(#手枪射击#, vars["连击点差"] >= (talent["快速拔枪"] and 2 or 1) and player.Buff:Has("可乘之机")) if v then return v end
v = CastOnTarget(#影袭#, vars["连击点差"] > 0 and player:GetPowerTimeToValue(@能量@, 80) < gcdmax) if v then return v end
