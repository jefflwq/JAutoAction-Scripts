--死亡骑士-冰霜-冰龙吐息准备
vars["冰龙吐息冷却"] = #冰龙吐息#:GetCooldown()
if vars["冰龙吐息冷却"] == 0 then
    --print(vars["符文能量"],vars["符文CDs"][4])
    if targetRange < 5 and vars["符文能量"] >= 80 and (vars["符文CDs"][3] == 0 or vars["符文CDs"][5] < 3) and target:IsInFrontOfPlayer(5, 120) and player:EnemyAlmostInFront(5, 120, 8, 0.65, 3, 1) then
        return true
    end
end
if vars["冰龙吐息冷却"] > 15 then
    return
end
if vars["冰龙吐息冷却"] == 0 then
    vars["符文阈值"] = 3
    vars["符文能量阈值"] = 100
elseif vars["冰龙吐息冷却"] < 3 then
    vars["符文阈值"] = 3
    vars["符文能量阈值"] = 100
elseif vars["冰龙吐息冷却"] <= 25 then
    vars["符文阈值"] = 3
    vars["符文能量阈值"] = 75
end

if vars["符文能量"] > vars["符文能量阈值"] then
    v = AoeFront(#冰川突进#, 5, 100, 8, 0.65, 3, 2, targetRange < 5 and talent["冰川突进"]) if v then return v end
    v = CastOnTarget(#冰霜打击#, targetRange < 5) if v then return v end
end
if vars["符文CDs"][vars["符文阈值"]] == 0 then
    v = AoeFront(#凛风冲击#, 5, 100, 8, 0.65, 3, 1, vars["符文能量差"] >= 10 and vars["白霜"]) if v then return v end
    v = AoeFront(#冰霜之镰#, 5, 100, 8, 0.65, vars["杀戮机器"] and 4 or 3, vars["杀戮机器"] and 4 or 2, vars["符文能量差"] > 10) if v then return v end
    v = AoeAround(#冷酷严冬#, 6, 12, 0.65, 3, 1, targetRange < 5 and vars["符文能量差"] >= 10) if v then return v end
    v = CastOnTarget(#湮灭#, vars["符文能量差"] >= 20) if v then return v end
end
v = AoeFront(#凛风冲击#, 5, 100, 8, 0.65, 3, 1, vars["符文能量差"] >= 10 and vars["白霜"]) if v then return v end
v = CastOnTarget(#寒冰锁链#, vars["符文能量差"] >= 10 and talent["冷酷之心"] and player.Buff:Get("冷酷之心").Count >= 20 and vars["冰霜之柱中"]) if v then return v end
return 0