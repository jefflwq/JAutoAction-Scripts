--战士-防护-输出
vars["怒气"] = player:GetPower(@怒气@)
vars["怒气差"] = player:GetPowerDeficit(@怒气@)

local v
v = CastNoTarget(#法术反射#, SwitchIsOn("法术反射") and target:IsCastingHarmful(true, gcdmax + 0.5) or target:IsChannelingHarmful(true, gcdmax + 0.5)) if v then return v end

v = run("爆发技能") if v then return v end
v = AoeAround(#雷霆一击#, 8, 12, 0.65, 3, 1, vars["怒气差"] >= 10 and targetRange < 5 and talent["无坚不摧之力"] and player.Buff:Has("天神下凡")) if v then return v end
v = CastOnTarget(#盾牌猛击#, vars["怒气差"] >= 20) if v then return v end
v = CastNoTarget(#我_破坏者#, SwitchIsOn("破坏者") and targetRange < 5 and talent["破坏者"] and (boss.IsTarget or (not boss.Exists and player:UpdateNearbyInfo().EnemyCount > 2))) if v then return v end
v = AoeAround(#巨龙怒吼#, 5, 10, 0.65, 3, 1, vars["怒气差"] >= 20 and targetRange < 10 and talent["巨龙怒吼"]) if v then return v end
v = AoeAround(#雷霆一击#, 8, 12, 0.65, 3, 1, vars["怒气差"] >= 10 and targetRange < 5) if v then return v end
v = AoeFront(#复仇#, 5, 180, 10, 0.65, 3, 1, targetRange < 5 and player.Buff:Has("复仇！")) if v then return v end
v = run("复仇痛苦") if v then return v end
v = CastOnTarget(#毁灭打击#, not talent["灭绝者"]) if v then return v end
v = CastOnTarget(#拦截#, targetRange > 8 and targetRange < 25 and SwitchIsOn("拦截")) if v then return v end

