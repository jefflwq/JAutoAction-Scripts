--武僧-踏风-怒雷破
vars["怒雷破冷却"] = #怒雷破#:GetCooldown()
if vars["怒雷破冷却"] > (7 * gcdmax) then
    return
end
local v
vars["怒雷破持续时间"] = #怒雷破#:GetDuration()
v = AoeFront(#怒雷破#, 6, 130, 10, 0.65, 5, 1, vars["真气"] >= 3 and vars["能量回满时间"] > vars["怒雷破持续时间"] - 0.5) if v then return v end


--准备怒雷破
--v = AoeAround(#升龙霸#, 8, 10) if v then return v end
if vars["真气"] < 3 then
    v = run("攒真气", 3) if v and v ~= 0 then return v end
    if v == 0 and vars["怒雷破冷却"] < gcdmax * 1.1 then
        v = CastOnTarget(#猛虎掌#) if v then return v end
    end
end
v = CastOnTarget(#幻灭踢#, vars["上一个技能"] ~= "幻灭踢" and player.Buff:Has("幻灭踢！")) if v then return v end
if vars["真气"] < 3 then
    return 0
end


