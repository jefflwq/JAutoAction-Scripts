--德鲁伊-全专精-枭兽保命
local v
v = CastNoTarget(#树皮术#, playerHealthPercent < 0.3 or (playerHealthPercent < 0.6 and vars["3秒总伤害"] > 0.15 and vars["当前减伤"] < 0.1)) if v then return v end

v = CastNoTarget(#甘霖#, playerHealthPercent < 0.25 and talent["甘霖"]) if v then return v end

