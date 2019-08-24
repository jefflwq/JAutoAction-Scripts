--战士-狂怒-输出
vars["怒气"] = player:GetPower(@怒气@)
vars["怒气差"] = player:GetPowerDeficit(@怒气@)
vars["激怒时间"] = player.Buff:Get("激怒"):GetTimeLeft()


local v
if talent["狂暴挥砍"] then
    vars["狂暴挥砍时间"] = player.Buff:Get("狂暴挥砍"):GetTimeLeft()
    vars["狂暴挥砍层数"] = player.Buff["狂暴挥砍"].Count
    v = CastNoTarget(#狂暴挥砍#, targetRange < 5 and vars["狂暴挥砍层数"] == 3 and vars["狂暴挥砍时间"] < gcdmax + 0.5) if v then return v end
end
v = CastOnTarget(vars["胜利追击"], targetRange < 5 and TernaryOperator(instance:InPVE(), playerHealthPercent < (boss.InCombat and 0.4 or 0.6), playerHealthPercent < 0.8)) if v then return v end

vars["附近敌人数量"] = player:UpdateNearbyInfo().EnemyCount
v = CastNoTarget(#旋风斩#, vars["附近敌人数量"] > 1 and not player.Buff:Has("旋风斩")) if v then return v end
v = CastNoTarget(#狂暴挥砍#, talent["狂暴挥砍"] and (vars["狂暴挥砍层数"] < 3 or vars["狂暴挥砍时间"] < gcdmax + 0.5)) if v then return v end
v = run("爆发技能") if v then return v end
v = CastOnTarget(#冲锋#, targetRange < 25 and targetRange > 8 and player.Buff:Has("鲁莽")) if v then return v end
v = CastOnTarget(#破城者#, talent["破城者"] and (player.Buff:Has("鲁莽") or #鲁莽#:GetCooldown() > 25)) if v then return v end
v = CastOnTarget(#暴怒#, vars["怒气"] > 90 or vars["激怒时间"] < 1) if v then return v end
v = CastOnTarget(#斩杀#) if v then return v end


v = run("剑刃风暴") if v then return v end
v = AoeAround(#巨龙怒吼#, 12, 15, 0.65, 3, 1, vars["怒气差"] > 10 and targetRange < 8 and vars["激怒时间"] > 0 and talent["巨龙怒吼"]) if v then return v end
v = CastOnTarget(#嗜血#, vars["激怒时间"] == 0 and (vars["附近敌人数量"] < 8 or playerHealthPercent < 0.5)) if v then return v end
v = CastOnTarget(#怒击#, vars["激怒时间"] > 0 and #怒击#:GetChargeInfo():IsReachedOrSoon()) if v then return v end
v = CastOnTarget(#嗜血#, vars["激怒时间"] > 0 and (vars["附近敌人数量"] < 8 or playerHealthPercent < 0.5)) if v then return v end
v = CastOnTarget(#怒击#, vars["怒气"] < (talent["暴乱狂战士"] and 90 or 80)) if v then return v end
v = CastNoTarget(#狂暴挥砍#, vars["附近敌人数量"] == 1 and talent["狂暴挥砍"] and (vars["狂暴挥砍层数"] < 3 or vars["狂暴挥砍时间"] < gcdmax + 0.5)) if v then return v end
v = CastNoTarget(#旋风斩#, vars["附近敌人数量"] > 1) if v then return v end

v = CastOnTarget(vars["胜利追击"], targetRange < 5) if v then return v end
v = CastOnTarget(#冲锋#, targetRange < 25 and targetRange > 8 and SwitchIsOn("冲锋")) if v then return v end
