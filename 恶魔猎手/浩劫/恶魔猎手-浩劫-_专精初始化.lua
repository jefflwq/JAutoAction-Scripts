--恶魔猎手-浩劫-_专精初始化
run("全专精-_专精初始化")
vars["打爆炸物距离"] = 6
SetAutoAttactMode(0)
vars["打爆炸物技能"] = 
{
    #刃舞#, 
    talent["邪能之刃"] and #邪能之刃# or false, 
    #混乱打击#,
    (not talent["恶魔之刃"]) and #恶魔之咬# or false, 
    #投掷利刃#,
}
AddSpellSwitch("邪能冲撞")
AddSpellSwitch("投掷利刃")
AddSpellSwitch("眼棱")
AddSpellSwitch("邪能弹幕")
AddPriorMacro("眼棱")
AddPriorMacro("邪能弹幕")
