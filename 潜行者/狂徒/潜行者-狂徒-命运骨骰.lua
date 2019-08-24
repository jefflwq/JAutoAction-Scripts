--潜行者-狂徒-命运骨骰
if talent["切割"] then
    return
end
if player:GetPowerDeficit(@连击点@) > 0 then
    return
end
if not #命运骨骰#:CanBeUsedOnTarget(0.2) then
    return
end
--当拥有5个连击点数且命运骨骰所带来的战斗增益BUFF≤3秒且目标存活时间>20秒时施放命运骨骰以消耗连击点数
--单BUFF时除了暴击攻速以外都Reroll，双buff除了回能减cd都不reroll
--vars["命运骨骰Buff"] = 
--{
--    "残忍精准",     --正中眉心爆击几率提高60%，其他技能提高20%。
--    "大乱斗",        --攻击速度提高55%。吸血提高25%
--    "骷髅黑帆",        --影袭触发额外攻击提高30%。
--    "强势连击",        --你的攻击获得1个额外的连击点数。且伤害提高20%
--    "埋藏的宝藏",   --每秒能量恢复提高4点
--    "精准定位",        --终结技会使你的许多技能冷却时间缩短，每花费一个连击点数可缩短1秒。
--}
local count = 0
local maxTime = 0
local buffTime = 0
local curBuff = curBuff or {}
for i, v in ipairs(vars["命运骨骰Buff"]) do
    buffTime = player.Buff:Get(v):GetTimeLeft()
    curBuff[i] = buffTime
    if buffTime > 0 then
        count = count + 1
        if maxTime < buffTime then
            maxTime = buffTime
        end
    end
end
if maxTime > 3 then
    if vars["附近敌人数量"] > 2 then
        return
    end
    if vars["附近敌人数量"] > 1 and player.Buff:Get("剑刃乱舞"):GetTimeLeft() > 0 then
        return
    end
    if UnitIsPlayer("target") then
        return
    end
    local timeToDie = target:TimeToDie()
    if timeToDie < 30 then
        return
    end
end
if not boss.Exists then
    if maxTime > 2 then
        return  
    end
    local enemyCount = player:UpdateNearbyInfo(10).EnemyCount
    if enemyCount > 1 then
        return #命运骨骰#
    end
    if enemyCount == 1 then
        if target:TimeToDie() > 5 then
            return #命运骨骰#
        end
    end
    return
end
if maxTime < 3 then
    return #命运骨骰# 
end

if count == 2 then
    --if curBuff[5] > 0 and curBuff[6] > 0 then
    --    return #命运骨骰# 
    --end
    return
end
if count == 1 then
    if curBuff[1] > 0 then --只留残忍精准
    --if curBuff[1] > 0 or curBuff[2] > 0 then --只留残忍精准和大乱斗
        return 
    end
    return #命运骨骰# 
end

