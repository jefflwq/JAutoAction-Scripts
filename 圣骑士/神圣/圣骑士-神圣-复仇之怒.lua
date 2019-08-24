--圣骑士-神圣-复仇之怒
if vars["40码平均血量"] > 0.6 then
    return
end
if talent["复仇十字军"] then
    return
end
if target:CanBeAttacked() and targetRange > 5 then
    return
end
if not #复仇之怒#:ReadyIn(0.2) then
    return
end
if vars["40码平均血量"] > 0.35 and player.Buff:Has("神圣复仇者") then
    return 
end
return #复仇之怒#
