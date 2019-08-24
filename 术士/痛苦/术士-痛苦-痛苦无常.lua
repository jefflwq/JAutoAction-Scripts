--术士-痛苦-痛苦无常
--vars["目标痛苦无常"] = target.Debuff:GetAll("痛苦无常")
vars["痛苦无常连发"] = false
if not #痛苦无常#:CanBeUsedOnTarget(0.2) then
    return
end
if vars["目标痛苦无常"]:Size() >= 5 and vars["目标痛苦无常"]:GetTimeLeft() > gcdmax - 0.2 then
    return
end
if vars["目标痛苦无常"]:Size() >= 4 and vars["目标痛苦无常"]:GetTimeLeft() > gcdmax - 0.2 
and #痛苦无常#:IsCasting() then
    return
end
local deathTm = target:TimeToDie()
if deathTm < 5 then
    return
end
if boss.IsTarget and deathTm < 20 and vars["灵魂碎片"] > 0 then
    vars["痛苦无常连发"] = true
    return #痛苦无常#
end
if (instance:InPVE() or target:IsTrainDummy()) and vars["灵魂碎片"] < 3 or (vars["灵魂碎片"] >= 4 and #痛苦无常#:IsCasting()) then
    return
end
local v = run("准备召唤黑眼")
if v == false then
    return
end
if v == true then
    return 
elseif v then
    return v
end
v = run("死亡之箭") if v then return v end
if vars["灵魂碎片"] > 3 and not #痛苦无常#:CastedIn(1.5) and (not SwitchIsOn("输出爆发") or #召唤黑眼#:GetCooldown() > 5 or vars["灵魂碎片"] == 5) then
    return #痛苦无常#
end


