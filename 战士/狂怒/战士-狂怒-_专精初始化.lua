--战士-狂怒-_专精初始化
run("全专精-_专精初始化")
if talent["屠杀"] then
    vars["斩杀血量"] = 0.35
else
    vars["斩杀血量"] = 0.2
end
AddSpellSwitch("冲锋")
if talent["剑刃风暴"] then
    AddSpellSwitch("剑刃风暴")
end
