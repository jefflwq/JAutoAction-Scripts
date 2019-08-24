--德鲁伊-全专精-输出基础流程
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
--v = run("宠物攻击") if v then return v end
local form = ...
if run("在PVP战斗中") then
    if SwitchIsOn("AOE") then
        v = tryrun(form .. "输出PVP", form .. "AOE输出PVP", form .. "单体输出PVP", form .. "输出", form .. "AOE输出", form .. "单体输出") if v then return v end
    else
        v = tryrun(form .. "输出PVP", form .. "单体输出PVP", form .. "输出", form .. "单体输出") if v then return v end
    end
else
    if SwitchIsOn("AOE") then
        v = tryrun(form .. "输出", form .. "AOE输出", form .. "单体输出") if v then return v end
    else
        v = run(form .. "输出", form .. "单体输出") if v then return v end
    end
end
