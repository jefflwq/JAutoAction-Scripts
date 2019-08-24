--法师-火焰-输出
local v

v = player:GetCastingSpell()
if v == "炎爆术" then
    return 0
end
vars["炽热连击"] = player.Buff:Has("炽热连击！")
v = run("爆发技能", #燃烧#) if v then return v end
v = AoeAtCursor(#~烈焰风暴#, 8, 10, 0.65, 3, 3, vars["炽热连击"], true, true, true) if v then return v end
v = CastOnTarget(#炎爆术#, vars["炽热连击"]) if v then return v end
v = run("不死鸟之焰") if v then return v end
v = run("火焰冲击") if v then return v end
v = run("炎爆术") if v then return v end
v = CastOnTarget(#流星#, talent["流星"]) if v then return v end
v = CastOnTarget(#活动炸弹#, talent["活动炸弹"]) if v then return v end
v = CastOnTarget(#灼烧#, talent["灼烧之触"] and targetHealthPercent < 0.3) if v then return v end
v = CastOnTarget(#火球术#) if v then return v end
v = CastOnTarget(#灼烧#, true, true) if v then return v end
