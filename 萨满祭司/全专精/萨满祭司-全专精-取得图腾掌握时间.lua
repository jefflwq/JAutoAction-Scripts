--萨满祭司-全专精-取得图腾掌握时间
if talent["图腾掌握"] then
    if player.Buff:Has("共鸣图腾") and player.Buff:Has("风暴图腾") and player.Buff:Has("余烬图腾") and player.Buff:Has("顺风图腾") then
        vars["图腾掌握时间"] = totems:Update("图腾掌握")
    else
        vars["图腾掌握时间"] = 0
    end
else
    vars["图腾掌握时间"] = 999
end