--恶魔猎手-复仇-_专精初始化
run("全专精-_专精初始化")
vars["打爆炸物距离"] = 6
SetAutoAttactMode(0)
if talent["破裂"] then
    vars["破裂裂魂"] = #破裂#
    vars["打爆炸物技能"] = {#邪能之刃#, #破裂#, #投掷利刃#}
else
    vars["破裂裂魂"] = #裂魂#
    vars["打爆炸物技能"] = {#邪能之刃#, #裂魂#, #投掷利刃#}
end
