--战士-武器-剑刃风暴
if not SwitchIsOn("剑刃风暴") then
    return
end
if talent["破坏者"] then
    return
end
if targetRange > 5 then
    return
end
if not #剑刃风暴#:ReadyIn(0.2) then
    return
end
if not target:IsInFrontOfPlayer(5, 20) then
    return
end

if player.Buff:Has("横扫攻击") then
    return
end
if player.Buff:Has("致命平静") then
    return
end
if vars["附近敌人数量"] > 4 then
    return #剑刃风暴#
end
if targetHealthPercent <= vars["斩杀血量"] and targetHealth > playerHealthMax then
    return #剑刃风暴# --斩杀阶段，并且目标比玩家血量多
end
--65%以上的敌人在附近，或者至少3个以上
if not player:EnemyAlmostNearby(8, 12, 0.65, 3) then
    return 
end
if azerite:IsEnabled("力量的考验") then
    --有艾泽里特 力量的考验
    if player.Buff:Has("力量的考验") then
        return #剑刃风暴#
    end
else
    --巨人打击剩余4.5秒以上
    if target.Debuff:Get("巨人打击"):GetTimeLeft() > 4.5 then
        return #剑刃风暴#
    end
end
