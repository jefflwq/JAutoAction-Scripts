--武僧-踏风-攒真气
local chiWanted = ...
if vars["真气"] >= chiWanted or vars["真气差"] <= 1 then
    return
end
--v = CastOnTarget(#幻灭踢#, vars["真气差"] > 3) if v then return v end
--if vars["真气差"] < 2 then
--    if #幻灭踢#:CanBeUsedOnTarget(0.2) and vars["上一个技能"] ~= "幻灭踢") then
--        return #幻灭踢#
--    end
--    if #真气波#:CanBeUsedOnTarget(0.2) then
--        return #真气波#
--    end
--end
v = CastOnTarget(#白虎拳#, vars["真气差"] >= 3) if v then return v end
if vars["上一个技能"] ~= "猛虎掌" then
    v = CastOnTarget(#猛虎掌#) if v then return v end
else
    v = AoeFront(#真气爆裂#, 15, 90, 15, 0.6, 2, 1, talent["真气爆裂"]) if v then return v end
    v = CastOnTarget(#真气波#, talent["真气波"]) if v then return v end
    v = CastOnTarget(#猛虎掌#, vars["能量回满时间"] < 0.8 * gcdmax) if v then return v end
    return 0
end
