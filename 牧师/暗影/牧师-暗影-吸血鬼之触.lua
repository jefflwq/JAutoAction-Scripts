--牧师-暗影-吸血鬼之触
if NeedRefill(target.Debuff:Get("吸血鬼之触"):GetTimeLeft(), 6, target:TimeToDie(), 8) then
    v = CastOnTarget(#_吸血鬼之触#) if v and v:IsSafeToCast() then return v end
else
    if SwitchIsOn("切敌痛触") then
        if TabForDebuff("吸血鬼之触", 6) then
            return CastMacro(&切换敌方&)
        end
    end
end
