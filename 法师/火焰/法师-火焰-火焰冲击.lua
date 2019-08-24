--法师-火焰-火焰冲击
local v = run("防止火焰冲击连击") if v then return v end

if not #火焰冲击#:CanBeUsedOnTarget(0.2) then
    return
end
if #火焰冲击#:CastedIn(1) then
    return
end

local lastSpell = GetLastSpell(1).Name
if lastSpell == "火焰冲击" then
    return
end

if lastSpell == "不死鸟之焰" and #不死鸟之焰#:SucceededIn(0.5) then
    return
end

if player.Buff:Has("热力迸发") then
    #火焰冲击#.Tag = GetTime()
    return #火焰冲击#
end
