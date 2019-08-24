--法师-奥术-输出
local v

vars["法力百分比"] = player:GetPowerPercent(@法力@)
vars["奥术充能"] = player:GetPower(@奥术充能@)
if player:GetCastingSpell() == "奥术冲击" and vars["奥术充能"] < 4 then
    vars["奥术充能"] = vars["奥术充能"] + 1
end

vars["法力不足"] = select(2, IsUsableSpell("奥术冲击"))
vars["奥术强化时间"] = player.Buff:Get("奥术强化"):GetTimeLeft()
v = CastNoTarget(#唤醒#, vars["法力不足"], talent["气流"]) if v then return v end
v = AoeAroundTarget(#奥术弹幕#, 5, 6, 0.65, 4, 3, vars["奥术充能"] == 4) if v then return v end
v = CastNoTarget(#魔爆术#, vars["奥术充能"] < 4 and player:UpdateNearbyInfo(8).EnemyCount > 2) if v then return v end
v = CastNoTarget(#精力充沛#, vars["奥术充能"] == 0 and talent["精力充沛"]) if v then return v end


vars["节能施法时间"] = player.Buff:Get("节能施法"):GetTimeLeft()
v = run("爆发技能", #奥术强化#) if v then return v end
v = run("爆发中") if v then return v end

v = CastOnTarget(#虚空风暴#, vars["奥术充能"] == 4 and talent["虚空风暴"] and not player.Buff:Has("奥术强化") and GetEnemyDebuffCount("虚空风暴") == 0) if v then return v end
v = run("奥术宝珠") if v then return v end
v = CastOnTarget(#奥术飞弹#, vars["节能施法时间"] > 0 and (vars["节能施法时间"] < gcdmax * 1.2 or not player.Buff:Has("奥术强化"))) if v then return v end
v = CastOnTarget(#奥术弹幕#, vars["奥术充能"] == 4 and (not SwitchIsOn("输出爆发") or #奥术强化#:GetCooldown() > 8) and target:UpdateNearbyInfo(8).EnemyCount > 1) if v then return v end
v = CastOnTarget(#奥术冲击#, vars["奥术充能"] < 4 or vars["法力百分比"] > 0.7 or #唤醒#:GetCooldown() < 15 or (boss.IsTarget and boss.MaxDyingTime < 15), true, gcdmax * 0.3) if v then return v end
v = CastOnTarget(#奥术弹幕#, vars["奥术充能"] == 4 and (not SwitchIsOn("输出爆发") or #奥术强化#:GetCooldown() > 8)) if v then return v end
