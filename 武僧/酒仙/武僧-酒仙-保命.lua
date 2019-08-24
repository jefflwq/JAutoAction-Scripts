--武僧-酒仙-保命
if not InCombatLockdown() then
    return CastNoTarget(#我_活血术#, playerHealthPercent < 0.75)
end                       
local v
v = CastNoTarget(#金创药#, talent["金创药"] and playerHealthPercent < (instance:InInstance() and 0.65 or 0.85) and #金创药#:GetChargeInfo():IsReachedOrSoon(2, 5)) if v then return v end
vars["3秒总伤害"] = playerHealthWatcher:GetRecentDamagePercent(3)
v = CastNoTarget(#金钟罩#, playerHealthPercent < 0.7 or vars["3秒总伤害"] > 0.1 and talent["金钟罩"]) if v then return v end
UpdateReduce("player")
vars["3秒魔法伤害"] = playerHealthWatcher:GetRecentMagicDamagePercent(3)
v = CastNoTarget(#散魔功#, talent["散魔功"] and (IsDying(playerHealthPercent, vars["3秒魔法伤害"], vars["当前魔法减伤"], 0.5) or (playerHealthPercent < 0.5 and player.Debuff:HasAny(3, "Magic")))) if v then return v end
v = CastNoTarget(#躯不坏#, talent["躯不坏"] and IsDying(playerHealthPercent, vars["3秒总伤害"], vars["当前减伤"], 0.3)) if v then return v end
v = CastNoTarget(#壮胆酒#, IsDying(playerHealthPercent, vars["3秒总伤害"], vars["当前减伤"], 0.25)) if v then return v end

vars["移花接木数量"] = #移花接木#:ReadyIn(0.2) and #移花接木#:GetCount() or 0
v = CastNoTarget(#移花接木#, playerHealthPercent < 0.7 and vars["移花接木数量"] > 1 and vars["移花接木数量"] < 5) if v then return v end

v = CastNoTarget(#金创药#, playerHealthPercent < 0.4 and talent["金创药"]) if v then return v end

local v = run("铁骨活血酒") if v then return v end
v = CastNoTarget(#我_真气波#, playerHealthPercent < 0.5 and talent["真气波"]) if v then return v end
v = AoeFront(#真气爆裂#, 20, 90, 20, 0.6, 1, 1, playerHealthPercent < 0.5 and talent["真气爆裂"]) if v then return v end
v = CastNoTarget(#移花接木#, playerHealthPercent < 0.7 and vars["移花接木数量"] > 0) if v then return v end
--v = CastNoTarget(#我_活血术#, playerHealthPercent < 0.5) if v then return v end
