--术士-恶魔学识-虚空传送门
if not talent["虚空传送门"] then
    return
end
local cd = #虚空传送门#:GetCooldown()
if #召唤恶魔暴君#:GetCooldown() - cd > 13 then--等恶魔暴君
    return
end
if cd < 0.5 and vars["灵魂碎片"] == 5 then
    return #虚空传送门#
end
local v
if cd >= 0 and cd < 10 then
    --准备,攒片
    vars["攒灵魂碎片"] = true
    vars["下次召唤恶魔暴君时间"] = cd + 15
    v = CastOnTarget(#恶魔之箭#, vars["灵魂碎片"] <= 3 and vars["恶魔之核数量"] > 0) if v then return v end
    v = CastOnTarget(#灵魂打击#, vars["灵魂碎片"] <= 4 and talent["灵魂打击"]) if v then return v end
    v = CastOnTarget(#暗影箭#, vars["灵魂碎片"] <= 4) if v then return v end
    if cd < gcdmax then
        return 0
    end
    return
end
local timeLeft = GetSummonedUnitTimeLeft(#虚空传送门#, 15)
if timeLeft > 0 then
    vars["下次召唤恶魔暴君时间"] = timeLeft - 2
    v = CastOnTarget(#魔典：恶魔卫士#, vars["下次召唤恶魔暴君时间"] < 10 and talent["魔典：恶魔卫士"]) if v then return v end
end
if cd > 60 and timeLeft < 3 then --虚空传送门快要结束
    return run("召唤恶魔暴君")
end
--if cd > 80 and cd < 100 then --2次虚空传送门中间
--    return CastNoTarget(#召唤恶魔暴君#)
--end


