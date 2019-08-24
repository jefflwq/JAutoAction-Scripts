--法师-全专精-额外能量符文
if not talent["能量符文"] then return end
if player:IsMoving() then return end
if player.Buff:Has("能量符文") then return end
if #能量符文#:CastedIn(1.5) or #能量符文#:SucceededIn(11) then return end
local chargeInfo = #能量符文#:GetChargeInfo()
if chargeInfo.Charges == 0 then return end
if boss.MaxDyingTime < 12 then
    return #能量符文#
end
local action, condition = ...
if condition == false then return end
local actionCooldown = action:GetCooldown() --...is 主要爆发技能
if chargeInfo.Charges == 2 then
    if actionCooldown > (gcdmax + 10) then
        return #能量符文#
    end
    if not SwitchIsOn("输出爆发") then
        return #能量符文#
    end
elseif chargeInfo.Cooldown < actionCooldown then
    return #能量符文#
end
