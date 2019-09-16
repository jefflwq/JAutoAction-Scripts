--全职业-全专精-项链技能_优先
if GetSpellInfo("艾泽拉斯之心精华") ~= "聚能艾泽里特射线" then
    return CastOnTarget(#艾泽拉斯之心精华#)
end
return CastOnTarget(#艾泽拉斯之心精华#) or 0
