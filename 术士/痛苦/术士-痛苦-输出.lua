--术士-痛苦-输出
vars["灵魂碎片"] = player:GetPower(@灵魂碎片@)
vars["目标死亡时间"] = target:TimeToDie()
local v
v = CastOnTarget(#痛楚#, NeedRefill(target.Debuff:Get("痛楚"):GetTimeLeft(), 4.5, vars["目标死亡时间"], 8)) if v then return v end
v = run("宠物攻击") if v then return v end
v = run("痛苦无常连发") if v then return v end
v = CastOnTarget(#吸取灵魂#, vars["灵魂碎片"] < 5 and talent["吸取灵魂"] and vars["目标死亡时间"] < 3 and not (boss.IsTarget and boss.LivingCount == 1)) if v then return v end
v = CastOnTarget(#鬼影缠身#, talent["鬼影缠身"] and NeedRefill(target.Debuff:Get("鬼影缠身"):GetTimeLeft(), #鬼影缠身#:GetDuration() * 0.28, vars["目标死亡时间"], 8)) if v then return v end
vars["目标10码敌人数量"] = target:UpdateNearbyInfo(10).EnemyCount + 1
v = CastOnTarget(#腐蚀之种#, vars["目标10码敌人数量"] > 3 and not #腐蚀之种#:CastedOnTarget(2.5) and not target.Debuff:Has("腐蚀之种") and vars["目标死亡时间"] > 6) if v then return v end
v = CastOnTarget(#痛楚#, NeedRefill(target.Debuff:Get("痛楚"):GetTimeLeft(), #痛楚#:GetDuration() * 0.28, vars["目标死亡时间"], 8)) if v then return v end
--v = CastOnTarget(#腐蚀术#, vars["目标10码敌人数量"] < 4 and not #腐蚀之种#:CastedOnTarget(3) and not target.Debuff:Has("腐蚀之种") and vars["目标死亡时间"] > 6) if v then return v end
v = run("腐蚀术") if v then return v end
v = CastOnTarget(#生命虹吸#, NeedRefill(target.Debuff:Get("生命虹吸"):GetTimeLeft(), #生命虹吸#:GetDuration() * 0.28, vars["目标死亡时间"], 6)) if v then return v end
v = CastOnTarget(#诡异魅影#, talent["诡异魅影"] and not (boss.InCombat and boss.Exists and not boss.IsTarget)) if v then return v end
v = run("痛苦无常") if v then return v end
v = CastNoTarget(#黑暗灵魂：哀难#, talent["黑暗灵魂：哀难"] and not #召唤黑眼#:CanBeUsedOnTarget(6)) if v then return v end
--v = CastOnTarget(#死亡之箭#, talent["死亡之箭"], false, 1.5) if v then return v end


v = AoeAtCursor(#~邪恶污染#, 8, 10, 0.65, 3, 1, talent["邪恶污染"]) if v then return v end
--v = CastOnTarget(#痛苦无常#) if v then return v end
v = CastOnTarget(#吸取灵魂#, talent["吸取灵魂"]) if v then return v end
v = CastOnTarget(#吸取生命#, playerHealthPercent < (instance:InInstance() and 0.25 or 0.85)) if v then return v end
v = CastOnTarget(#暗影箭#, not talent["吸取灵魂"], player.Buff:Has("夜幕")) if v then return v end


--痛楚-腐蚀-(虹吸)-诡异魅影-黑魂-(狂暴)-无常打光-黑眼-死亡箭

--恶魔掌控
