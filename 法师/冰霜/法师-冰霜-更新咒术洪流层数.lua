--法师-冰霜-更新咒术洪流层数
if not talent["咒术洪流"] then
    return
end
vars["咒术洪流层数"] = player.Buff:Get("咒术洪流").Count
if vars["咒术洪流层数"] ~= vars["上次咒术洪流层数"] then
    if vars["咒术洪流层数"] == 1 then
        vars["下次咒术洪流层数"] = 2
    elseif vars["咒术洪流层数"] == 5 then
        vars["下次咒术洪流层数"] = 4
    elseif vars["咒术洪流层数"] > vars["上次咒术洪流层数"] then
        vars["下次咒术洪流层数"] = vars["咒术洪流层数"] + 1
    elseif vars["咒术洪流层数"] < vars["上次咒术洪流层数"] then
        vars["下次咒术洪流层数"] = vars["咒术洪流层数"] - 1
    end
    vars["上次咒术洪流层数"] = vars["咒术洪流层数"]
end
