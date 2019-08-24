--萨满祭司-元素-_专精初始化
run("全专精-_专精初始化")
vars["打爆炸物距离"] = 40
SetAutoAttactMode(false)
if talent["风暴元素"] then
    vars["风火元素"] = #风暴元素#
else
    vars["风火元素"] = #火元素#
end

AddPriorMacro("雷霆风暴")
