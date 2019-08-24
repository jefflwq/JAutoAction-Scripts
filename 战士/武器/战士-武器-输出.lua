--战士-武器-输出
vars["怒气"] = player:GetPower(@怒气@)
vars["怒气差"] = player:GetPowerDeficit(@怒气@)

local v
v = CastOnTarget(vars["胜利追击"], targetRange < 5 and TernaryOperator(instance:InPVE(), playerHealthPercent < (boss.InCombat and 0.4 or 0.6), playerHealthPercent < 0.8)) if v then return v end
v = CastOnTarget(#断筋#, targetRange < 5 and UnitIsPlayer("target") and not target.Debuff:Has("断筋")) if v then return v end

vars["附近敌人数量"] = player:UpdateNearbyInfo().EnemyCount
if vars["附近敌人数量"] < 3 then
    v = CastOnTarget(#撕裂#, talent["撕裂"] and targetHealthPercent >= vars["斩杀血量"] and not target.Debuff:Has("巨人打击") and NeedRefill(target.Debuff:Get("撕裂"):GetTimeLeft(), 3.5, target:TimeToDie())) if v then return v end
    v = CastNoTarget(#横扫攻击#, vars["附近敌人数量"] > 1 and (talent["破坏者"] or not SwitchIsOn("输出爆发") or #剑刃风暴#:GetCooldown() > 12)) if v then return v end
    v = CastOnTarget(#碎颅打击#, vars["怒气"] <= 60 and talent["碎颅打击"] and (not talent["致命平静"] or (not player.Buff:Has("致命平静") and not #致命平静#:ReadyIn(3)))) if v then return v end
    v = CastNoTarget(#致命平静#, talent["致命平静"] and vars["剑刃破坏"]:GetCooldown() > 6 and vars["巨人灭战"]:GetCooldown() < 2) if v then return v end
    v = run("爆发技能") if v then return v end
    v = CastNoTarget(#我_破坏者#, targetRange < 5 and talent["破坏者"] and SwitchIsOn("输出爆发") and vars["巨人灭战"]:GetCooldown() < 2 and not player.Buff:Has("致命平静")) if v then return v end
    v = CastOnTarget(vars["巨人灭战"], targetRange < 5 and not player.Buff:Has("巨人打击")) if v then return v end
    v = CastOnTarget(#斩杀#, player.Buff:Has("猝死")) if v then return v end
    v = run("剑刃风暴") if v then return v end
    v = CastOnTarget(#猛击#, player.Buff:Has("碾压突袭")) if v then return v end
    v = CastOnTarget(#压制#, vars["怒气差"] > 28 and targetHealthPercent >= vars["斩杀血量"] and player.Buff:Get("压制").Count < 2) if v then return v end
    v = CastOnTarget(#致死打击#, targetHealthPercent >= vars["斩杀血量"] or (targetHealthPercent < vars["斩杀血量"] and player.Buff:Get("压制").Count > 1 and target.Debuff:Has("巨人打击") and (talent["悍勇无畏"] or (azerite:IsEnabled("刽子手的精准") and player.Buff:Get("刽子手的精准").Count == 2)))) if v then return v end
    v = CastOnTarget(#压制#, targetHealthPercent < vars["斩杀血量"]) if v then return v end
    v = CastOnTarget(#斩杀#) if v then return v end
    v = CastOnTarget(vars["旋风猛击"], targetRange < 5 and (vars["怒气"] >= 60 or not azerite:IsEnabled("力量的考验") or player.Buff:Has("致命平静") or player.Buff:Has("巨人打击"))) if v then return v end
else --AOE
    if vars["附近敌人数量"] > 5 then
        if instance:InPVE() then
            if targetHealth > playerHealthMax * 5 and not boss.Exists then
                v = run("爆发技能", true) if v then return v end
            end
        else
            if targetHealth > playerHealthMax then
                v = run("爆发技能", true) if v then return v end
            end
        end
    end
    v = CastNoTarget(#灭战者#, targetRange < 5 and talent["灭战者"]) if v then return v end
    v = run("剑刃风暴") if v then return v end
    v = CastNoTarget(#我_破坏者#, targetRange < 5 and talent["破坏者"] and SwitchIsOn("输出爆发") and vars["巨人灭战"]:GetCooldown() < 2 and not player.Buff:Has("致命平静")) if v then return v end
    v = AoeFront(#顺劈斩#, 6, 180, 6, 0.65, 3, 3) if v then return v end
    v = CastNoTarget(#横扫攻击#, talent["破坏者"] or #剑刃风暴#:GetCooldown() > 12) if v then return v end
    v = CastNoTarget(#旋风斩#, vars["附近敌人数量"] > (player.Buff:Has("横扫攻击") and 9 or 4)) if v then return v end
    v = CastOnTarget(#斩杀#) if v then return v end
    v = CastOnTarget(#致死打击#, vars["附近敌人数量"] < 6 or player.Buff:Has("横扫攻击") or target.Debuff:Has("巨人打击") or player.Buff:Has("压制") or player.Buff:Has("刽子手的精准")) if v then return v end
    v = CastOnTarget(#碎颅打击#, vars["怒气"] <= 60 and talent["碎颅打击"] and not player.Buff:Has("致命平静") and not (talent["致命平静"] and #致命平静#:ReadyIn(3))) if v then return v end
    v = CastOnTarget(#压制#, vars["怒气"] < 73 and player.Buff:Get("压制").Count < 2) if v then return v end
    v = CastNoTarget(#旋风斩#) if v then return v end
    v = CastOnTarget(#猛击#, player.Buff:Has("碾压突袭")) if v then return v end
end
v = CastOnTarget(vars["胜利追击"], targetRange < 5) if v then return v end
v = CastOnTarget(#冲锋#, targetRange < 25 and targetRange > 8 and SwitchIsOn("冲锋")) if v then return v end


