--牧师-戒律-输出
local v
v = AoeAround(#神圣新星#, 12, 15, 0.65, 3, 3) if v then return v end
local timeToDie = target:TimeToDie()
v = CastOnTarget(#暗言术：痛#, not talent["净化邪恶"] and NeedRefill(target.Debuff:Get("暗言术：痛"):GetTimeLeft(), 4.5, timeToDie, 8)) if v then return v end
v = DispelEnemy(#驱散魔法#, SwitchIsOn("驱散魔法"), "Magic") if v then return v end
v = CastOnTarget(#净化邪恶#, talent["净化邪恶"] and NeedRefill(target.Debuff:Get("净化邪恶"):GetTimeLeft(), 6, timeToDie, 8)) if v then return v end
v = CastOnTarget(#教派分歧#, talent["教派分歧"] and timeToDie > 5) if v then return v end
v = run("爆发技能") if v then return v end
v = CastOnTarget(#真言术：慰#, talent["真言术：慰"]) if v then return v end
vars["救赎数量"] = GetFriendBuffCount("救赎", 40)
v = CastOnTarget(#苦修#, not talent["幡然悔悟"] and vars["救赎数量"] > 3 or player.Buff:Has("阴暗面之力")) if v then return v end
v = CastOnTarget(#惩击#) if v then return v end
