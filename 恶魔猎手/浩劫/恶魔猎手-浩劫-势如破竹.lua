--恶魔猎手-浩劫-势如破竹
if not talent["势如破竹"] then
    return
end
if not #邪能冲撞#:GetChargeInfo():IsReachedOrSoon() then
    return
end
local rg = targetRange
if rg > 7 and rg < 20 then
    target:IsInFrontOfPlayer(20, 20)
    if not vars["目标在面前"] then
        return
    end
    return #邪能冲撞#
end
