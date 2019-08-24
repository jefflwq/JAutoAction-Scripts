--牧师-暗影-补鼠痛触

if not UnitExists("mouseover") or not SwitchIsOn("鼠标痛触") or UnitIsUnit("target", "mouseover") then
    return
end
local v
local tm = mouseover:TimeToDie()
if NeedRefill(mouseover.Debuff:Get("暗言术：痛"):GetTimeLeft(), 4.5, tm, 8) then
    v = CastOnCursor(#_黑暗虚空#, talent["黑暗虚空"]) if v then return v end
    if not talent["黑暗虚空"] or not #黑暗虚空#:CastedIn(2.5) then
        if talent["哀难"] then
            if player:IsMoving() then
                return CastOnCursor(#_暗言术：痛#)
            else
                v = CastOnCursor(#_吸血鬼之触#) if v and v:IsSafeToCast() then return v end
            end
        else
            return CastOnCursor(#_暗言术：痛#)
        end
    end
end
if NeedRefill(mouseover.Debuff:Get("吸血鬼之触"):GetTimeLeft(), 6, tm, 8) then
    v = CastOnCursor(#_吸血鬼之触#) if v and v:IsSafeToCast() then return v end
end
