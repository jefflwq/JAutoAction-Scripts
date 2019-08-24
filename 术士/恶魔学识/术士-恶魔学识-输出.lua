--术士-恶魔学识-输出
vars["目标死亡时间"] = target:TimeToDie()
vars["目标数量"] = target:UpdateNearbyInfo(8).EnemyCount + 1
vars["灵魂碎片"] = player:GetPower(@灵魂碎片@)
if #暗影箭#:IsCasting() then
    vars["灵魂碎片"] = vars["灵魂碎片"] + 1
elseif #恶魔之箭#:IsCasting() then
    vars["灵魂碎片"] = vars["灵魂碎片"] + 2
elseif #古尔丹之手#:IsCasting() then
    if vars["灵魂碎片"] > 3 then
        vars["灵魂碎片"] = vars["灵魂碎片"] - 3
    else
        vars["灵魂碎片"] = 0
    end
end
if vars["灵魂碎片"] > 5 then
    vars["灵魂碎片"] = 5
end
vars["小鬼数量"] = GetSpellCount("内爆")
vars["恶魔之核数量"] = player.Buff:Get("恶魔之核").Count
vars["恐惧猎犬时间"] = #召唤恐惧猎犬#:GetCooldown()

if vars["目标数量"] > 2 then
    v = AoeAtCursor(#~灾怨轰炸#, 8, 10, 0.65, 3, 1, talent["灾怨轰炸"]) if v and v ~= 0 then return v end
    v = CastOnTarget(#灵魂打击#, vars["灵魂碎片"] <= 4 and talent["灵魂打击"]) if v then return v end
    v = run("爆发技能") if v then return v end
    v = CastOnTarget(#恶魔力量#, SwitchIsOn("恶魔力量") and talent["恶魔力量"] and GetSpellInfo("恶魔掌控") ~= "巨斧投掷" and (UnitIsPlayer("target") or (vars["目标死亡时间"] > 13 and targetHealth > playerHealthMax * 2))) if v then return v end
    v = CastOnTarget(#古尔丹之手#, vars["灵魂碎片"] >= 3 and not vars["攒灵魂碎片"]) if v and v:IsSafeToCast() then return v end
    v = CastOnTarget(#内爆#, vars["小鬼数量"] >= 5) if v then return v end
    v = CastOnTarget(#召唤恐惧猎犬#, player.Buff:Has("魔性征召") and (vars["下次召唤恶魔暴君时间"] < 10 or vars["下次召唤恶魔暴君时间"] > 21)) if v then return v end
end

--平稳期技能优先级： 
--瞬发狗>灾怨轰炸>邪犬>狗>瞬发恶魔箭>古手 提前留片 不要为了打古手错开其他召唤物的cd，会影响后续爆发
v = CastOnTarget(#恶魔之箭#, vars["灵魂碎片"] <= 3 and vars["恶魔之核数量"] == 0 and not InCombatLockdown()) if v then return v end
v = CastOnTarget(#厄运#, talent["厄运"] and (UnitIsPlayer("target") or (vars["目标死亡时间"] > 27 and targetHealth > playerHealthMax * 2)) and not target.Debuff:Has("厄运")) if v then return v end
v = CastOnTarget(#灵魂打击#, vars["灵魂碎片"] <= 4 and talent["灵魂打击"]) if v then return v end
v = run("爆发技能") if v then return v end
v = CastOnTarget(#召唤恐惧猎犬#, player.Buff:Has("魔性征召") and (vars["下次召唤恶魔暴君时间"] < 10 or vars["下次召唤恶魔暴君时间"] > 21)) if v then return v end
v = AoeAtCursor(#~灾怨轰炸#, 8, 10, 0.65, 3, 1, talent["灾怨轰炸"]) if v and v ~= 0 then return v end
v = CastOnTarget(#恶魔力量#, SwitchIsOn("恶魔力量") and talent["恶魔力量"] and GetSpellInfo("恶魔掌控") ~= "巨斧投掷" and (UnitIsPlayer("target") or (vars["目标死亡时间"] > 13 and targetHealth > playerHealthMax * 2))) if v then return v end
v = CastOnTarget(#召唤邪犬#, talent["召唤邪犬"] and (vars["下次召唤恶魔暴君时间"] < 12 or vars["下次召唤恶魔暴君时间"] > 47)) if v then return v end
v = CastOnTarget(#召唤恐惧猎犬#, (vars["目标数量"] < 3 or talent["恐惧奇袭"]) and (vars["下次召唤恶魔暴君时间"] < 10 or vars["下次召唤恶魔暴君时间"] > 22)) if v then return v end
v = CastOnTarget(#恶魔之箭#, vars["恶魔之核数量"] > 0 and vars["灵魂碎片"] <= 3) if v then return v end
v = CastOnTarget(#古尔丹之手#, vars["灵魂碎片"] >= 3 and not vars["攒灵魂碎片"]) if v and v:IsSafeToCast() then return v end


v = CastNoTarget(#能量虹吸#, talent["能量虹吸"] and vars["小鬼数量"] >= 2 and vars["恶魔之核数量"] == 0) if v then return v end
v = CastOnTarget(#暗影箭#) if v then return v end



--单体注意要点：
--1：每一波传送门必须配合暴君，满足此情况下，再看下面要点。
--2：暴君每一波召唤最好能配合恐惧猎犬和邪犬。
--3：卡cd使用召唤恐惧猎犬(暴君cd转好时留着跟暴君一起放) 卡cd使用召唤邪犬(一定要卡cd 每两波正好配合一次恶魔暴君)，(如果点出厄运)厄运保持不断
--4：魔典：恶魔卫士卡CD使用，如果BOSS活不到下一次召二号机，留着配合暴君一起使用
--5：恶魔之核注意不要溢出 有2层就可以开始打瞬发恶魔箭了 如果到3层 狗死后恶魔之核就会溢出
--6：平稳期手里片最好不要低于2片 有利于卡cd召恐惧猎犬及邪犬 打出恶魔箭时注意手里片不高于3
--起手爆发建议：
--起手建议：偷药水——预读恶魔箭——厄运(如果有点)——恶魔传送门——巨魔狂暴——魔典：恶魔卫士——邪犬——狗——古手(如果触发征召)——暗影箭——古手——暗影箭——古手——暗影箭——古手——召唤恶魔暴君——灾怨轰炸——古手——进入正常循环(如果不是巨魔且没有主动急速饰品 打2次暗影箭+古手就行)


--aoe输出手法不固定，大致手法为：
--1 : aoe中灾怨轰炸优先级最高
--1： (1)暂定长期AOE循环：打至5片后 古手-暗影箭(瞬发恶魔箭)古手-暗影箭(瞬发恶魔箭)-如果有3片-古手-暗影箭-内爆
--(2)短期AOE循环：打至3片以上 古手-暗影箭(瞬发技能X2)-内爆
--(3)满片爆发AOE：打至5片 古手-古手-暗影箭-内爆
--2：灵魂打击在aoe循环中卡cd使用
--3：aoe循环中只用瞬发狗
--4：需要aoe爆发的场合，可提前召出大哥，然后进行3片一古手的循环 召出大量小鬼，大哥结束后所有小鬼能量皆为5点，此时内爆会有非常高的瞬间伤害。

