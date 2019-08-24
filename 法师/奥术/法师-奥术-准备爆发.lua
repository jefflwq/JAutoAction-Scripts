--法师-奥术-准备爆发
if #奥术强化#:SucceededIn(3) then
    return true
end
if vars["奥术强化时间"] > 0 then
    return
end

vars["奥术强化冷却"] = #奥术强化#:GetCooldown()
if vars["奥术强化冷却"] > (6 + gcdmax * 4) then
    return
end
v = CastOnTarget(#奥术飞弹#, vars["节能施法时间"] > 0) if v then return v end
if vars["奥术强化冷却"] < gcdmax + 0.2 then
    if vars["奥术充能"] == 4 then
        if vars["法力百分比"] > (talent["超强能量"] and 0.22 or 0.35) then
            --print("准备爆发", true) 
            return true
        end
        vars["唤醒冷却"] = #唤醒#:GetCooldown()
        v = CastNoTarget(#唤醒#, vars["唤醒冷却"] < gcdmax) if v then return v end
        return CastOnTarget(#奥术冲击#, vars["唤醒冷却"] < 6, true)
    else
        return CastOnTarget(#奥术冲击#, true, true)
    end
end

v = CastNoTarget(#唤醒#, vars["奥术强化冷却"] < 6 and vars["奥术充能"] == 4 and vars["法力百分比"] < 0.3) if v then return v end
return CastOnTarget(#奥术冲击#, true, true)
