--潜行者-奇袭-诡诈
local v
if not talent["诡诈"] then
    return
end
if vars["诡诈消失"] and vars["诡诈消失"] > GetTime() and player.Buff:Has("消失") then
    return #锁喉#
end
vars["诡诈锁喉目标"] = UnitGUID("target")
local gztm = player.Buff:Get("诡诈"):GetTimeLeft()
if gztm > (0.5 * gcdmax) and gztm < (gcdmax * 1.3) then
    vars["诡诈锁喉预计结束时间"] = GetTime() + ((target.Debuff:Get("锁喉"):GetTimeLeft() > 18 * 0.3) and 18 * 1.3 or 18)
    return #锁喉#
elseif gztm > (1.3 * gcdmax) and gztm < (gcdmax * 1.7) then
    return 0
end
if gztm > 0 then
    return
end
if not #消失#:ReadyIn(0.2) then
    return
end
if run("诡诈锁喉中") then
    return
end
if not player.Buff:Has("宿敌") then
    if #宿敌#:GetCooldown() < 70 then
        return
    end
end
vars["诡诈消失"] = GetTime() + 1
return #消失#
