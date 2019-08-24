--死亡骑士-冰霜-_专精初始化
run("全专精-_专精初始化")
vars["打爆炸物距离"] = 6
SetAutoAttactMode(0)
--if not talent["冰龙吐息"] then
    vars["冰龙吐息中"] = false
    vars["符文阈值"] = 1
    vars["符文能量阈值"] = 24
    vars["冰龙吐息冷却"] = 999
--end

AddPriorMacro("冰霜之柱")
