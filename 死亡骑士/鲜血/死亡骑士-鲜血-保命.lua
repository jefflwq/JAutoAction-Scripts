--死亡骑士-鲜血-保命
vars["符文能量"] = player:GetPower(@符文能量@)
vars["符文能量差"] = player:GetPowerDeficit(@符文能量@)
vars["符文CDs"] = UpdateRuneCds()
local v
if playerHealthPercent > 0.9 then
    return
end
--vars["3秒总伤害"] = playerHealthWatcher:GetRecentDamagePercent(3)
--UpdateReduce("player")
--v = CastNoTarget(#符文分流#, playerHealthPercent < 0.7 or vars["3秒总伤害"] > 0.1 and talent["符文分流"]) if v then return v end
--vars["3秒魔法伤害"] = playerHealthWatcher:GetRecentMagicDamagePercent(3)
v = run("符文分流") if v then return v end
v = run("反魔法护罩") if v then return v end
v = run("墓石") if v then return v end
v = run("白骨风暴") if v then return v end
v = run("吸血鬼之血") if v then return v end
v = run("符文刃舞") if v then return v end
v = run("冰封之韧") if v then return v end





