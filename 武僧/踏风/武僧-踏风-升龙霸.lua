--武僧-踏风-升龙霸
if not talent["升龙霸"] then
    return
end
v = AoeAround(#升龙霸#, 8, 10) if v then return v end
v = CastOnTarget(#旭日东升踢#, vars["真气"] > 2 and #升龙霸#:GetCooldown() < gcdmax * 1.3 and #怒雷破#:GetCooldown() > gcdmax * 1.7) if v then return v end

