--死亡骑士-邪恶-输出
local v
vars["溃烂之伤"] = target.Debuff:Get("溃烂之伤").Count
v = run("爆发技能") if v then return v end
v = AoeAround(#邪恶虫群#, 8, 12, 0.65, 3, 1, vars["符文能量差"] > 10 and talent["邪恶虫群"]) if v then return v end
v = AoeAround(vars["枯萎亵渎"], 8, 12, 0.65, 4, 2, vars["符文能量差"] > 10) if v then return v end
v = CastOnTarget(#凋零缠绕#, player.Buff:Has("末日突降") or vars["符文能量"] > 85) if v then return v end
v = CastOnTarget(#爆发#, vars["符文能量差"] > 10 and NeedRefill(target.Debuff:Get("恶性瘟疫"):GetTimeLeft(), 2, target:TimeToDie(), 6)) if v then return v end
v = CastOnTarget(#传染#, talent["传染"] and GetEnemyDebuffCount("恶性瘟疫") > 2) if v then return v end
v = CastNoTarget(#黑暗突变#, UnitExists("pet") and not UnitIsDead("pet")) if v then return v end
v = CastOnTarget(#脓疮打击#, vars["溃烂之伤"] < 3 and vars["符文能量差"] > 20) if v then return v end
v = CastOnTarget(vars["天灾暗影"], vars["溃烂之伤"] > 0 and vars["符文能量差"] > 13) if v then return v end
v = CastOnTarget(#灵魂收割#, vars["符文CDs"][2] > 0) if v then return v end
v = CastOnTarget(#凋零缠绕#) if v then return v end
