--德鲁伊-全专精-保命
UpdateReduce("player")
vars["3秒总伤害"] = playerHealthWatcher:GetRecentDamagePercent(3)
local specId =  GetSpecialization()
if specId == 1 then --平衡
    return run("枭兽保命")
elseif specId == 2 then --野性
    return run("猎豹保命")
elseif specId == 3 then --守护
    return run("熊保命")
elseif specId == 4 then --恢复
    return run("人保命")
end

