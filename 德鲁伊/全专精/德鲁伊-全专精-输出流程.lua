--德鲁伊-全专精-输出流程
local v
v = run("治疗石") if v then return v end
--v = run("远程拾取器") if v then return v end
if player.Buff:Has("熊形态") then
    v = run("各形态流程", "熊") if v then return v end
elseif player.Buff:Has("猎豹形态") then
    v = run("各形态流程", "猎豹") if v then return v end
elseif player.Buff:Has("旅行形态") then
    return run("旅行保命")
elseif player.Buff:Has("枭兽形态") then
    v = run("各形态流程", "枭兽") if v then return v end
else --人形态
    v = run("各形态流程", "人") if v then return v end
    --if vars["当前专精"] == "恢复" then
    --    return run("治疗流程")
    --else
    --    return run("各形态流程", "人")
    --end
end


