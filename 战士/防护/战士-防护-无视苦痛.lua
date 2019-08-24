--战士-防护-无视苦痛
local nq = ...
if vars["怒气"] < (nq + (vars["报复：无视苦痛"] and 26 or 40)) then
    return
end
if not #无视苦痛#:ReadyIn(0.2) then
    return
end
local v = player.Buff:Get("无视苦痛").Value4
if v > 30000 then
    return
end
local tm = player.Buff["无视苦痛"]:GetTimeLeft()
if tm > 6 and v > 15000 then
    return
end
if vars["3秒物理伤害"] > 0.2 then
    return #无视苦痛#
end
if vars["3秒物理伤害"] > 0.1 and playerHealthPercent < 0.6 then
    return #无视苦痛#
end
if player.Buff:Has("盾墙") and playerHealthPercent > 0.5 then
    return
end
if player.Buff:Has("挫志怒吼") and playerHealthPercent > 0.7 then
    return
end
if player.Buff:Has("盾牌格挡") and playerHealthPercent > 0.8 then
    return
end
if tm < 6 and v < 20000 then
    if vars["3秒物理伤害"] > 0.1 then
        return #无视苦痛#
    end
    if vars["3秒物理伤害"] > 0.05 and playerHealthPercent < 0.6 then
        return #无视苦痛#
    end
end

