--牧师-暗影-治疗
local v
v = CastOnTarget(#真言术：盾#, targetHealthPercent < 0.9 and not target.Buff:Has("真言术：盾") and not target:HasDebuff("虚弱灵魂")) if v then return v end
v = CastOnTarget(#暗影愈合#, targetHealthPercent <= 0.5 and player:GetPowerPercent(@法力@) > 0.3) if v then return v end
