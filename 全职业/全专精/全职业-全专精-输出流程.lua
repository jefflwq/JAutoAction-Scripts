--全职业-全专精-输出流程
--通过run执行脚本的时候，如果当前执行主脚本的名字作为前缀的脚本存在，则会优先执行
--例如在执行run("基本检查")，如果存在【默认基本检查】，则该脚本会优先被执行
local v
v = run("治疗石") if v then return v end
--v = run("远程拾取器") if v then return v end
v = run("保命") if v then return v end
v = run("打爆炸物") if v then return v end
if SwitchIsOn("切换敌方") then
    v = unitSelector:SelectAEnemy(true) if v then return v end
end

if target:CanBeAttacked() then
    v = run("输出基础流程") if v then return v end
    if InCombatLockdown() then
        return run("自动攻击")
    end
end
if target:CanBeAssisted() then
    return run("治疗")
end
