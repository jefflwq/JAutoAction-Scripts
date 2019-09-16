--牧师-暗影-_专精初始化
run("全专精-_专精初始化")
SetBreakSpell(#沉默#)
vars["打爆炸物距离"] = 40
AddCharactorMacro("我盾", "INV_MISC_QUESTIONMARK", "#showtooltip\\n/cast [@player,nodead] 真言术：盾")
AddCharactorSwitch("切敌痛触")
AddCharactorSwitch("鼠标痛触")
if talent["摧心魔"] then
    vars["摧心暗影魔"] = #摧心魔#
else
    vars["摧心暗影魔"] = #暗影魔#
end
