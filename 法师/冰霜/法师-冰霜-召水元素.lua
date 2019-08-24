--法师-冰霜-召水元素
if talent["孤寂寒冬"] then
    return
end
if not UnitExists("pet") or UnitIsDead("pet") then
    return CastNoTarget(#召唤水元素#)
elseif player:GetCastingSpell() == "召唤水元素" then
    return CastMacro(&取消施法&)
end



