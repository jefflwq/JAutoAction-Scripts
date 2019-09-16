--战士-防护-复仇痛苦
--盾牌格挡持续时间≥3s，怒气>40可填充无视苦痛。 
--盾牌格挡持续时间<3s，怒气>70可填充无视苦痛。 
--盾牌格挡充能时间≥3s，怒气>40可填充无视苦痛。 
--盾牌格挡充能时间<3s，怒气>70可填充无视苦痛。 
--激励破釜持续时间>3s，怒气>40可填充无视苦痛。
local nq = 0
local tm = player.Buff:Get("盾牌格挡"):GetTimeLeft()
if tm >= 3 then
    nq = 0
elseif tm > 0 then
    nq = 30
else
    tm = #盾牌格挡#:GetChargeInfo():TimeToCharges(1)
    if tm >= 3 then
        nq = 0
    else
        nq = 30
    end
end
local v

if talent["报复"] then
    vars["报复：无视苦痛"] = player.Buff:Has("报复：无视苦痛")
    vars["报复：复仇"] = player.Buff:Has("报复：复仇")
    if vars["报复：无视苦痛"] then
        v = run("无视苦痛", nq) if v then return v end
        v = AoeFront(#复仇#, 5, 180, 10, 0.65, 3, 1, targetRange < 5 and vars["怒气"] >= (nq + (vars["报复：复仇"] and 20 or 30))) if v then return v end
        return
    end
    if vars["报复：复仇"] and #复仇#:ReadyIn(0.2) then
        v = AoeFront(#复仇#, 5, 180, 10, 0.65, 3, 1, targetRange < 5 and vars["怒气"] >= (nq + (vars["报复：复仇"] and 20 or 30))) if v then return v end
        v = run("无视苦痛", nq) if v then return v end
        return
    end
end
v = run("无视苦痛", nq) if v then return v end
v = AoeFront(#复仇#, 5, 180, 10, 0.65, 3, 1, vars["怒气"] >= (nq + (vars["报复：复仇"] and 20 or 30))) if v then return v end
--v = AoeFront(#复仇#, 5, 180, 10, 0.65, 3, 1, targetRange < 5 and vars["怒气"] >= (nq + (vars["报复：复仇"] and 20 or 30))) if v then return v end
