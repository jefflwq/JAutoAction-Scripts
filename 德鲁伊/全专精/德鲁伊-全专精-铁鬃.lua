--德鲁伊-全专精-铁鬃
if not #铁鬃#:ReadyIn(0.2) then
    return
end
vars["铁鬃"] = player.Buff:Get("铁鬃")
vars["铁鬃剩余时间"] = vars["铁鬃"]:GetTimeLeft()

if vars["铁鬃"].Count == 0 or vars["铁鬃剩余时间"] < 2 then
    return #铁鬃#
end

if playerHealthPercent < 0.7 and vars["铁鬃"].Count < 5 then
    return #铁鬃#
end

vars["最近受到物理伤害"] = playerHealthWatcher:GetRecentPhysicalDamagePercent(3)

if vars["最近受到物理伤害"] > 0.1 and vars["铁鬃"].Count < 5 then
    return #铁鬃#
end

