--德鲁伊-野性-猎豹保命
vars["掠食者的迅捷剩余时间"] = player.Buff:Get("掠食者的迅捷"):GetTimeLeft()
if vars["掠食者的迅捷剩余时间"] > 0 then
    if talent["血腥爪击"] then
        v = CastNoTarget(#我_愈合#, vars["掠食者的迅捷剩余时间"] < 2 or playerHealthPercent < 0.2) if v then return v end
    else
        v = CastNoTarget(#我_愈合#, vars["掠食者的迅捷剩余时间"] < 2 or playerHealthPercent < 0.2 or (playerHealthPercent < 0.5 and player.Buff:Get("愈合"):GetTimeLeft() < 2)) if v then return v end
    end
end
return run("德鲁伊-全专精-猎豹保命")

