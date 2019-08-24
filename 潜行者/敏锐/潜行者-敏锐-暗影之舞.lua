--潜行者-敏锐-暗影之舞
--[暗影之舞]期间，不打夜刃，那么就是要在激活暗影之舞之前，保持一个11s以上的夜刃。
--不要在[死亡符记]增益效果不存在的时候使用[暗影之舞]。
--每次[暗影之舞]必须搭配[死亡符记]使用。
if player.Buff:Has("死亡符记") then
    if talent["暗影笼罩"] then
        return run("暗影之舞A")
    else
        return run("暗影之舞B")
    end
end
vars["死亡符记冷却"] = #死亡符记#:GetCooldown()
if vars["死亡符记冷却"] > 5 then
    return
end
vars["暗影之舞充能"] = #暗影之舞#:GetChargeInfo()
if vars["暗影之舞充能"].Charges == 0 and vars["暗影之舞充能"].Cooldown > (talent["暗影笼罩"] and 12.5 or 7.5) then
    return
end

vars["夜刃时间"] = target.Debuff:Get("夜刃"):GetTimeLeft()
if vars["死亡符记冷却"] < 0.2 then
    if vars["夜刃时间"] > 10 and #暗影之舞#:ReadyIn(0.2) then
        return #死亡符记#
    end
end

v = CastOnTarget(#夜刃#,  vars["夜刃时间"] < 10 and vars["连击点"] >= 5) if v then return v end
v = CastOnTarget(#暗影打击#) if v then return v end
local v = run("袖剑风暴") if v then return v end
v = CastOnTarget(vars["幽暗背刺"], vars["连击点差"] > 0 and vars["附近敌人数量"] < 3 and player:GetPowerTimeToValue(@能量@, 70) < gcdmax) if v then return v end

