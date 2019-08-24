--圣骑士-防护-_专精初始化
run("全专精-_专精初始化")
vars["打爆炸物距离"] = 6
SetAutoAttactMode(0)
if talent["祝福之锤"] then
    vars["正义祝福"] = #祝福之锤#
else
    vars["正义祝福"] = #正义之锤#
end
if talent["守护者之手"] then
    vars["守护者之光"] = #守护者之手#
else
    vars["守护者之光"] = #守护之光#
end
