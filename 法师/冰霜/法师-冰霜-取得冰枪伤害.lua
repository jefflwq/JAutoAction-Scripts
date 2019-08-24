--法师-冰霜-取得冰枪伤害
vars["冰枪术伤害"] = #冰枪术#:GetDamage()
vars["是3倍冰枪术伤害"] = false
    --print("取得冰枪伤害",vars["冰枪术伤害"])
if player.Buff:Has("寒冰指") then
    --print("3倍冰枪-寒冰指")
    vars["冰枪术伤害"] = vars["冰枪术伤害"] * 3
    vars["是3倍冰枪术伤害"] = true
    return
end
vars["冰枪术飞行时间"] = vars["冰枪术每码飞行时间"] * targetRange
vars["冰霜新星时间"] = target.Debuff:Get("冰霜新星", false):GetTimeLeft()
if vars["冰霜新星时间"] > vars["冰枪术飞行时间"] then
    --print("3倍冰枪-冰霜新星")
    vars["冰枪术伤害"] = vars["冰枪术伤害"] * 3
    vars["是3倍冰枪术伤害"] = true
    return
end
if target.Debuff:Get("深冬之寒"):GetTimeLeft() > vars["冰枪术飞行时间"] then
    --print("3倍冰枪-深冬之寒")
    vars["冰枪术伤害"] = vars["冰枪术伤害"] * 3
    vars["是3倍冰枪术伤害"] = true
    return
end
if target.Debuff:Get("冰川尖刺"):GetTimeLeft() > vars["冰枪术飞行时间"] then
    --print("3倍冰枪-冰川尖刺")
    if GetLastSpell().Name == "冰枪术" then
        return
    end
    vars["冰枪术伤害"] = vars["冰枪术伤害"] * 3
    vars["是3倍冰枪术伤害"] = true
    return
end
