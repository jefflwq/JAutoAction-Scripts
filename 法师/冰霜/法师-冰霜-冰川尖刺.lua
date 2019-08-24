--法师-冰霜-冰川尖刺
if not talent["冰川尖刺"] then
    return
end
if vars["冰刺数量"] < 5 then
    return
end
if targetRange > 40 or (IsPlayerMoving() and vars["浮冰"]) then
    return
end
if instance:InPVE() then
    if boss.IsTarget then
        if target:TimeToDie() < vars["冰川尖刺施法时间"] then
            return
        end
    else
        if target:TimeToDie() < vars["冰川尖刺施法时间"] * 1.5 then
            return
        end
    end
end

if talent["黑冰箭"] and vars["冰冷智慧时间"] == 0 then
    if #黑冰箭#:ReadyIn(2 * gcdmax) then
        return run("额外能量符文", #冰冷血脉#)
    end
end
local v = run("额外能量符文", #冰冷血脉#) if v then return v end
return #冰川尖刺#
