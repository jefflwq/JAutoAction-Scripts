--法师-冰霜-冰风暴
if #冰风暴#:GetCurrentCastingTime() > 0 then
    return
end
if not #冰风暴#:CanBeUsedOnTarget(0.2) then
    return
end
--vars["冰冷智慧时间"] = player.Buff:Get("冰冷智慧"):GetTimeLeft()
if vars["冰冷智慧时间"] == 0 then
    return
end
--if spellName ~= "黑冰箭" and GetLastSpell(1).Name ~= "黑冰箭" then
--    return
--end
if talent["冰川尖刺"] then
    if vars["冰冷智慧时间"] < vars["冰川尖刺施法时间"] + 0.4 then
        return #冰风暴#
    end
    if vars["冰刺数量"] < 4 then
        return #冰风暴#
    end
    if #冰风暴#:GetDamage() * 1.5 > targetHealth then
        return #冰风暴#
    end
    if target:TimeToDie() < 3 then
        return #冰风暴#
    end
else
    if vars["冰冷智慧时间"] < gcdmax * 1.2 then
        return #冰风暴#
    end
    if player.Buff:Has("寒冰指") and #冰枪术#:CanBeUsedOnTarget(0.2) then
        return #冰枪术#
    end
    return #冰风暴#
end


