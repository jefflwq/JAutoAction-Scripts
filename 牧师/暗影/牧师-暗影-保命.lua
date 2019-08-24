--牧师-暗影-保命
local v
v = AddSelfShield(#我_真言术：盾#, not player:HasDebuff("虚弱灵魂")) if v then return v end
if instance:InPVE() then
    v = CastOnTarget(#吸血鬼的拥抱#, playerHealthPercent < 0.4) if v then return v end
else
    v = CastOnTarget(#吸血鬼的拥抱#, playerHealthPercent < 0.5) if v then return v end
    v = CastNoTarget(#我_暗影愈合#, playerHealthPercent <= 0.3 and player:GetPowerPercent(@法力@) > 0.3) if v then return v end
end
v = CastOnTarget(#消散#, playerHealthPercent < 0.2) if v then return v end
v = AddRaidBuff(#我_真言术：韧#) if v then return v end
