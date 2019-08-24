--德鲁伊-平衡-更新新半满月
if not talent["新月"] then
    return
end
if IsUsableSpell("满月") then
    #新月#.Name = "满月"
    #新月#.Tag = 40
    return
end
if IsUsableSpell("半月") then
    #新月#.Name = "半月"
    #新月#.Tag = 20
    return
end
#新月#.Name = "新月"
#新月#.Tag = 10
