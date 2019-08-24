--德鲁伊-全专精-治疗
local v
v = run("治疗石") if v then return v end

if player.Buff:Has("熊形态") then
    v = run("熊治疗") if v then return v end
elseif player.Buff:Has("猎豹形态") then
    if vars["当前专精"] == "恢复" and not vars["团血安全"] then
        return #猎豹形态#
    end
    v = run("猎豹治疗") if v then return v end
elseif player.Buff:Has("旅行形态") then
    if vars["当前专精"] == "恢复" and not vars["团血安全"] and instance:InPVE() then
        return #旅行形态#
    end
    return run("旅行保命")
elseif player.Buff:Has("枭兽形态") then
    if vars["当前专精"] == "恢复" and not vars["团血安全"] then
        return #枭兽形态#
    end
    v = run("枭兽治疗") if v then return v end
else --人形态
    return run("人治疗")
end


