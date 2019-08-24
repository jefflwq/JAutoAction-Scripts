--圣骑士-全专精-清洁术
if not #清洁术#:CanBeUsedOnTarget(0.2) then
    return
end
if not (vars["治疗对象"].Debuff:HasAny(1, "Magic") or vars["治疗对象"].Debuff:HasAny(1, "Disease")
 or vars["治疗对象"].Debuff:HasAny(1, "Poison")) then
    return
end
if vars["治疗对象"] == target then
    return #清洁术#
elseif vars["治疗对象"] == player then
    if #我_清洁术#:HasBindingKey() then
        return #我_清洁术#
    end
end