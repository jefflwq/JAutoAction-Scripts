--圣骑士-惩戒-_专精初始化
run("全专精-_专精初始化")
vars["打爆炸物距离"] = 6
SetAutoAttactMode(0)
if talent["征伐"] then
    vars["复仇征伐"] = #征伐#
else
    vars["复仇征伐"] = #复仇之怒#
end
if talent["灰烬觉醒"] then
    AddSpellSwitch("灰烬觉醒")
    AddPriorMacro("灰烬觉醒")
end

