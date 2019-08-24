--法师-奥术-奥术宝珠
if not talent["奥术宝珠"] then
    return
end

if player:GetPower(@奥术充能@) > 2 then
    return
end

local rg = targetRange
if rg > 20 and not boss.IsTarget then
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
    return #奥术宝珠#
end
if not instance:InPVE() and targetHealth > playerHealthPercent * 4 then
    return #奥术宝珠#
end
return AoeFront(#奥术宝珠#, rg, 90, rg, 0.65, 3, 3)


