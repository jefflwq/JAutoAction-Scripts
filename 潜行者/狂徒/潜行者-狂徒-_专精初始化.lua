--潜行者-狂徒-_专精初始化
run("全专精-_专精初始化")
vars["攻击距离"] = talent["杂耍打击"] and 8 or 5
vars["命运骨骰Buff"] = 
{
    "残忍精准",     --正中眉心爆击几率提高60%，其他技能提高20%。
    "大乱斗",        --攻击速度提高55%。吸血提高25%
    "骷髅黑帆",        --影袭触发额外攻击提高30%。
    "强势连击",        --你的攻击获得1个额外的连击点数。且伤害提高20%
    "埋藏的宝藏",   --每秒能量恢复提高4点
    "精准定位",        --终结技会使你的许多技能冷却时间缩短，每花费一个连击点数可缩短1秒。
}

--AddCommonSwitch("AOE", "JAOE", "剑刃乱舞")
AddPriorMacro("正中眉心")
AddPriorMacro("冲动")
AddPriorMacro("剑刃乱舞")
AddSpellSwitch("剑刃乱舞", nil, "剑舞")
AddSpellSwitch("消失")
AddSpellSwitch("佯攻")
AddSpellSwitch("还击")
AddSpellSwitch("猩红之瓶")
if talent["刀锋冲刺"] then
    AddSpellSwitch("刀锋冲刺")
end