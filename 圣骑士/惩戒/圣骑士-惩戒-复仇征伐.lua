--圣骑士-惩戒-复仇征伐

if not vars["嗜血中"] and (vars["种族爆发"] and not vars["种族爆发"]:CanBeUsedOnTarget(2 * gcdmax)) then
    return
end
vars["复仇征伐冷却"] = vars["复仇征伐"]:GetCooldown()
if vars["复仇征伐冷却"] > 4 * gcdmax then
    return 
end
vars["神圣能量差"] = player:GetPowerDeficit(@神圣能量@)
if vars["复仇征伐冷却"] < gcdmax then
    if vars["神圣能量差"] < 2 then
        return vars["复仇征伐"]
    else
        return run("普通技能") or 0
    end
end
if vars["神圣能量差"] > 0 then --未满
    return run("普通技能") or 0
end
