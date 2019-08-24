--武僧-踏风-风火屏气_优先
if talent["屏气凝神"] then
    return CastOnTarget(#屏气凝神#, targetRange < 5)
else
    return CastOnTarget(#风火雷电#, targetRange < 5 and not player.Buff:Has("风火雷电"))
end
