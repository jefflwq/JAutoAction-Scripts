--德鲁伊-野性-猎豹输出
local v
v = run("血腥爪击起手") if v then return v end

vars["潜行中"] = player.Buff:Has("潜行")
if vars["潜行中"] then
    if #斜掠#:HasBindingKey() then
        v = CastOnTarget(#斜掠#, UnitExists("target")) if v then return v end
    end
elseif not InCombatLockdown() then
    v = CastNoTarget(#潜行#, not #潜行#:SucceededIn(2)) if v then return v end
end



if not InCombatLockdown() then
    return
end

vars["连击点"] = player:GetPower(@连击点@)
vars["能量"] = player:GetPower(@能量@)
vars["能量差"] = player:GetPowerDeficit(@能量@)

vars["掠食者的迅捷剩余时间"] = player.Buff:Get("掠食者的迅捷"):GetTimeLeft()
v = run("血腥爪击") if v then return v end
vars["目标预计死亡时间"] = target:TimeToDie()
v = run("割裂") if v then return v end

v = CastNoTarget(#野性狂乱#, vars["连击点"] < 2 and talent["野性狂乱"]) if v then return v end
v = run("爆发技能") if v then return v end
v = CastNoTarget(#猛虎之怒#, targetRange < 6 and vars["能量差"] > 55) if v then return v end

v = player.Buff:Get("野蛮咆哮"):GetTimeLeft()
v = CastNoTarget(#野蛮咆哮#, talent["野蛮咆哮"] and (v < gcdmax or (vars["连击点"] > 2 and v < gcdmax * 2))) if v then return v end

vars["附近敌人数量"] = player:UpdateNearbyInfo(8).EnemyCount
if vars["附近敌人数量"] < 3 then
    if vars["连击点"] == 5 then
        v = CastNoTarget(#原始之怒#, talent["原始之怒"] and vars["11码敌人数量"] > 2) if v then return v end
        v = CastOnTarget(#凶猛撕咬#) if v then return v end
    else
        v = CastOnTarget(#斜掠#, vars["血腥爪击时间"] > 0 or NeedRefill(target.Debuff:Get("斜掠"):GetTimeLeft(), vars["补斜掠时间"], vars["目标预计死亡时间"])) if v then return v end
        v = CastOnTarget(#撕碎#, (player.Buff:Has("节能施法") and vars["能量"] < 80) or (not talent["月之灵"] and vars["能量"] > 60)) if v then return v end
        if talent["月之灵"] then
            v = CastOnTarget(#月火术#, vars["能量"] > 55 and (targetRange < 15 or vars["目标需要攻击"])) if v then return v end
            --if SwitchIsOn("切换敌方") then
            --    return TabForDebuff("月火术", 6.5)
            --end
        end
    end
else
    if vars["连击点"] == 5 then
        v = CastNoTarget(#原始之怒#, talent["原始之怒"]) if v then return v end
        v = CastOnTarget(#凶猛撕咬#) if v then return v end
    else
        v = CastNoTarget(#痛击#, NeedRefill(target.Debuff:Get("痛击"):GetTimeLeft(), 3, vars["目标预计死亡时间"])) if v then return v end
        v = CastNoTarget(vars["横扫挥砍"], vars["附近敌人数量"] > 3) if v then return v end
        v = CastOnTarget(#斜掠#, NeedRefill(target.Debuff:Get("斜掠"):GetTimeLeft(), vars["补斜掠时间"], vars["目标预计死亡时间"], 12)) if v then return v end
        v = CastNoTarget(vars["横扫挥砍"]) if v then return v end
    end
end
v = CastOnTarget(#野性冲锋#, talent["野性冲锋"] and SwitchIsOn("野性冲锋")) if v then return v end
