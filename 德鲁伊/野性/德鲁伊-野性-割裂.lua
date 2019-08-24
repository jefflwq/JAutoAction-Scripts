--德鲁伊-野性-割裂
vars["割裂时间"] = target.Debuff:Get("割裂"):GetTimeLeft()
vars["11码敌人数量"] = talent["原始之怒"] and player:UpdateNearbyInfo(11).EnemyCount or 0
if not #割裂#:CanBeUsedOnTarget(0.2) then
    return
end
if vars["目标预计死亡时间"] < 8 then
    return
end
if NeedRefill(vars["割裂时间"], vars["补割裂时间"], vars["目标预计死亡时间"]) then
    --print("*********补割裂*********")
    v = CastNoTarget(#原始之怒#, vars["连击点"] > 2 and talent["原始之怒"] and vars["11码敌人数量"] > 2) if v then return v end
    v = CastOnTarget(#凶猛撕咬#, vars["割裂时间"] > 0 and vars["连击点"] > 1 and talent["剑齿利刃"]) if v then return v end
    v = CastOnTarget(#割裂#, vars["连击点"] == 5 or vars["血腥爪击数量"] == 1 or (not talent["剑齿利刃"] and not talent["原始之怒"])) if v then return v end
--elseif vars["连击点"] == 5 then
--    v = CastNoTarget(#原始之怒#, talent["原始之怒"] and vars["11码敌人数量"] > 2) if v then return v end
--    v = CastOnTarget(#凶猛撕咬#, talent["剑齿利刃"]) if v then return v end
    --v = CastOnTarget(#割裂#, NeedRefill(vars["割裂时间"], vars["补割裂时间"], vars["目标预计死亡时间"])) if v then return v end
end
