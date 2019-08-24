--德鲁伊-全专精-人治疗
local v
v = run("恢复亲和") if v then return v end
v = CastOnTarget(#愈合#, targetHealthPercent < 0.5 or (targetHealthPercent < 0.7 and not #愈合#:CastedIn(2) and not target.Buff:Has("愈合"))) if v then return v end
if SwitchIsOn("切换友方") then
    v = unitSelector:SelectLowestFriend(0.95) if v then return v end
end
