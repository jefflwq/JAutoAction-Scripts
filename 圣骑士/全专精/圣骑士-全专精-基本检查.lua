--圣骑士-全专精-基本检查
--return run("全职业-全专精-基本检查", player.Buff:Has("神圣马驹"))
if IsMounted() and not player.Buff:Has("神圣马驹") then --在坐骑上
    return
end
if run("正在引导法术") then --正在引导法术
    return
end
if SpellIsTargeting() then --地上有绿圈
    return
end
if ... then --附加check
    return
end
return true