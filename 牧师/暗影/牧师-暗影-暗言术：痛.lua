--牧师-暗影-暗言术：痛
if not #暗言术：痛#:CanBeUsedOnTarget(0.2) then
    return
end

if not NeedRefill(target.Debuff:Get("暗言术：痛"):GetTimeLeft(), 4.5, target:TimeToDie(), 8) then
    if SwitchIsOn("切敌痛触") then
        if TabForDebuff("暗言术：痛", 4.5) then
            return CastMacro(&切换敌方&)
        end
    end
    return
end
--local v = CastOnTarget(#黑暗虚空#, vars["狂乱值"] < 70 and talent["黑暗虚空"]) if v then return v end
local v = CastOnTarget(#黑暗虚空#, talent["黑暗虚空"]) if v then return v end
if not talent["黑暗虚空"] or not #黑暗虚空#:CastedIn(2.5) then
    if talent["哀难"] then
        if player:IsMoving() then
            return CastOnTarget(#暗言术：痛#)
        else
            v = CastOnTarget(#_吸血鬼之触#) if v and v:IsSafeToCast() then return v end
        end
    else
        return CastOnTarget(#暗言术：痛#)
    end
end
