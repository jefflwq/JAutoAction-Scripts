--死亡骑士-鲜血-血液沸腾
if targetRange > 5 then
    return
end
if not #血液沸腾#:CanBeUsedOnTarget(0.2) then
    return
end
if not player:EnemyAlmostNearby(10, 15, 0.65, 1) then
    return
end
if #血液沸腾#:GetChargeInfo():IsReachedOrSoon() then
    return #血液沸腾#
end
local count = player:UpdateNearbyInfo(10).EnemyCount
if count == 1 then
    if target.Debuff:Has("血之疫病") then
        return
    end
    return  #血液沸腾#
end

local debuffCount = GetEnemyDebuffCount("血之疫病", 10)
if count - debuffCount > 1 then
    return #血液沸腾#
end
if count - debuffCount == 1 then
    if #血液沸腾#:GetChargeInfo():IsReachedOrSoon() then
        return #血液沸腾#
    end
end
