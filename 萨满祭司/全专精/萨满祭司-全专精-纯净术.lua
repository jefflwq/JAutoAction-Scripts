--萨满祭司-全专精-纯净术
if not #净化灵魂#:CanBeUsedOnTarget(0.2) then
    return
end
if not (vars["治疗对象"].Debuff:HasAny(1, "Magic") or vars["治疗对象"].Debuff:HasAny(1, "Curse")) then
    return
end
if vars["治疗对象"] == target then
    return #净化灵魂#
elseif vars["治疗对象"] == player then
    if #我_净化灵魂#:HasBindingKey() then
        return #我_净化灵魂#
    end
end