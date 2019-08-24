--法师-奥术-爆发中
if player.Buff:Has("能量符文") then
    vars["能量符文时间"] = #能量符文#:GetCooldown()
else
    vars["能量符文时间"] = 0
end
local v
if talent["时间紊乱"] then
    if vars["奥术强化时间"] == 0 and vars["能量符文时间"] == 0 then
        return
    end
    if vars["奥术强化时间"] > 6 and talent["能量符文"] and vars["能量符文时间"] == 0 and vars["法力百分比"] > 0.35 and run("需要开爆发吗", true) then
        v = run("额外能量符文", #奥术强化#) if v then return v end
    end
elseif vars["奥术强化时间"] == 0 then
    if not talent["能量符文"] then
        return
    end
    if vars["能量符文时间"] == 0 and vars["奥术充能"] == 4 and vars["法力百分比"] > 0.5 and run("需要开爆发吗", true) then
        return run("额外能量符文", #奥术强化#)
    end
end
if vars["奥术强化时间"] == 0 and vars["能量符文时间"] == 0 then
    return
end

v = CastNoTarget(#气定神闲#, vars["奥术强化时间"] > 1.4 * gcdmax and vars["奥术强化时间"] < 2.5 * gcdmax) if v then return v end

local castTm = #奥术冲击#:GetCurrentCastingTime() / 1000
v = CastOnTarget(#奥术冲击#, castTm < vars["奥术强化时间"] or castTm < vars["能量符文时间"], true, gcdmax * 0.3) if v then return v end
v = CastOnTarget(#奥术飞弹#, vars["节能施法时间"] > 0) if v then return v end
v = CastOnTarget(#奥术弹幕#, vars["奥术充能"] == 4 and (vars["法力不足"] or (castTm > vars["奥术强化时间"] and castTm > vars["能量符文时间"])), nil, nil) if v then return v end
return 0
