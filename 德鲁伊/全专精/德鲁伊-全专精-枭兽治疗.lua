--德鲁伊-全专精-枭兽治疗
local v
if targetHealthPercent < 0.7 then
    v = run("恢复亲和") if v then return v end
end
return CastOnTarget(#愈合#, target:CanBeAssisted() and (targetHealthPercent < 0.5 or (targetHealthPercent < 0.7 and not #愈合#:CastedIn(2) and not target.Buff:Has("愈合"))))

