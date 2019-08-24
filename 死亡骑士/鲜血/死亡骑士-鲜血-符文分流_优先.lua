--死亡骑士-鲜血-符文分流_优先
if playerHealthPercent > 0.8 then
    return
end
if player.Buff:Has("符文分流") then
    return
end
return CastNoTarget(#符文分流#)
