--法师-冰霜-_专精初始化
run("全专精-_专精初始化")
vars["打爆炸物距离"] = 40
vars["冰刺"] = vars["冰刺"] or CreateSpell("精通：冰刺")

vars["冰枪术每码飞行时间"] = 1.2 / 40
vars["寒冰箭每码飞行时间"] = 1.2 / 40
vars["冰川尖刺每码飞行时间"] = 0.9 / 40
vars["咒术洪流层数"] = 0
vars["上次咒术洪流层数"] = 0
vars["下次咒术洪流层数"] = 0

vars["冰川尖刺伤害"] = 0
vars["冰川尖刺施法时间"] = 9999
vars["冰川尖刺飞行时间"] = 9999
vars["冰刺数量"] = 0

vars["打爆炸物技能"] = 
{
    #冰枪术#, 
}
AddSpellSwitch("寒冰宝珠")
AddSpellSwitch("暴风雪")
AddCharactorMacro("鼠暴雪", "INV_MISC_QUESTIONMARK", "#showtooltip\\n/cast [@cursor] 暴风雪")
AddPriorMacro("寒冰宝珠")
AddPriorMacro("暴风雪")
AddPriorMacro("冰冷血脉")
