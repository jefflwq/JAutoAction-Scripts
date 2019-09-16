--牧师-戒律-_专精初始化
run("全专精-_专精初始化")
vars["打爆炸物距离"] = 0
AddCharactorMacro("我盾", "INV_MISC_QUESTIONMARK", "#showtooltip\\n/cast [@player,nodead] 真言术：盾")
if talent["摧心魔"] then
    vars["摧心暗影魔"] = #摧心魔#
else
    vars["摧心暗影魔"] = #暗影魔#
end
AddSpellSwitch("纯净术")
AddSpellSwitch("驱散魔法")
AddPriorMacro("纯净术")
AddPriorMacro("驱散魔法")

