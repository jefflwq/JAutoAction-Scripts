--德鲁伊-平衡-新月
if not talent["新月"] then
    return
end
if not #新月#:CanBeUsedOnTarget(0.2, vars["星辰漂流"]) then
    return
end
local name = #新月#.Name
if name == "新月" then
    if vars["星界能量差值"] < 10 then
        return
    end
elseif name == "半月" then
    if vars["星界能量差值"] < 20 then
        return
    end
elseif name == "满月" then
    if vars["星界能量差值"] < 40 then
        return
    end
end
return #新月#
