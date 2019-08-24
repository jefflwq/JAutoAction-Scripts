--法师-冰霜-更新冰冷智慧时间
vars["冰冷智慧时间"] = player.Buff:Get("冰冷智慧"):GetTimeLeft()
if vars["冰冷智慧时间"] > 0 or not talent["黑冰箭"] then
    return
end
if #黑冰箭#:IsCasting() or #黑冰箭#:GetSucceededOnTargetTime() < 0.3 then
    vars["冰冷智慧时间"] = 15
    --print("冰冷智慧时间", vars["冰冷智慧时间"])
end