--死亡骑士-冰霜-保命
vars["符文能量"] = player:GetPower(@符文能量@)
vars["符文能量差"] = player:GetPowerDeficit(@符文能量@)
vars["符文CDs"] = UpdateRuneCds()

local v
--if playerHealthPercent > 0.9 then
--    return
--end
local tm = player.Buff:Get("黑暗援助"):GetTimeLeft()
v = CastOnTarget(#灵界打击#, targetRange < 5 and tm > 0 and (tm < 3 or playerHealthPercent < 0.8)) if v then return v end


v = run("反魔法护罩") if v then return v end
v = run("冰封之韧") if v then return v end
v = run("天灾契约") if v then return v end
v = run("灵界打击") if v then return v end





