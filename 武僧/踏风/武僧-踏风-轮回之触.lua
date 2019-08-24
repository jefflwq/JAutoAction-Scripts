--武僧-踏风-轮回之触
vars["轮回之触冷却"] = #轮回之触#:GetCooldown()
if vars["轮回之触冷却"] > (3 * gcdmax) then
    return
end
--不是玩家，或者快死了，或者血量比较少
if not UnitIsPlayer("target") and (target:TimeToDie() < 10 or targetHealth < playerHealthMax*1.2) then
    return
end
local v
if vars["轮回之触冷却"] < gcdmax then
    if talent["屏气凝神"] and (#屏气凝神#:GetCooldown() <= 1 or player.Buff:Has("屏气凝神")) then
        return #轮回之触#
    end
    if vars["真气差"] >= 3 and (not #白虎拳#:CanBeUsedOnTarget(2)) then
        return run("攒真气", vars["真气最大值"] - 1)
    end
    if #怒雷破#:GetCooldown() <= 4 then
        return #轮回之触#
    end
    return 0
end
v = 0
if vars["真气差"] > 1 then
    v = run("攒真气", vars["真气最大值"] - 1) if v and v ~= 0 then return v end
end
if v == 0 and (vars["能量回满时间"] > vars["轮回之触冷却"] or vars["真气差"] > 2) then
    return 0
end



