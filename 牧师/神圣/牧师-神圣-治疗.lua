--牧师-神圣-治疗
local v
v = HealSingle(#_圣言术：静#, vars["治疗对象血量"] < 0.5, true) if v then return v end
UpdateReduce("target")
v = HealTarget(#守护之魂#, vars["治疗对象血量"] < 0.3 and (vars["治疗对象血量"] < 0.2 or vars["当前减伤"] < 0.19)) if v then return v end
v = HealSingle(#_快速治疗#, vars["治疗对象血量"] < 0.4 or (vars["治疗对象血量"] < 0.6 and player.Buff:Has("圣光涌动"))) if v then return v end
v = DispelFriend(#_纯净术#, SwitchIsOn("纯净术"), "Magic", "Disease") if v then return v end
--v = run("大群疗", #神圣赞美诗#) if v then return v end
--v = HealAround(#光晕#, 30, 0.8, nil, talent["光晕"]) if v then return v end
v = HealAround(#圣言术：赎#, 30, 0.6, nil, talent["圣言术：赎"] and SwitchIsOn("输出爆发")) if v then return v end
v = HealAround(#神圣化身#, 30, 0.6, nil, talent["神圣化身"] and SwitchIsOn("输出爆发")) if v then return v end
v = HealAroundCursor(#~圣言术：灵#, 10, nil, 0.80, nil) if v then return v end
v = HealAroundTarget(#_治疗之环#, 10, nil, 0.85, 3, talent["治疗之环"]) if v then return v end
v = AoeFront(#神圣新星#, 24, 30, 24, 0.6, 3, 1, talent["神圣之星"]) if v then return v end
v = HealTarget(#联结治疗#, vars["治疗对象血量"] < 0.9 and playerHealthPercent < 0.9 and talent["联结治疗"]) if v then return v end
--v = HealAroundTarget(#_治疗祷言#, 40, 60, 0.9, 3, vars["治疗对象血量"] < 0.9) if v then return v end
v = HealSingle(#_圣言术：静#, vars["治疗对象血量"] < 0.65, true) if v then return v end
v = HealSingle(#_愈合祷言#, not vars["治疗对象"].Buff:Has("愈合祷言")) if v then return v end
v = HealSingle(#_恢复#, vars["治疗对象血量"] < 0.95 and not vars["治疗对象"].Buff:Has("恢复")) if v then return v end
v = HealSingle(#_快速治疗#, vars["治疗对象血量"] < 0.8 and (vars["治疗对象血量"] < 0.6 or vars["40码平均血量"] < 0.7 or talent["光明尾迹"] or player.Buff:Get("圣光涌动").Count == 2) and not (vars["治疗对象血量"] > 0.8 and #快速治疗#:CastedIn(3))) if v then return v end
v = HealSingle(#_治疗术#, vars["治疗对象血量"] < 0.9 and vars["治疗对象血量"] > 0.6 and not (vars["治疗对象血量"] > 0.80 and #治疗术#:CastedIn(3))) if v then return v end
