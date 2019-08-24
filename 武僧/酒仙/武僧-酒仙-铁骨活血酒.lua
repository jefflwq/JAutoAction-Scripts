--武僧-酒仙-铁骨活血酒
--武僧-酒仙-保命

--壮胆酒    瞬发        7分钟冷却时间                皮肤如石头般坚硬，持续15秒，使你的当前和最大生命值提高20%，使醉拳的效果提高10%，同时使你受到的伤害降低20%。
--活血酒    瞬发            14秒充能时间,最多可使用3次            移除由醉拳化解的剩余伤害中的50%。与铁骨酒共享使用次数。
                            
--铁骨酒    瞬发            14秒充能时间,最多可使用3次            饮下烈酒，让你的醉拳可以化解更多的伤害，持续7秒。与活血酒共享使用次数。
--金创药    瞬发            30秒充能时间,最多可使用2次            涂抹金创药，为你恢复15%的最大生命值。
--移花接木    瞬发                15能量        从你所有的疗伤珠中吸取有益的真气，排出有害的真气，对最近一名敌人造成相当于治疗量10%的伤害。
                            
--玄牛酒    瞬发        2分钟冷却时间                喝下玄牛酒，立即充满能量，并恢复铁骨酒与活血酒的充能层数。
--躯不坏    瞬发        2分钟冷却时间                使你在10秒内受到的所有伤害降低20%到50%。伤害越高，减伤比例越高。
--金钟罩    瞬发        30秒冷却时间                抵挡将要承受的攻击，将醉拳即将化解的42,747点伤害改为防止此伤害。
                            
vars["酒充能"] = #活血酒#:GetChargeInfo()
vars["酒数量"] = vars["酒充能"].Charges


if vars["酒数量"] == 0 then
    return CastNoTarget(#玄牛酒#, vars["3秒总伤害"] > 0.15 and vars["酒充能"].Cooldown > 2 * gcdmax and talent["玄牛酒"])
end
if player.Debuff:Has("轻度醉拳") then
    vars["醉拳等级"] = 1
elseif player.Debuff:Has("中度醉拳") then
    vars["醉拳等级"] = 2
elseif player.Debuff:Has("重度醉拳") then
    vars["醉拳等级"] = 3
else
    vars["醉拳等级"] = 0
    return --无醉拳
end

vars["铁骨酒时间"] = player.Buff:Get("铁骨酒"):GetTimeLeft()
if playerHealthPercent < 0.95 then
    v = CastNoTarget(#铁骨酒#, vars["铁骨酒时间"] < 1 or (vars["铁骨酒时间"] < 2 and vars["3秒总伤害"] > 0.15 and vars["醉拳等级"] < 3)) if v then return v end
end

v = CastNoTarget(#活血酒#, vars["醉拳等级"] == 3 or (vars["醉拳等级"] == 2 and vars["酒充能"]:IsReachedOrSoon(3, 2))) if v then return v end

