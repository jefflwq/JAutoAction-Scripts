--全职业-全专精-_专精初始化
--切换专精时执行
run("打断法术列表")

AddCommonSwitch("输出爆发", "J爆", "武器技能")
AddCommonSwitch("打断施法", "J断", "语言")
AddCommonSwitch("切换敌方", "J敌", "自动攻击")
AddCommonSwitch("饰品1")
AddCommonSwitch("饰品2")
--AddCommonSwitch("优先饰品1")
--AddCommonSwitch("优先饰品2")
--AddCommonSwitch("AOE")
AddCommonSwitch("治疗石")
AddCommonSwitch("打爆炸物")
if player:GetDuty() == "HEALER" then
    AddCommonSwitch("切换友方", "J友", "护甲技能")
end
DeleteMacro("J切友")
DeleteMacro("J切")
DeleteMacro("J冲")
AddCommonPriorMacro("J项链技能", 3, "艾泽拉斯之心精华", "项链技能")