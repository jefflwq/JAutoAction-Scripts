--全职业-全专精-打爆炸物
if not SwitchIsOn("打爆炸物") then
    return
end
if not vars["打爆炸物距离"] or vars["打爆炸物距离"] < 5 then
    return
end
if not instance:InParty() then
    return
end
local spell = vars["打爆炸物技能"]
local ret = unitSelector:SelectEnemyByName("爆炸物", vars["打爆炸物距离"])
if ret == true then
    if not spell then
        return
    end
    --print("准备打爆炸物")
    for _, v in ipairs(spell) do
        if v and v:CanBeUsedOnTarget(1) then
            return v
        end
    end
elseif ret then
    --print("发现爆炸物")
    return ret
end
