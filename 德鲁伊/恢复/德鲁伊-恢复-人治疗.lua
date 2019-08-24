--德鲁伊-恢复-人治疗
local v

v = CastNoTarget(#繁盛#, talent["繁盛"] and player.Buff:Has("宁静")) if v then return v end
--v = run("大群疗", #宁静#, 0.7) if v then return v end
UpdateReduce(vars["治疗对象"].UnitId)
v = HealSingle(#_铁木树皮#, vars["治疗对象血量"] < 0.2 or (vars["治疗对象血量"] < 0.35 and vars["当前减伤"] < 0.14), true) if v then return v end
v = CastNoTarget(#化身：生命之树#, vars["团血危急"] and SwitchIsOn("输出爆发") and talent["化身：生命之树"] and not player.Buff:Has("化身：生命之树")) if v then return v end
v = CastNoTarget(#我_激活#, talent["化身：生命之树"] and player.Buff:Has("化身：生命之树") or (vars["团血危急"] and SwitchIsOn("输出爆发"))) if v then return v end
v = HealSingle(#_塞纳里奥结界#, vars["治疗对象血量"] < 0.7 and talent["塞纳里奥结界"], true) if v then return v end
v = HealSingle(#_迅捷治愈#, vars["治疗对象血量"] < 0.5, true) if v then return v end
--print("生命绽放数量", GetFriendBuffCount("生命绽放", 40))
v = HealSingle(#_生命绽放#, vars["治疗对象血量"] < 0.65 and GetFriendBuffCount("生命绽放", 40) == 0, true) if v then return v end
v = HealSingle(#_愈合#, vars["治疗对象血量"] < 0.3) if v then return v end
v = HealAroundTarget(#_野性成长#, 30, 50, 0.9, 3, vars["治疗对象血量"] < 0.95 and SwitchIsOn("野性成长")) if v then return v end

--v = HealSingle(#_自然之愈#, SwitchIsOn("打断施法") and (vars["治疗对象"].Debuff:HasAny(1, "Magic") or vars["治疗对象"].Debuff:HasAny(1, "Curse") or vars["治疗对象"].Debuff:HasAny(1, "Poison"))) if v then return v end

if SwitchIsOn("百花齐放") and totems:Update("百花齐放") < gcdmax then
    v = HealAroundCursor(#~百花齐放#, 10, nil, 0.9, 2, vars["治疗对象血量"] < 0.95) if v then return v end
    v = HealAround(#我_百花齐放#, 10, 0.9, 3, playerHealthPercent < 0.95) if v then return v end
end
v = HealSingle(#_回春术#, (vars["治疗对象血量"] < 0.95 and vars["治疗对象"].Buff:Get("回春术"):GetTimeLeft() < 4.4) or (vars["治疗对象血量"] < 0.85 and talent["萌芽"] and vars["治疗对象"].Buff:Get("回春术（萌芽）"):GetTimeLeft() < 4.4)) if v then return v end
v = HealSingle(#_愈合#, vars["治疗对象血量"] < 0.6 or (vars["治疗对象血量"] < 0.8 and not #愈合#:CastedIn(gcdmax * 1.2) and not vars["治疗对象"].Buff:Has("愈合"))) if v then return v end
