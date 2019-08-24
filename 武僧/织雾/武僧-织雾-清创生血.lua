--武僧-织雾-清创生血
if not #清创生血#:CanBeUsedOnTarget(0.2) then
    return
end
if not (vars["治疗对象"].Debuff:HasAny(1, "Magic")
or vars["治疗对象"].Debuff:HasAny(1, "Disease")
or vars["治疗对象"].Debuff:HasAny(1, "Poison")) then
    return
end
if vars["治疗对象"] == target then
    return #清创生血#
elseif vars["治疗对象"] == player then
    if #我_清创生血#:HasBindingKey() then
        return #我_清创生血#
    end
end