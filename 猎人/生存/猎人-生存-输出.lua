--猎人-生存-输出
local v
v = run("宠物攻击") if v then return v end
v = run("误导宠物") if v then return v end
--local tm = pet.Buff:Get("狂暴"):GetTimeLeft()
--v = CastOnTarget(#倒刺射击#, tm > 0 and tm < 1.2 * gcdmax) if v then return v end
vars["集中差值"] = player:GetPowerDeficit(@集中@)
v = run("爆发技能") if v then return v end
vars["附近敌人数量"] = player:UpdateNearbyInfo().EnemyCount
if talent["猫鼬撕咬"] then
    vars["猫鼬之怒时间"] = player.Buff:Get("猫鼬之怒"):GetTimeLeft()
    v = CastOnTarget(#猫鼬撕咬#, vars["附近敌人数量"] < 3 and (vars["猫鼬之怒时间"] > 0 and vars["猫鼬之怒时间"] < 5) or (vars["集中差值"] < 22 and vars["猫鼬之怒时间"] == 0)) if v then return v end
end
v = AoeAroundTarget(#野火炸弹#, 5, 6, 0.65, 3, 1) if v then return v end
v = AoeAround(#屠戮#, 8, 10, 0.65, 3, 3, talent["屠戮"]) if v then return v end
v = CastOnTarget(#飞轮#, talent["飞轮"]) if v then return v end
v = AoeFront(#削凿#, 5, 160, 8, 0.65, 3, 3, not talent["屠戮"]) if v then return v end
vars["目标死亡时间"] = target:TimeToDie()
vars["毒蛇钉刺时间"] = target.Debuff:Get("毒蛇钉刺"):GetTimeLeft()
if talent["蝰蛇毒液"] then
    vars["蝰蛇毒液时间"] = player.Buff:Get("蝰蛇毒液"):GetTimeLeft()
    v = CastOnTarget(#毒蛇钉刺#, vars["蝰蛇毒液时间"] > 0 and (vars["蝰蛇毒液时间"] < 4 or NeedRefill(vars["毒蛇钉刺时间"], #毒蛇钉刺#:GetDuration() * 0.28, vars["目标死亡时间"], 6))) if v then return v end
else
    v = CastOnTarget(#毒蛇钉刺#, NeedRefill(vars["毒蛇钉刺时间"], #毒蛇钉刺#:GetDuration() * 0.28, vars["目标死亡时间"], 6)) if v then return v end
end
v = CastOnTarget(#夺命黑鸦#, talent["夺命黑鸦"] and target:IsBigGuy(nil, 1, 10)) if v then return v end
v = CastOnTarget(#侧翼打击#, vars["集中差值"] > 35 and talent["侧翼打击"]) if v then return v end
v = CastOnTarget(#猛禽一击#, not talent["猫鼬撕咬"] and talent["利矛之刃"] and player.Buff:Get("利矛之刃").Count == 3) if v then return v end
v = CastOnTarget(#杀戮命令#, vars["集中差值"] > 20 and UnitName("target") ~= "爆炸物") if v then return v end
v = CastOnTarget(#猛禽一击#, not talent["猫鼬撕咬"] and (vars["集中差值"] > 60 or player.Buff:Has("雄鹰守护"))) if v then return v end
if talent["猫鼬撕咬"] then
    v = CastOnTarget(#猫鼬撕咬#, vars["猫鼬之怒时间"] > 0 or vars["集中差值"] < 40) if v then return v end
end



v = CastOnTarget(#鱼叉猛刺#, SwitchIsOn("鱼叉猛刺")) if v then return v end


--单体
--与怪距离超过30码时优先使用野火炸弹
--与怪距离超过8码并且低于30码使用鱼叉猛刺拉近距离
--拉近距离以后在集中值较高的情况下猫鼬撕咬起手(如果集中值较低优先杀戮命令和野火炸弹，不要使用毒蛇钉刺，等集中值回到差不多满)，
--触发猫鼬之怒，同时大概率触发蝰蛇毒液，接一发毒蛇钉刺，
--猫鼬之怒持续时间内 杀戮命令(确保集中值不溢出) > 猫鼬撕咬 > 野火炸弹 > 蝰蛇毒液 >，猫鼬之怒剩余最后几秒，只要能打猫鼬就不要用其他技能。注意，只要点了蝰蛇毒液，单体输出时没触发蝰蛇毒液就不应该用毒蛇钉刺，而应该把集中值留给猫鼬。
--aoe(双目标及以上):
--选好目标和角度使用野火炸弹，确保野火炸弹能炸到尽量多的目标(野火炸弹是锥形aoe)
--调整站位，让屠戮能A到尽量多的目标
--生存猎aoe就两个技能，野火炸弹>屠戮 即可，如果点了飞轮，那么在这两个技能都cd的情况下用飞轮，如果战斗时间够长，可以在使用了第一次屠戮之后就用掉飞轮。
--如果点了野火灌注，那么在变成绿炸弹时，如果你的目标身上没有毒蛇钉刺，那么至少应该先给一个目标上毒蛇钉刺(每有一个目标身上有毒蛇钉刺效果就会额外造成一次爆炸，不过这个爆炸的伤害只是毒蛇钉刺的初始伤害，伤害不高，除非当时没技能可用，否则没必要在使用绿炸弹之前给每个怪都上个毒蛇钉刺)
--杀戮命令如果重置了，一定要换目标使用，多一个目标身上有流血，就多10%攻速
--在野火炸弹和屠戮都还有好久cd且集中值较高的情况下，可以打猫鼬，长时间不用猫鼬第一下基本上必触发蝰蛇毒液，再接着用一发免费的毒蛇钉刺，缓冲一下。如果当前目标身上毒蛇钉刺dot还在，则应该对其他目标使用。

--在炸弹扔出以及所有的目标铺垫好了钉刺以后3目标及3目标以上卡CD削凿，不浪费CD炸弹
--尽可能的使用杀戮命令击打不同的目标使觅血者层数提高以及挂上由于觅血者天赋带来的流血。
--在你选择潜藏毒素特质时，记得在怪物死之前使用猫鼬/猛禽消耗层数。
--在你手中有绿色炸弹而并未选择多头蛇之咬天赋时，可以适当的挂上几个目标的钉刺以触发绿色炸弹的特效
--单体的手法上，最基础的打法就是猫鼬杀戮1+1
--在这基础上我们要在没有能量/没有杀戮的情况下填充炸弹以保证GCD的利用
--在协同期间(没有潜藏毒素特质)不需要补毒蛇钉刺
--在有潜藏毒素特质时，请在正常战斗中保持钉刺的覆盖
--协同外，猫鼬循环前，保持钉刺不断档
--在协同外，尽量保持一个高的能量位进入猫鼬循环
--在你使用迅捷爪机的特质下，请不要使迅捷爪机的层数断掉
--根据我自己的经验，如果想要使得迅捷爪机层数不断档，非嗜血期间每个猫鼬之间不要超过3个技能，非嗜血期间但是有唤风的情况下，每个猫鼬之间不要超过4个技能，嗜血期间自己看着打，基本不会断档。