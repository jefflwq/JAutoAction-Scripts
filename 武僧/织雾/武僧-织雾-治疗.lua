--武僧-织雾-治疗
local v
--v = CastNoTarget(#还魂术#, vars["40团血危急"] and SwitchIsOn("输出爆发")) if v then return v end
v = HealSingle(#_作茧缚命#, vars["治疗对象血量"] < 0.4 and SwitchIsOn("输出爆发")) if v then return v end
v = CastNoTarget(#朱鹤赤精#, vars["40码平均血量"] < 0.5 and SwitchIsOn("输出爆发") and talent["朱鹤赤精"]) if v then return v end
v = HealAround(#精华之泉#, 30, 0.85, 3, vars["治疗对象血量"] > 0.7, true) if v then return v end
local mana = player:GetPowerPercent(@法力@)
v = CastNoTarget(#法力茶#, SwitchIsOn("输出爆发") and talent["法力茶"] and mana < 0.9 and (vars["40码平均血量"] < 0.7 or vars["治疗对象血量"] < 0.3 or mana < 0.2)) if v then return v end
v = CastNoTarget(#雷光聚神茶#, vars["治疗对象血量"] < 0.7) if v then return v end
v = CastNoTarget(#我_青龙雕像#, vars["40码平均血量"] < 0.98 and talent["青龙雕像"] and totems:Update("青龙雕像") < 1) if v then return v end
v = HealAround(#碧愈疾风#, 10, 0.9, 3, talent["碧愈疾风"], true) if v then return v end
v = HealFront(#真气爆裂#, 30, 60, 0.9, 3, talent["真气爆裂"] and not CInstance:InPVE()) if v then return v end
v = HealSingle(#_复苏之雾#, vars["治疗对象血量"] < 0.95 and vars["治疗对象"].Buff:Get("复苏之雾"):GetTimeLeft() < 6) if v then return v end
v = HealSingle(#_真气波#, vars["治疗对象血量"] < 0.9 and vars["正在引导的法术"] ~= "抚慰之雾" and talent["真气波"]) if v then return v end
v = run("抚慰之雾") if v then return v end

if vars["正在引导的法术"] == "抚慰之雾" and vars["抚慰对象"] == UnitGUID(vars["治疗对象"].UnitId) then
    --正在对目标施放抚慰之雾
    v = HealSingle(#_氤氲之雾#, vars["治疗对象血量"] < 0.9 and vars["治疗对象"].Buff:Get("氤氲之雾"):GetTimeLeft() < 1.8) if v then return v end
    v = HealSingle(#_活血术#, vars["治疗对象血量"] < 0.8 and not #_活血术#:CastedIn(2)) if v then return v end
end

