--德鲁伊-平衡-_专精初始化
run("全专精-_专精初始化")
SetBreakSpell(#日光术#)
vars["打爆炸物距离"] = 40
SetAutoAttactMode(false)

--AddCharactorMacro("鼠星坠", "INV_MISC_QUESTIONMARK", "#showtooltip 星辰坠落\\n/cast [@cursor] 星辰坠落")

if talent["化身：艾露恩之眷"] then
    vars["超凡化身"] = #化身：艾露恩之眷#
else
    vars["超凡化身"] = #超凡之盟#
end
AddPriorMacro("星辰坠落")
DeleteMacro("鼠星坠")

AddSpellSwitch("星辰坠落")
