--圣骑士-神圣-神圣棱镜
if not talent["神圣棱镜"] then
    return
end
if vars["40码平均血量"] > 0.95 then
    return
end
if vars["治疗对象血量"] > 0.9 and UnitIsPlayer(vars["治疗对象"].UnitId) then
    return 
end
if not #神圣棱镜#:CanBeUsedOnTarget(0.2, false, vars["治疗对象"].UnitId) then
    return 
end
if vars["治疗对象"] == player or UnitIsUnit("target", "player") then
    if player:UpdateNearbyInfo(15).EnemyCount < 3 then
        return 
    end
    if #我_神圣棱镜#:HasBindingKey() then
        return #我_神圣棱镜#
    end
elseif vars["治疗对象"] == target then
    return #神圣棱镜#
end



