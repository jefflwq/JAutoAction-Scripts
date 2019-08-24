--恶魔猎手-浩劫-保命
--vars["灵魂残片数"] = player.Buff:Get("灵魂残片").Count
--vars["恶魔之怒差值"] = player:GetPowerDeficit(@恶魔之怒@)
vars["3秒总伤害"] = playerHealthWatcher:GetRecentDamagePercent(3)

local v
v = CastNoTarget(#疾影#, playerHealthPercent < 0.75 and (vars["3秒总伤害"] > 0.12 or (vars["3秒总伤害"] > 1 and playerHealthPercent < 0.5)) and run("没有保命Buff")) if v then return v end
v = CastNoTarget(#幻影打击#, playerHealthPercent < 0.4 and vars["3秒总伤害"] > 0.1 and run("没有保命Buff")) if v then return v end
--v = CastNoTarget(#虚空行走#, playerHealthPercent < 0.12 and talent["虚空行走"] and vars["3秒总伤害"] > 0.1 and run("没有保命Buff")) if v then return v end
v = run("虚空行走") if v then return v end
