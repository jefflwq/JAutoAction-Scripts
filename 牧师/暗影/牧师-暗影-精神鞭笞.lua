--牧师-暗影-精神鞭笞
if not #精神鞭笞#:CanBeUsedOnTarget(0.2) then
    return
end
local wt = 0.3 * gcdmax
if vars["虚空形态中"] and #虚空箭#:CanBeUsedOnTarget(wt) then
    print("1111111111")
    return #虚空箭#
end
if (not talent["暗言术：虚"]) and #心灵震爆#:CanBeUsedOnTarget(wt) then
    print("22222222")
    return #心灵震爆#
end
if vars["正在引导的法术"] == "精神鞭笞" then
    return
end
return #精神鞭笞#
