--死亡骑士-鲜血-_专精初始化
run("全专精-_专精初始化")

vars["打爆炸物距离"] = 6
SetAutoAttactMode(0)
AddSpellSwitch("冰封之韧")
AddSpellSwitch("吸血鬼之血", "吸血鬼血")
AddSpellSwitch("符文刃舞")
AddSpellSwitch("反魔法护罩", "反魔法罩")
if talent["符文分流"] then
    AddSpellSwitch("符文分流")
end
if talent["墓石"] then
    AddSpellSwitch("墓石")
end
if talent["白骨风暴"] then
    AddSpellSwitch("白骨风暴")
end
AddPriorMacro("符文刃舞")
AddPriorMacro("墓石")
AddPriorMacro("白骨风暴")
AddPriorMacro("符文分流")
