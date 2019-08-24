--术士-毁灭-献祭大灾变
if vars["浩劫"] then
    return
end
local v
if talent["大灾变"] then
    v = AoeAtCursor(#~大灾变#, 8, 10, 0.65, 3, 1) if v then return v end
    if #大灾变#:CastedIn(2.5) then
        return
    end
    vars["献祭时间"] = target.Debuff:Get("献祭"):GetTimeLeft()
    if #大灾变#:ReadyIn(vars["献祭时间"] - gcdmax * 2) then
        return
    end
else
    vars["献祭时间"] = target.Debuff:Get("献祭"):GetTimeLeft()
end
v = CastOnTarget(#献祭#, NeedRefill(vars["献祭时间"], 6.6, vars["目标死亡时间"], 8))  if v and v:IsSafeToCast() then return v end
if UnitExists("focus") then
    vars["献祭时间"] = focus.Debuff:Get("献祭"):GetTimeLeft()
    --print(NeedRefill(vars["献祭时间"], 5.4, focus:TimeToDie(), 8))
    v = CastOnFocus(#~献祭#, NeedRefill(vars["献祭时间"], 6.6, focus:TimeToDie(), 8))  if v and v:IsSafeToCast() then return v end
    --v = CastOnFocus(#~献祭#) if v and v:IsSafeToCast() then return v end
end
