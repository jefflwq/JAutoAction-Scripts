--战士-狂怒-剑刃风暴
if not SwitchIsOn("剑刃风暴") then
    return
end
if not talent["剑刃风暴"] then
    return
end
if targetRange > 5 then
    return
end
--target:IsInFrontOfPlayer(5, 20)
--if not vars["目标在面前"] then
--    return
--end

if #剑刃风暴#:GetCooldown() > 0.2 then
    return
end
--print("剑刃风暴3")
if vars["怒气"] > 50 then
    return
end
--print("剑刃风暴4")
if vars["激怒时间"] < 2 then
    return
end
--if GetLastSpell() ~= "暴怒" then
--    return
--end

if vars["附近敌人数量"] > 3 then
    return #剑刃风暴#
end
--if talent["破城者"] and not target.Debuff:Has("破城者") then
--    return
--end
if targetHealthPercent <= vars["斩杀血量"] and targetHealth > playerHealthMax then
    return #剑刃风暴# --斩杀阶段，并且目标比玩家血量多
end
--65%以上的敌人在附近，或者至少3个以上
if not player:EnemyAlmostNearby(8, 12, 0.65, 3) then
    return 
end
return #剑刃风暴#
