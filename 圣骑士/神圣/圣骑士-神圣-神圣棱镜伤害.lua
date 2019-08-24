--圣骑士-神圣-神圣棱镜伤害
if not talent["神圣棱镜"] then
    return
end
if vars["40码平均血量"] > 0.95 then
    return
end

if not #神圣棱镜#:CanBeUsedOnTarget(0.2) then
    return 
end
return #神圣棱镜#


