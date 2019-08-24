--萨满祭司-恢复-保命
local v
v = CastNoTarget(#星界转移#, playerHealthPercent < 0.25 or (playerHealthPercent < 0.4 and playerHealthWatcher:GetRecentDamagePercent(3) > 0.25)) if v then return v end

