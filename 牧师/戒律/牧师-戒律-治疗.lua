--牧师-戒律-治疗
local v
vars["救赎数量"] = GetFriendBuffCount("救赎", 40)

if vars["治疗对象血量"] < 0.3 and vars["治疗对象"] == target and not UnitIsUnit("target", "player") then
    UpdateReduce("target")
    v = CastOnTarget(#痛苦压制#, vars["治疗对象血量"] < 0.2 or vars["当前减伤"] < 0.19) if v then return v end
end
v = DispelFriend(#_纯净术#, SwitchIsOn("纯净术"), "Magic", "Disease") if v then return v end
v = HealAround(#光晕#, 30, 0.8, nil, talent["光晕"]) if v then return v end
v = HealAroundCursor(#~真言术：障#, 10, nil, 0.5, nil, not talent["微光屏障"]) if v then return v end

v = HealAround(#微光屏障#, 40, 0.65, nil, SwitchIsOn("输出爆发") and talent["微光屏障"]) if v then return v end
v = HealAround(#全神贯注#, 40, 0.7, nil, SwitchIsOn("输出爆发")) if v then return v end
v = CastNoTarget(#福音#, vars["40码平均血量"] < 0.85 and talent["福音"] and SwitchIsOn("输出爆发") and vars["40码人数"] > 2 and vars["救赎数量"] > vars["40码人数"] * 0.7) if v then return v end
v = AoeFront(#神圣新星#, 24, 30, 24, 0.6, 3, 1, talent["神圣之星"]) if v then return v end
v = HealSingle(#_苦修#, vars["治疗对象血量"] < 0.75 and (talent["幡然悔悟"] or player:IsMoving()), true) if v then return v end
v = HealAroundTarget(#_真言术：耀#, 30, 50, 0.85, nil, not #_真言术：耀#:SucceededIn(vars["40码人数"] > 8 and 5 or 7)) if v then return v end
v = HealAroundTarget(#_暗影盟约#, 30, 50, 0.85) if v then return v end

v = HealSingle(#_真言术：盾#, not vars["治疗对象"].Buff:Has("真言术：盾") and not vars["治疗对象"]:HasDebuff("虚弱灵魂") and (vars["治疗对象血量"] < 0.8 or (vars["治疗对象血量"] < 0.95 and not vars["治疗对象"].Buff:Has("救赎")))) if v then return v end
v = HealSingle(#_暗影愈合#, vars["治疗对象血量"] < 0.6 or (vars["治疗对象血量"] < 0.75 and not #暗影愈合#:CastedIn(2))) if v then return v end
