--萨满祭司-恢复-治疗
if vars["治疗对象血量"] > 0.95 then
    v = run("大地之盾") if v then return v end
    v = run("治疗之泉图腾") if v then return v end
    return 
end
v = CastNoTarget(#治疗之潮图腾#, vars["团血危急"] and SwitchIsOn("输出爆发")) if v then return v end
v = CastNoTarget(#升腾#, vars["团血危急"] and SwitchIsOn("输出爆发") and talent["升腾"] and totems:Update("治疗之潮图腾") < 1) if v then return v end
local ignoreMoveCheck = player.Buff:Has("灵魂行者的恩赐")
if vars["治疗对象血量"] < 0.6 then
    v = HealSingle(#_生命释放#, talent["生命释放"]) if v then return v end
    v = HealSingle(#_激流#, not vars["治疗对象"].Buff:Has("激流")) if v then return v end
end
if vars["治疗对象血量"] < 0.5 then
    v = HealSingle(#_治疗之涌#, true, ignoreMoveCheck) if v then return v end
end
v = run("大地之盾") if v then return v end
v = run("治疗之泉图腾") if v then return v end
v = HealAroundCursor(#~倾盆大雨#, 12, nil, 0.9, 3, talent["倾盆大雨"]) if v then return v end
v = HealFront(#奔涌之流#, 30, 120, 0.9, 3, talent["奔涌之流"]) if v then return v end
v = HealAroundCursor(#~治疗之雨#, 12, nil, 0.95, 3) if v then return v end
v = CastNoTarget(#暴雨图腾#, vars["40码平均血量"] < 0.9 and totems:Update("暴雨图腾") == 0) if v then return v end
if player.Buff:Get("潮汐奔涌").Count > 1 then
    v = HealSingle(#_治疗之涌#, vars["治疗对象血量"] < 0.6 or (vars["治疗对象血量"] < 0.75 and not #治疗之涌#:CastedIn(#治疗之涌#:GetCurrentCastingTime() + 0.3)), ignoreMoveCheck) if v then return v end
    v = HealSingle(#_治疗波#, vars["团血安全"] and vars["治疗对象血量"] < 0.85 and not #治疗波#:CastedIn(#治疗波#:GetCurrentCastingTime() + 0.3), ignoreMoveCheck) if v then return v end
end
v = HealSingle(#_激流#, vars["治疗对象血量"] < 0.9 and not vars["治疗对象"].Buff:Has("激流")) if v then return v end
v = HealSingle(#_生命释放#, talent["生命释放"] and vars["治疗对象血量"] < 0.8) if v then return v end
if vars["40码人数"] > 6 then
    v = HealAroundTarget(#_治疗链#, 40, (vars["40码平均血量"] < 0.95) and 60 or nil, 0.9, 3, vars["治疗对象血量"] < 0.9) if v then return v end
else
    v = HealAroundTarget(#_治疗链#, 15, (vars["40码平均血量"] < 0.85) and 40 or nil, 0.9, 3, vars["治疗对象血量"] < 0.9) if v then return v end
end
v = HealSingle(#_治疗之涌#, vars["治疗对象血量"] < 0.6 or (vars["治疗对象血量"] < 0.75 and not #治疗之涌#:CastedIn(#治疗之涌#:GetCurrentCastingTime() + 0.3)), ignoreMoveCheck) if v then return v end
v = HealSingle(#_治疗波#, vars["团血安全"] and vars["治疗对象血量"] < 0.85 and not #治疗波#:CastedIn(#治疗波#:GetCurrentCastingTime() + 0.3), ignoreMoveCheck) if v then return v end
