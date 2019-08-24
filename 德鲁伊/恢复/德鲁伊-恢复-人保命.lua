--德鲁伊-恢复-人保命
local v
v = CastNoTarget(#甘霖#, playerHealthPercent < 0.25 and talent["甘霖"]) if v then return v end
if playerHealthPercent < 0.4 or (playerHealthPercent < 0.6 and vars["3秒总伤害"] > 0.15 and vars["当前减伤"] < 0.1) then
    v = CastNoTarget(#我_树皮术#) if v then return v end
    v = CastNoTarget(#我_铁木树皮#) if v then return v end
end
