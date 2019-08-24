--德鲁伊-全专精-各形态流程
local form = ...
local v
if playerHealthPercent < 0.7 then
    vars["3秒总伤害"] = playerHealthWatcher:GetRecentDamagePercent(3)
    UpdateReduce("player")
    v = run(form .. "保命") if v then return v end
end
v = run("打爆炸物") if v then return v end
if SwitchIsOn("切换敌方") then
    v = unitSelector:SelectAEnemy(true) if v then return v end
end

if target:CanBeAttacked() then
    v = run("输出基础流程", form) if v then return v end
    if InCombatLockdown() then
        return run("自动攻击")
    end
elseif target:CanBeAssisted() then
    vars["治疗对象"] = player
    v = run(form .. "治疗") if v then return v end
    vars["治疗对象"] = target
    v = run(form .. "治疗") if v then return v end
end
