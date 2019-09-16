--猎人-野兽控制-输出
local v
v = run("宠物攻击") if v then return v end
v = run("误导宠物") if v then return v end
local tm = pet.Buff:Get("狂暴"):GetTimeLeft()
v = CastOnTarget(#倒刺射击#, tm > 0 and tm < 1.25 * gcdmax) if v then return v end
vars["狂野怒火冷却"] = #狂野怒火#:GetCooldown()
vars["野性守护冷却"] = #野性守护#:GetCooldown()
vars["倒刺射击充能率"] = #倒刺射击#:GetChargeInfo().Fractional

v = CastOnTarget(#倒刺射击#, vars["狂野怒火冷却"] > 0 and (vars["倒刺射击充能率"] > 1.8 or SwitchIsOn("输出爆发") and azerite:IsEnabled("原始本能") and vars["野性守护冷却"]<gcdmax)) if v then return v end
v = run("爆发技能") if v then return v end

vars["目标数量"] = target:UpdateNearbyInfo(8).EnemyCount + 1
vars["野兽顺劈时间"] = pet.Buff:Get("野兽顺劈"):GetTimeLeft()

if SwitchIsOn("AOE") then
    v = CastOnTarget(#多重射击#, vars["野兽顺劈时间"] < gcdmax and vars["目标数量"] > 1) if v  then Debug("保持损劈")  Debug(vars["目标数量"])  return v end  --保持损劈
    v = AoeFront(#弹幕射击#, 40, 90, 40, 0.65, 3, 1, talent["弹幕射击"] and vars["目标数量"] > 2, true) if v then return v end
end

v = CastOnTarget(#夺命黑鸦#, talent["夺命黑鸦"] and target:IsBigGuy(nil, 1, 10) and vars["狂野怒火冷却"] > 0) if v then return v end
v = CastOnTarget(#狂野怒火#, InCombatLockdown() and SwitchIsOn("狂野怒火") and (vars["目标数量"] > 2 or targetHealth > playerHealthMax * 0.4 or UnitIsPlayer("target"))) if v then return v end
v = CastOnTarget(#奇美拉射击#, vars["目标数量"] > 1 and talent["奇美拉射击"]) if v then return v end
v = CastOnTarget(#杀戮命令#, UnitName("target") ~= "爆炸物") if v then return v end
v = CastOnTarget(#奇美拉射击#, talent["奇美拉射击"]) if v then return v end
v = CastOnTarget(#凶暴野兽#, talent["凶暴野兽"]) if v then return v end

v = CastOnTarget(#倒刺射击#, tm == 0 and (vars["倒刺射击充能率"] > 1.7 or player.Buff:Get("狂野怒火"):GetTimeLeft()>5)) if v then return v end
v = CastOnTarget(#倒刺射击#, SwitchIsOn("输出爆发") and azerite:IsEnabled("原始本能") and (tm - 1.2 * gcdmax) > vars["野性守护冷却"]) if v then return v end
v = CastOnTarget(#倒刺射击#, azerite:IsEnabled("死亡之舞") and not player.Buff:Has("死亡之舞") ) if v then return v end


if SwitchIsOn("AOE") and vars["目标数量"] > 2 and azerite:IsEnabled("快速装填") then
    v = CastOnTarget(#多重射击#) if v then return v end
    v = CastOnTarget(#倒刺射击#, vars["倒刺射击充能率"] > 1.4 and talent["兽行成群"]) if v then return v end
    return -- 这里加return 是因为多重40集中 比 眼镜蛇的35集中多
end
vars["集中值"] = player:GetPower(@集中@)
vars["集中差值"] = player:GetPowerDeficit(@集中@)
vars["集中值满的时间"] = player:GetPowerTimeToMax(@集中@)
vars["杀戮命令冷却"] = #杀戮命令#:GetCooldown()

v = CastOnTarget(#眼镜蛇射击#, (vars["杀戮命令冷却"] > 2 * gcdmax + 1 and vars["集中值"] > 65) or (vars["杀戮命令冷却"] > gcdmax+1 and vars["集中值"]>85) or (vars["杀戮命令冷却"] > 1 and vars["集中值"] > 100)) if v then return v end  --防止能量溢出
v = CastOnTarget(#倒刺射击#, vars["杀戮命令冷却"] < gcdmax and (tm > 0 and tm < 2 * gcdmax) and vars["集中值"] < 60) if v then return v end --如果打一个眼镜蛇之后 补倒刺和杀戮冲突 我选择先补倒刺
v = CastOnTarget(#眼镜蛇射击#, vars["杀戮命令冷却"] > 0.7 and (player.Buff:Has("狂野怒火") or player.Buff:Has("野性守护")) and (vars["杀戮命令冷却"] > gcdmax + 1 or vars["集中值"] > 55)) if v then return v end --在红人状态下 光速泄集中

v = CastOnTarget(#喷毒眼镜蛇#, talent["喷毒眼镜蛇"] and target:IsBigGuy()) if v then return v end
v = CastOnTarget(#倒刺射击#, vars["倒刺射击充能率"] > 1.4 and talent["兽行成群"]) if v then return v end

