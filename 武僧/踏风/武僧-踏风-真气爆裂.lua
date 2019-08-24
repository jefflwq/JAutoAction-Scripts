--武僧-踏风-真气爆裂
if not talent["真气爆裂"] or not #真气爆裂#:CanBeUsedOnTarget(0.2) then
    return
end
if player:GetPowerDeficit(@真气@) < 2 then
    return
end

local nc = player:UpdateFrontInfo(10)
--print("真气爆裂", nc.PlayerFront.EnemyCount, nc.EnemyCount)
if nc.EnemyCount >= 1  then
    return #真气爆裂#
end
