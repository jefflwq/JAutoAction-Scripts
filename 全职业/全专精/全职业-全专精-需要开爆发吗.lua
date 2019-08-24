--全职业-全专精-需要开爆发吗
local ignoreSwitch = ...
if not ignoreSwitch and not SwitchIsOn("输出爆发") then
    return
end
if boss.Exists or instance:InPVE() then
    if boss.Exists and not boss.InCombat then
        --print("boss存在但不在战斗")
        return
    end

    if boss.InCombat then
        if (boss.IsTarget or targetHealth > playerHealthMax * 5) then
            return true
        end
        return
    end
    if target:UpdateNearbyInfo(10).EnemyCount > 2 then
        return true
    end
elseif UnitIsPlayer("target") then
    if targetHealthPercent <= 0.5 then
        return true
    end
else
    if targetHealth > playerHealthMax * 1.3 or targetHealth > playerHealth * 1.5 then
        return true
    end
end

