--圣骑士-神圣-神圣震击
if vars["治疗对象血量"] > 0.9 or (vars["治疗对象血量"] > 0.85 and not player:IsMoving()) then
    return 
end
if not #神圣震击#:CanBeUsedOnTarget(0.2, false, vars["治疗对象"].UnitId) then
    return 
end

if vars["治疗对象"] == target then
    return #神圣震击#
elseif vars["治疗对象"] == player then
    if #我_神圣震击#:HasBindingKey() then
        return #我_神圣震击#
    end
end
