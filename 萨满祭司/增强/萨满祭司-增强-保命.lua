--萨满祭司-增强-保命
local v
vars["漩涡值"] = player:GetPower(@漩涡@)
vars["漩涡差值"] = player:GetPowerDeficit(@漩涡@)
v = CastNoTarget(#星界转移#, playerHealthPercent < 0.22 or (playerHealthPercent < 0.4 and playerHealthWatcher:GetRecentDamagePercent(3) > 0.25)) if v then return v end
v = CastNoTarget(#我_治疗之涌#, playerHealthPercent < (instance:InPVE() and 0.2 or 0.35), vars["漩涡值"] >= 20) if v then return v end
v = CastNoTarget(#闪电之盾#, not player.Buff:Has("闪电之盾")) if v then return v end

v = run("大地之盾") if v then return v end
