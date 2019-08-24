--术士-痛苦-死亡之箭
if not talent["死亡之箭"] then
    return
end
vars["死亡之箭冷却"] = #死亡之箭#:GetCooldown()
vars["痛苦无常施法时间"] = #痛苦无常#:GetCurrentCastingTime() / 1000
if vars["死亡之箭冷却"] > vars["灵魂碎片"] * vars["痛苦无常施法时间"] then
    return
end
local v = CastOnTarget(#死亡之箭#, not boss.IsTarget or totems:Update("黑眼") > 0, true, gcdmax) if v then return v end

if not SwitchIsOn("输出爆发") or vars["死亡之箭冷却"] < (#召唤黑眼#:GetCooldown() - 30) then
    v = CastOnTarget(#痛楚#, NeedRefill(target.Debuff:Get("痛楚"):GetTimeLeft(), 8, vars["目标死亡时间"], 8), true, gcdmax) if v then return v end
    vars["痛苦无常连发"] = "死亡之箭"
end
