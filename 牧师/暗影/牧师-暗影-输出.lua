--牧师-暗影-输出
local v
vars["狂乱值"] = player:GetPower(@狂乱@)
vars["虚空形态中"] = player.Buff:Has("虚空形态")
local count = target:UpdateNearbyInfo(10).EnemyCount + 1
if vars["虚空形态中"] then
    v = CastOnTarget(#虚空箭#, true, true, gcdmax * 0.75) if v then return v end
    v = run("爆发技能") if v then return v end
    v = CastOnTarget(#暗言术：灭#, talent["暗言术：灭"]) if v then return v end
    v = CastOnTarget(#黑暗虚空#, vars["狂乱值"] < 70 and talent["黑暗虚空"]) if v then return v end
else
    if not player.Buff:Has("暗影形态") then
        return #暗影形态#
    end
    v = CastOnTarget(#暗言术：虚#, talent["暗言术：虚"] and #暗言术：虚#:GetChargeInfo():IsReachedOrSoon(gcdmax) and not #暗言术：虚#:CastedIn(2)) if v then return v end
    v = CastNoTarget(#虚空爆发#, targetHealth > playerHealthMax * 0.5 or target:UpdateNearbyInfo(12).EnemyCount > 0) if v then return v end
    v = run("暗言术：痛") if v then return v end
    v = run("吸血鬼之触") if v then return v end
    v = run("补鼠痛触") if v then return v end
    v = CastOnTarget(#暗言术：灭#, talent["暗言术：灭"]) if v then return v end
    v = CastOnTarget(#黑暗虚空#, vars["狂乱值"] < 70 and talent["黑暗虚空"]) if v then return v end
    v = CastOnTarget(#黑暗升华#, vars["狂乱值"] < 50 and targetHealth > playerHealthMax * 1.3 and talent["黑暗升华"]) if v then return v end
end
v = AoeAtCursor(#~暗影冲撞#, 8, 10, 0.65, 3, 1, vars["狂乱值"] < 80 and talent["暗影冲撞"]) if v and v ~= 0 then return v end
if count >= 6 then
    v = CastOnTarget(#精神灼烧#) if v then return v end
else
    v = CastOnTarget(#暗言术：虚#, talent["暗言术：虚"]) if v then return v end
end
if count >= 5 then
    v = CastOnTarget(#精神灼烧#) if v then return v end
else
    v = CastOnTarget(#心灵震爆#, not talent["暗言术：虚"], player.Buff:Has("暗影洞察")) if v then return v end
end
v = run("暗言术：痛") if v then return v end
v = run("吸血鬼之触") if v then return v end
v = run("补鼠痛触") if v then return v end
v = CastOnTarget(#虚空洪流#, talent["虚空洪流"]) if v then return v end
if count >= 3 then
    v = CastOnTarget(#精神灼烧#) if v then return v end
else
    v = run("精神鞭笞") if v then return v end
end


