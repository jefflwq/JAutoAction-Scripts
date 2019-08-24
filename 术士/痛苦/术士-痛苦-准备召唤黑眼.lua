--术士-痛苦-准备召唤黑眼
if not SwitchIsOn("输出爆发") then
    return
end
if (instance:InPVE() and not boss.IsTarget) or targetHealth < playerHealthMax * 1.5 then
    return
end
vars["召唤黑眼冷却"] = #召唤黑眼#:GetCooldown()
vars["痛苦无常施法时间"] = #痛苦无常#:GetCurrentCastingTime() / 1000
if vars["召唤黑眼冷却"] <= vars["灵魂碎片"] * vars["痛苦无常施法时间"] then
    if vars["灵魂碎片"] < 4 then
        return false
    end
    local v = CastNoTarget(#黑暗灵魂：哀难#, talent["黑暗灵魂：哀难"]) if v then return v end
    v = CastOnTarget(#痛楚#, NeedRefill(target.Debuff:Get("痛楚"):GetTimeLeft(), 8, vars["目标死亡时间"], 8), true, gcdmax) if v then return v end
    vars["痛苦无常连发"] = true
    return true
end
