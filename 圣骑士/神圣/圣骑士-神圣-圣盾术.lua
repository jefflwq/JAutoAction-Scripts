--圣骑士-神圣-圣盾术
if playerHealthPercent > 0.2 then
    return 
end
if not #圣盾术#:ReadyIn(0.2) then
    return 
end
if player.Debuff:Has("自律") then
    return 
end
if playerHealthPercent > 0.15 and player.Buff:Has("圣佑术") then
    return 
end
return #圣盾术#
