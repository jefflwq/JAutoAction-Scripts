--法师-全专精-冰霜新星_优先
--法师-全专精-冰霜新星

if player:UpdateNearbyInfo(12).EnemyCount == 0 then
    return
end

if #冰霜新星#:CanBeUsedOnTarget(0.2) and not #冰霜新星#:SucceededIn(3) then
    return #冰霜新星#
end

