--武僧-踏风-_专精初始化
run("全专精-_专精初始化")
vars["打爆炸物距离"] = 6
SetAutoAttactMode(0)
if talent["屏气凝神"] then
    AddCharactorMacro("风火屏气", "INV_MISC_QUESTIONMARK", "#showtooltip 屏气凝神\\n/jaa 优先执行 风火屏气_优先")
else
    AddCharactorMacro("风火屏气", "INV_MISC_QUESTIONMARK", "#showtooltip 风火雷电\\n/jaa 优先执行 风火屏气_优先")
end
