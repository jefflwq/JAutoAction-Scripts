--猎人-射击-输出
local v
v = run("宠物攻击") if v then return v end
v = run("误导宠物") if v then return v end
vars["目标死亡时间"] = target:TimeToDie()
v = CastOnTarget(#猎人印记#, talent["猎人印记"] and vars["目标死亡时间"] > 10 and not target.Debuff:Has("猎人印记") and GetEnemyDebuffCount("猎人印记") == 0) if v then return v end
vars["瞄准射击快满"] = #瞄准射击#:GetChargeInfo():IsReachedOrSoon(3)
v = CastOnTarget(#瞄准射击#, vars["瞄准射击快满"] and not InCombatLockdown() and not #瞄准射击#:IsCasting()) if v then return v end
vars["目标数量"] = target:UpdateNearbyInfo(12).EnemyCount + 1
v = CastOnTarget(#奥术射击#, vars["目标数量"] == 1 and #奥术射击#:GetDamage() > targetHealth ) if v then return v end

v = CastOnTarget(#爆炸射击#, vars["目标数量"] > 2 and vars["目标死亡时间"] > 6 and talent["爆炸射击"]) if v then return v end
v = CastOnTarget(#毒蛇钉刺#, talent["毒蛇钉刺"] and NeedRefill(target.Debuff:Get("毒蛇钉刺"):GetTimeLeft(), #毒蛇钉刺#:GetDuration() * 0.28, vars["目标死亡时间"], 6)) if v then return v end
v = CastOnTarget(#夺命黑鸦#, talent["夺命黑鸦"] and target:IsBigGuy(nil, 1, 10)) if v then return v end
v = CastOnTarget(#二连发#, talent["二连发"] and vars["目标死亡时间"] > 10 or vars["目标数量"] > 2) if v then return v end
vars["技巧射击"] = player.Buff:Has("技巧射击")
v = CastOnTarget(#多重射击#, vars["目标数量"] > 2 and not vars["技巧射击"]) if v then return v end
vars["集中差值"] = player:GetPowerDeficit(@集中@)
v = run("爆发技能") if v then return v end
if vars["技巧射击"] and vars["目标数量"] > 1 then
    v = CastOnTarget(#急速射击#, true, true) if v then return v end
    v = CastOnTarget(#瞄准射击#, not #瞄准射击#:IsCasting()) if v then return v end
end
v = CastOnTarget(#急速射击#, player.Buff:Has("百发百中"), true) if v then return v end
if player.Buff:Has("弹无虚发") or player.Buff:Has("狙击高手") then
    v = CastOnTarget(#多重射击#, vars["目标数量"] > 2) if v then return v end
    v = CastOnTarget(#奥术射击#) if v then return v end
end
v = CastOnTarget(#急速射击#, vars["目标数量"] < 3 and vars["目标死亡时间"] > 4, true) if v then return v end
v = CastOnTarget(#瞄准射击#, (vars["瞄准射击快满"] and not #瞄准射击#:IsCasting()) or player.Buff:Has("荷枪实弹") or player.Buff:Has("百发百中")) if v then return v end

v = AoeFront(#穿刺射击#, 40, 90, 40, 0.65, 3, 1, talent["穿刺射击"]) if v then return v end
v = AoeFront(#弹幕射击#, 40, 90, 40, 0.65, 3, 1, talent["弹幕射击"], true) if v then return v end



if vars["集中差值"] < 25 then
    if vars["目标数量"] > 2 then
        v = CastOnTarget(#多重射击#) if v then return v end
    else
        v = CastOnTarget(#奥术射击#) if v then return v end
    end
end
if boss.LivingCount == 1 and boss.IsTarget and vars["目标死亡时间"] < ((player:GetPower(@集中@) / 15 + 1) * gcdmax) then
    v = CastOnTarget(#奥术射击#) if v then return v end
end                    
if vars["目标数量"] == 1 and not instance:InPVE() and #奥术射击#:GetDamage() * (player:GetPower(@集中@) / 15 - 1) > targetHealth then
    v = CastOnTarget(#奥术射击#) if v then return v end
end                    
v = CastOnTarget(#稳固射击#, true, true) if v then return v end
