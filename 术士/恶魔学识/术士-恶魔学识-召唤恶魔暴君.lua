--术士-恶魔学识-召唤恶魔暴君
if #召唤恶魔暴君#:GetCooldown() > 7 then
    return
end
local v
v = CastOnTarget(#魔典：恶魔卫士#, talent["魔典：恶魔卫士"]) if v then return v end
v = CastOnTarget(#召唤邪犬#, talent["召唤邪犬"]) if v then return v end
v = CastOnTarget(#召唤恐惧猎犬#) if v then return v end
return CastNoTarget(#召唤恶魔暴君#)
