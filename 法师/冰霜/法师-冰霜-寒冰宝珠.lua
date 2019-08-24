--法师-冰霜-寒冰宝珠
if talent["冰川尖刺"] and vars["冰刺数量"] == 5 then
    return
end
if not #寒冰宝珠#:CanBeUsedOnTarget(0.2) then
    return
end
local rg = targetRange
if rg > 20 and not boss.IsTarget and not target.Debuff:Has("冰冻") then
    return
end
rg = rg + 10
if rg > 40 then
    rg = 40
end
if not target:IsInFrontOfPlayer(rg, 20) then
    return
end
local tm = target:TimeToDie()
if tm > 4 and boss.IsTarget then
    return #寒冰宝珠#
end
if not instance:InPVE() and targetHealth > playerHealthPercent * 4 then
    return #寒冰宝珠#
end
return AoeFront(#寒冰宝珠#, rg, 90, rg, 0.65, 3, 3)
--v = AoeFront(#寒冰宝珠#, 40, 20, 40, 0.65, 1, 1, not (talent["冰川尖刺"] and vars["冰刺数量"] == 5) and (targetRange < 20 or boss.IsTarget or target.Debuff:Has("冰冻"))) if v then return v end
