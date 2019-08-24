--战士-全专精-_专精初始化
run("全职业-全专精-_专精初始化")
vars["打爆炸物距离"] = 6
SetAutoAttactMode(0)
if talent["胜利在望"] then
    vars["胜利追击"] = #胜利在望#
else
    vars["胜利追击"] = #乘胜追击#
end


AddCharactorMacro("取消防御", "INV_MISC_QUESTIONMARK", "#showtooltip 防御姿态\\n/cancelaura 防御姿态")
AddPriorMacro("破胆怒吼")
--AddPriorMacro("英勇投掷")
SetBreakSpell(#拳击#)
SetScoffSpell(#嘲讽#)