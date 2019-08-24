--萨满祭司-恢复-大地之盾
if not talent["大地之盾"] then
    return
end
if vars["治疗对象"] ~= target then
    return
end
if not #大地之盾#:CanBeUsedOnTarget(0.2) then
    return
end
if UnitExists("focus") and not UnitIsUnit("target", "focus") then
    return
end
if GetFriendBuffCount("大地之盾", 40) > 0 then
    return
end
return #大地之盾#
