--牧师-戒律-暗影盟约
if not talent["暗影盟约"] then
    return
end
--if vars["治疗对象血量"] > 0.95 then
--    return 
--end
if not #暗影盟约#:CanBeUsedOnTarget(0.2) then
    return 
end

if vars["治疗对象"] == player or UnitIsUnit("target", "player") then
    local percent, countAll, countLower, min, max = GetFriendsHealth(30, 0.9)
    if (percent < 0.9 and countAll > 2) or countLower > 2 then
        if #我_暗影盟约#:HasBindingKey() then
            return #我_暗影盟约#
        end
    end
elseif vars["治疗对象"] == target then
    if instance:InPVE() then
        local percent, countAll, countLower, min, max = GetFriendsHealth(40, 0.9)
        if (percent < 0.9 and countAll > 2) or countLower > 2 then
            return #暗影盟约#
        end
    else
        local percent, countAll, countLower, min, max = GetUnitNearbyFriendsHealth("target", 30, 0.9)
        if (percent < 0.9 and countAll > 2) or countLower > 2 then
            return #真言术：耀#
        end
    end
end

