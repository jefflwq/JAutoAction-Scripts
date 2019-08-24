--法师-冰霜-冰枪术
if not InCombatLockdown() then
    return
end
if not #冰枪术#:CanBeUsedOnTarget(0.2) then
    return
end
if GetLastSpell(1).Name == "冰风暴" then
    return #冰枪术#
end

run("取得冰枪伤害")
if vars["是3倍冰枪术伤害"] then
    --if vars["冰霜新星时间"] > (vars["冰枪术飞行时间"] + vars["寒冰箭每码飞行时间"] * targetRange + #寒冰箭#:GetCurrentCastingTime() + 0.3) then
    --    return
    --end
    return #冰枪术#
end
local casting = player:GetCastingSpell()
if casting then
    if casting == "寒冰箭" then
        if vars["冰枪术伤害"] >= (targetHealth - #寒冰箭#:GetDamage()) then
            return #冰枪术#
        end
    elseif casting == "黑冰箭" then
        if vars["冰枪术伤害"] >= (targetHealth - #黑冰箭#:GetDamage()) then
            return #冰枪术#
        end
    elseif casting == "冰川尖刺" then
        if vars["冰枪术伤害"] >= (targetHealth - vars["冰川尖刺伤害"]) then
            return #冰枪术#
        end
    end
end
