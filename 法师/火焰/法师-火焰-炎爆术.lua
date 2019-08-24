--法师-火焰-炎爆术
if not #炎爆术#:CanBeUsedOnTarget(0.2) then
    return
end
if vars["炽热连击"] then
    local v = run("额外能量符文", not talent["火焰冲撞"] and #燃烧#) if v then return v end
    return #炎爆术#
end
if not talent["火焰冲撞"] then
    return
end
if player.Buff:Get("火焰冲撞").Count == 0 then
    return
end
local v = run("额外能量符文", #冰冷血脉#) if v then return v end
if player.Buff["火焰冲撞"].Count == 2 then
    return #炎爆术#
end
if player:GetCastingSpell() ~= "炎爆术" and not #炎爆术#:IsCasting() then-- and GetLastSpell() ~= "炎爆术" 
    return #炎爆术#
end