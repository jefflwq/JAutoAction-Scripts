--死亡骑士-邪恶-_专精初始化
run("全专精-_专精初始化")
vars["打爆炸物距离"] = 6
SetAutoAttactMode(0)
if talent["暗影之爪"] then
    vars["天灾暗影"] = #暗影之爪#
else
    vars["天灾暗影"] = #天灾打击#
end
if talent["亵渎"] then
    vars["枯萎亵渎"] = #我_亵渎#
else
    vars["枯萎亵渎"] = #我_枯萎凋零#
end

AddPriorMacro("亡者大军")
