--术士-毁灭-输出
--vars["灵魂碎片"] = player:GetPower(@灵魂碎片@)
vars["灵魂碎片裂片"] = player:GetPower(@灵魂碎片@, true)
vars["目标死亡时间"] = target:TimeToDie()
vars["地狱火时间"] = totems:Update("地狱火爪牙")
vars["浩劫"] = GetEnemyDebuffCount("浩劫") > 0
vars["爆燃层数"] = player.Buff:Get("爆燃").Count
local v
v = run("宠物攻击") if v then return v end
v = run("献祭大灾变") if v then return v end
v = AoeAroundTarget(#恶魔之火#, 8, 10, 0.65, 3, 1, talent["恶魔之火"] and not vars["浩劫"]) if v then return v end

v = run("爆发技能") if v then return v end
v = run("浩劫") if v then return v end
v = AoeAroundTarget(#恶魔之火#, 8, 10, 0.65, 3, 1, talent["恶魔之火"]) if v then return v end

vars["目标数量"] = target:UpdateNearbyInfo(10).EnemyCount + 1
v = AoeAtCursor(#~火焰之雨#, 8, 10, 0.65, 5, 5) if v then return v end
if vars["爆燃层数"] > 1 or (vars["爆燃层数"] == 1 and not #混乱之箭#:IsCasting()) then
    if vars["准备浩劫"] then
        v = CastOnTarget(#混乱之箭#, vars["浩劫冷却"] > 6 and vars["灵魂碎片裂片"] >= 40 and not #混乱之箭#:IsCasting()) if v then return v end
    else
        v = CastOnTarget(#混乱之箭#) if v then return v end
    end
end
if #燃烧#:GetChargeInfo():IsReachedOrSoon() and (not vars["准备浩劫"] or vars["浩劫冷却"] > (5 + gcdmax + 0.2) or vars["浩劫冷却"] < (gcdmax * 2)) and (vars["浩劫冷却"] > (20.2 + gcdmax) or not vars["浩劫"]) then
    if talent["爆裂之炎"] then
        v = CastOnTarget(#燃烧#, vars["爆燃层数"] < 3 and vars["灵魂碎片裂片"] >= 35 or (vars["爆燃层数"] == 0 and not vars["准备浩劫"])) if v then return v end
    else
        v = CastOnTarget(#燃烧#, vars["爆燃层数"] < 2 and vars["灵魂碎片裂片"] >= 15) if v then return v end
    end
end
v = CastOnTarget(#灵魂之火#, talent["灵魂之火"]) if v then return v end
v = CastOnTarget(#暗影灼烧#, talent["暗影灼烧"]) if v then return v end
--v = CastOnTarget(#燃烧#, vars["爆燃层数"] < 2) if v then return v end
v = CastOnTarget(#烧尽#, vars["爆燃层数"] == 0 or talent["爆裂之炎"]) if v then return v end





