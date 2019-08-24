--术士-痛苦-痛苦无常连发
vars["目标痛苦无常"] = target.Debuff:GetAll("痛苦无常")
--print(vars["目标痛苦无常"], vars["目标痛苦无常"]:Size(), #痛苦无常#:IsCasting())
if not vars["痛苦无常连发"] then
    return
end
if boss.Exists and not boss.IsTarget then
    return
end
local v = CastNoTarget(#黑暗灵魂：哀难#, talent["黑暗灵魂：哀难"]) if v then return v end

if vars["痛苦无常连发"] == "死亡之箭" then
    if vars["目标痛苦无常"]:Size() > 2
    or (vars["目标痛苦无常"]:Size() >= 2 and #痛苦无常#:IsCasting())
    or (vars["灵魂碎片"] == 1 and #痛苦无常#:IsCasting())
    or (vars["灵魂碎片"] == 0)
    then
        v = CastOnTarget(#死亡之箭#, talent["死亡之箭"], false, gcdmax) if v then return v end
        vars["痛苦无常连发"] = false
    elseif vars["灵魂碎片"] > 0 then
        return  #痛苦无常#
    end
else
    if vars["目标痛苦无常"]:Size() >= 5
    or (vars["目标痛苦无常"]:Size() >= 4 and #痛苦无常#:IsCasting())
    or (vars["灵魂碎片"] == 1 and #痛苦无常#:IsCasting())
    or (vars["灵魂碎片"] == 0)
    then
        v = CastOnTarget(#召唤黑眼#, SwitchIsOn("输出爆发"), false, gcdmax) if v then return v end
        v = run("爆发技能") if v then return v end
        v = CastOnTarget(#死亡之箭#, talent["死亡之箭"], false, gcdmax) if v then return v end
        vars["痛苦无常连发"] = false
    elseif vars["灵魂碎片"] > 0 then
        return  #痛苦无常#
    end
end


