--德鲁伊-平衡-自然之力
if not talent["自然之力"] then
    return
end
if vars["星界能量差值"] < 20 then
    return
end
if targetHealth < playerHealth and vars["需攻击目标数"] < 3 then
    return
end
if not #自然之力#:ReadyIn(0.2) then
    return
end
if UnitExists("mouseover") and UnitAffectingCombat("mouseover") then
    if #鼠_自然之力#:HasBindingKey() then
        return #鼠_自然之力#
    end
end
return #自然之力#