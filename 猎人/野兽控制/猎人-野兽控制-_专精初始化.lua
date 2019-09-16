--猎人-野兽控制-_专精初始化
run("全专精-_专精初始化")
vars["打爆炸物距离"] = 40
SetAutoAttactMode(1)

AddCommonSwitch("AOE", "JAOE", "多重射击")

AddSpellSwitch("狂野怒火")

if talent["群兽奔腾"] then
    AddSpellSwitch("群兽奔腾")
end
AddPriorMacro("群兽奔腾")
AddPriorMacro("胁迫")
