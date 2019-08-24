--法师-火焰-烈焰护体

if not #烈焰护体#:ReadyIn(0.2) then
    return
end
if player.Buff:Has("烈焰护体") then
    return
end
if player.Buff:Has("燃烧") then
    return
end
if player.Buff:Has("能量符文") then
    return
end
if player.Buff:Has("热力迸发") then
    return
end
return #烈焰护体#
