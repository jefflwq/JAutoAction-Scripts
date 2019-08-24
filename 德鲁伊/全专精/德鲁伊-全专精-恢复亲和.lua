--德鲁伊-全专精-恢复亲和
if not talent["恢复亲和"] then
    return
end
local v
v = CastOnTarget(#迅捷治愈#, targetHealthPercent < 0.5) if v then return v end
v = HealAroundTarget(#_野性成长#, 30, 50, 0.9, 3, targetHealthPercent < 0.95) if v then return v end
v = CastOnTarget(#回春术#, targetHealthPercent < 0.95 and target.Buff:Get("回春术"):GetTimeLeft() < 4.4) if v then return v end
