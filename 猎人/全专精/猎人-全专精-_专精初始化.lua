--猎人-全专精-_专精初始化
run("全职业-全专精-_专精初始化")
AddCharactorMacro("误宠", "INV_MISC_QUESTIONMARK", "#showtooltip 误导\\n/cast [target=pet,nodead,exists]误导")
AddCharactorMacro("召宠", "INV_MISC_QUESTIONMARK", "#showtooltip 召唤宠物 1\\n/cast [nopet] 召唤宠物 1", true)
AddCharactorMacro("召唤宠物_优先", "INV_MISC_QUESTIONMARK", "#showtooltip 召唤宠物 1\\n/jaa 优先执行 召唤宠物")

AddPriorMacro("意气风发")
AddPriorMacro("假死")
AddPriorMacro("束缚射击")
SetBreakSpell(#反制射击#)
AddSpellSwitch("意气风发")
AddSpellSwitch("灵龟守护")
