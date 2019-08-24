--法师-冰霜-寒冰箭斩杀
if #寒冰箭#:GetDamage() > targetHealth and #寒冰箭#:CanBeUsedOnTarget(0.2, vars["浮冰"]) then
    return #寒冰箭#
end
