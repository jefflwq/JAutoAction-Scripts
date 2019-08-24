--全职业-全专精-输出基础流程
if not ForceAttack() then
    if not InCombatLockdown() then
        --Debug("防止误开怪")
        return 0
    end
    if not vars["目标需要攻击"] then
        Debug("目标不在战斗中")
        return 0
    end
end
local v
if SwitchIsOn("打断施法") then
    v = run("打断") if v then return v end
end
v = run("宠物攻击") if v then return v end
if run("在PVP战斗中") then
    if SwitchIsOn("AOE") then
        v = tryrun("输出PVP", "AOE输出PVP", "单体输出PVP", "输出", "AOE输出", "单体输出") if v then return v end
    else
        v = tryrun("输出PVP", "单体输出PVP", "输出", "单体输出") if v then return v end
    end
else
    if SwitchIsOn("AOE") then
        v = tryrun("输出", "AOE输出", "单体输出") if v then return v end
    else
        v = tryrun("输出", "单体输出") if v then return v end
    end
end
