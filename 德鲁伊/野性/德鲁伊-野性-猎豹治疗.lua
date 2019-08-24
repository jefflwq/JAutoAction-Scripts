--德鲁伊-野性-猎豹治疗
if targetHealthPercent < 0.7 then
    if vars["掠食者的迅捷剩余时间"] > 0 then
        v = CastOnTarget(#愈合#, targetHealthPercent < 0.25 or (targetHealthPercent < 0.4 and target.Buff:Get("愈合"):GetTimeLeft() < 2)) if v then return v end
    end
    return run("恢复亲和")
end
