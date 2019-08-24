--死亡骑士-邪恶-爆发技能
if not run("需要开爆发吗") then
    return
end
local v
v = CastOnTarget(#召唤石像鬼#, vars["符文能量"] > 40 and talent["召唤石像鬼"]) if v then return v end
v = CastNoTarget(#邪恶狂乱#, talent["邪恶狂乱"]) if v then return v end
if talent["邪恶狂乱"] and not player.Buff:Has("邪恶狂乱") then
    return
end
v = CastOnTarget(#天启#, vars["溃烂之伤"] >= 4) if v then return v end
v = CastNoTarget(vars["药水"], vars["药水"] and boss.Exists or false) if v then return v end
v = CastNoTarget(vars["种族爆发"], UnitRace("player")~="血精灵" or vars["符文能量差"] > 30) if v then return v end
return run("开饰品")
