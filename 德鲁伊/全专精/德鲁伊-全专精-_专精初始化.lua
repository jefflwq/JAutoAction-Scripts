--德鲁伊-全专精-_专精初始化
run("全职业-全专精-_专精初始化")
SetBreakSpell(#迎头痛击#)
SetScoffSpell(#低吼#)
vars["当前专精"] = player:GetCurrentSpecName()
AddCharactorMacro("变熊狂回_优先", "INV_MISC_QUESTIONMARK", "#showtooltip 熊形态\\n/jaa 优先执行 变熊狂回")
AddCharactorMacro("控制_优先", "INV_MISC_QUESTIONMARK", "#showtooltip 旅行形态\\n/jaa 优先执行 控制 2")
vars["打爆炸物技能"] = {#月火术#}
if talent["野性冲锋"] then
    AddSpellSwitch("野性冲锋")
end
