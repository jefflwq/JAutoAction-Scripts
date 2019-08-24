--武僧-酒仙-输出
local v
v = CastOnTarget(#醉酿投#) if v then return v end
--面前AOE
v = AoeFront(#火焰之息#, 12) if v then return v end

vars["醉酿投冷却"] = #醉酿投#:GetCooldown()
v = CastOnTarget(#幻灭猛击#, targetRange < 5 and (vars["醉酿投冷却"] < gcdmax or vars["醉酿投冷却"] > (3 + gcdmax))) if v then return v end

v = CastNoTarget(#碧玉疾风#, talent["碧玉疾风"]) if v then return v end
v = CastOnTarget(#真气波#, playerHealthPercent < 0.95 and talent["真气波"]) if v then return v end
v = AoeFront(#真气爆裂#, 20, 30, 20, 0.6, 3, 1, playerHealthPercent < 0.95 and talent["真气爆裂"]) if v then return v end
v = CastOnTarget(#猛虎掌#, player:GetPowerTimeToValue(@能量@, 65) < vars["醉酿投冷却"]) if v then return v end


