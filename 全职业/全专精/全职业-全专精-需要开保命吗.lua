--全职业-全专精-需要开保命吗
if playerHealthPercent > 0.8 then
    return
end
vars["目标是你的数量"] = combatUnits:CountTargetsByEnemies()
if vars["目标是你的数量"] == 0 then
    return
end
if boss.Exists then
    if boss.TargetingYouCount == 0 then
        if vars["目标是你的数量"] < 2 then
            if playerHealthPercent > 0.3 then
                return
            end
        end
        if playerHealthPercent < 0.5 then
            return
        end
    end
end
return true
