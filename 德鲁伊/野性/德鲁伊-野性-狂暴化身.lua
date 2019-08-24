--德鲁伊-野性-狂暴化身
if talent["化身：丛林之王"] then
    local v = CastNoTarget(#化身：丛林之王#, targetRange < 6 and vars["能量差"] > 50) if v then return v end
    if player.Buff:Has("丛林捕猎者") then
        vars["丛林捕猎者"] = GetTime()
        return #潜行#
    end
    if vars["丛林捕猎者"] and GetTime() - vars["丛林捕猎者"] < 0.7 then
        return 0
    else
        vars["丛林捕猎者"] = 0
    end
else
    return CastNoTarget(#狂暴#, targetRange < 6 and (#猛虎之怒#:GetCooldown() < 10 or vars["能量差"] < 20))
end
