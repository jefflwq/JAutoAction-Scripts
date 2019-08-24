--法师-火焰-不死鸟之焰
if not talent["不死鸟之焰"] then
    return
end
local v = run("防止火焰冲击连击") if v then return v end

if not #不死鸟之焰#:CanBeUsedOnTarget(0.2) then
    return
end
local lastSpell = GetLastSpell(1).Name
if lastSpell == "火焰冲击" or lastSpell == "不死鸟之焰" then
    return
end

if not player.Buff:Has("热力迸发") then
    return
end
vars["火焰冲击充能"] = #火焰冲击#:GetChargeInfo()
vars["不死鸟之焰充能"] = #不死鸟之焰#:GetChargeInfo()
if vars["火焰冲击充能"].FullRechargeTime < 2 and vars["火焰冲击充能"].FullRechargeTime < vars["不死鸟之焰充能"].FullRechargeTime then
    if #火焰冲击#:CanBeUsedOnTarget(0.2) then
        #火焰冲击#.Tag = GetTime()
        return #火焰冲击#
    end
end
if vars["火焰冲击充能"].FullRechargeTime > vars["不死鸟之焰充能"].FullRechargeTime then
    return #不死鸟之焰#
end
if #火焰冲击#:CanBeUsedOnTarget(0.2) then
    #火焰冲击#.Tag = GetTime()
    return #火焰冲击#
end
if #不死鸟之焰#:CanBeUsedOnTarget(0.2) then
    return #不死鸟之焰#
end
