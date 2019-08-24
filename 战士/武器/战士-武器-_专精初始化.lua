--战士-武器-_专精初始化
run("全专精-_专精初始化")
if talent["破坏者"] then
    vars["剑刃破坏"] = #破坏者#
else
    vars["剑刃破坏"] = #剑刃风暴#
end
if talent["战斗狂热"] then
    vars["旋风猛击"] = #旋风斩#
else
    vars["旋风猛击"] = #猛击#
end
if talent["灭战者"] then
    vars["巨人灭战"] = #灭战者#
else
    vars["巨人灭战"] = #巨人打击#
end

if talent["屠杀"] then
    vars["斩杀血量"] = 0.35
else
    vars["斩杀血量"] = 0.2
end
--if talent["悍勇无畏"] then
--    vars["压制提升致死"] = 0.3
--else
--    vars["压制提升致死"] = 0.2
--end

--vars["裸致死AP"] = 110
--vars["旋风斩AP"] = {104.4, 139.2, 174, 208.8, 243.6, 278.4, 313.2}
AddSpellSwitch("冲锋")
AddSpellSwitch("剑刃风暴")
AddSpellSwitch("剑在人在")
AddSpellSwitch("集结呐喊")
if talent["防御姿态"] then
    AddSpellSwitch("防御姿态")
end
AddPriorMacro("断筋")
AddPriorMacro("风暴之锤")

