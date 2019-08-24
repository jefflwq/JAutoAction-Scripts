--死亡骑士-鲜血-输出
local v
v = run("灵界打击") if v then return v end
v = run("血液沸腾") if v then return v end
v = CastNoTarget(#我_枯萎凋零#, targetRange < 5 and GetEnemyDebuffCount("枯萎凋零", 10) == 0 and (player.Buff:Has("赤色天灾") or (vars["符文CDs"][4] == 0 and player:UpdateNearbyInfo().EnemyCount > 2))) if v then return v end
v = CastNoTarget(vars["种族爆发"], run("需要开爆发吗")) if v then return v end


v = CastOnTarget(#鲜血印记#, talent["鲜血印记"] and not target.Debuff:Has("鲜血印记") and target:TimeToDie() > 10) if v then return v end
v = CastOnTarget(#骨髓分裂#, vars["符文能量差"] >= 20 and (player.Buff:Get("白骨之盾"):GetTimeLeft() < 3 or player.Buff["白骨之盾"].Count < 8) ) if v then return v end
v = AoeFront(#吞噬#, 5, 150, 10, 0.65, 3, 1, playerHealthPercent < 0.95 and talent["吞噬"]) if v then return v end
v = CastOnTarget(#饮血者#, playerHealthPercent < 0.95 and talent["饮血者"] and (UnitIsPlayer("target") or target:TimeToDie() > 3)) if v then return v end
v = CastOnTarget(#符文打击#, talent["符文打击"] and vars["符文CDs"][6] > 4 and (vars["符文CDs"][2] > 0 or #符文打击#:GetChargeInfo():IsReachedOrSoon())) if v then return v end
v = CastOnTarget(#心脏打击#, vars["符文能量差"] >= 15 and vars["符文CDs"][4] == 0) if v then return v end
v = CastOnTarget(#死神的抚摩#, targetRange > 10 and vars["符文CDs"][4] == 0 and not target.Debuff:Has("血之疫病")) if v then return v end
