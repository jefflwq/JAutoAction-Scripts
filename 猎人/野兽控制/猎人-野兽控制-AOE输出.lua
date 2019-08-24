--猎人-野兽控制-AOE输出
local v
v = run("宠物攻击") if v then return v end
v = run("误导宠物") if v then return v end
local tm = pet.Buff:Get("狂暴"):GetTimeLeft()
v = CastOnTarget(#倒刺射击#, tm > 0 and tm < 1.2 * gcdmax) if v then return v end
vars["目标数量"] = target:UpdateNearbyInfo(12).EnemyCount + 1
if player.Buff:Has("野性守护") and vars["目标数量"] > 2 then
    v = run("爆发技能") if v then return v end
    v = CastOnTarget(#狂野怒火#, InCombatLockdown() and SwitchIsOn("狂野怒火")) if v then return v end
    v = CastOnTarget(#多重射击#, vars["野兽顺劈时间"] < gcdmax) if v then return v end
    v = CastOnTarget(#杀戮命令#, UnitName("target") ~= "爆炸物") if v then return v end
    v = CastOnTarget(#倒刺射击#, #倒刺射击#:GetChargeInfo().Charges == 2) if v then return v end
    v = AoeFront(#弹幕射击#, 40, 90, 40, 0.65, 3, 1, talent["弹幕射击"], true) if v then return v end
    if azerite:IsEnabled("快速填装") then
        v = CastOnTarget(#多重射击#, #杀戮命令#:GetCooldown() > 0.5 and player:GetPower(@集中@) > 70) if v then return v end
        return
    end
end
v = CastOnTarget(#夺命黑鸦#, talent["夺命黑鸦"] and target:IsBigGuy(nil, 1, 10)) if v then return v end
v = run("爆发技能") if v then return v end
v = CastOnTarget(#狂野怒火#, InCombatLockdown() and SwitchIsOn("狂野怒火") and (vars["目标数量"] > 2 or targetHealth > playerHealthMax * 0.8 or UnitIsPlayer("target"))) if v then return v end
vars["野兽顺劈时间"] = pet.Buff:Get("野兽顺劈"):GetTimeLeft()
v = CastOnTarget(#多重射击#, vars["目标数量"] > 2 and vars["野兽顺劈时间"] < gcdmax) if v then return v end
v = CastOnTarget(#奇美拉射击#, vars["目标数量"] > 1 and talent["奇美拉射击"]) if v then return v end
v = CastOnTarget(#杀戮命令#, UnitName("target") ~= "爆炸物") if v then return v end
v = CastOnTarget(#喷毒眼镜蛇#, talent["喷毒眼镜蛇"] and target:IsBigGuy()) if v then return v end
v = CastOnTarget(#奇美拉射击#, talent["奇美拉射击"]) if v then return v end
v = CastOnTarget(#凶暴野兽#, talent["凶暴野兽"]) if v then return v end
v = CastOnTarget(#倒刺射击#, #倒刺射击#:GetChargeInfo().Charges == 2) if v then return v end
v = AoeFront(#弹幕射击#, 40, 90, 40, 0.65, 3, 1, talent["弹幕射击"], true) if v then return v end
v = CastOnTarget(#多重射击#, vars["目标数量"] > 1 and vars["野兽顺劈时间"] < gcdmax) if v then return v end
v = CastOnTarget(#多重射击#, vars["目标数量"] > 2 and azerite:IsEnabled("快速填装")) if v then return v end
vars["杀戮命令冷却"] = #杀戮命令#:GetCooldown()
vars["集中差值"] = player:GetPowerDeficit(@集中@)
v = CastOnTarget(#眼镜蛇射击#, vars["杀戮命令冷却"] > 0.5 and (vars["集中差值"] < 20 or (vars["杀戮命令冷却"] > 1.5 and vars["集中差值"] < 40))) if v then return v end
