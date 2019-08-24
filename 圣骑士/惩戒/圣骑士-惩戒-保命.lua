--圣骑士-惩戒-保命

local v
v = CastNoTarget(#我_圣光闪现#, playerHealthPercent < 0.85 and (#圣光闪现#:GetCurrentCastingTime() == 0)) if v then return v end
--v = CastNoTarget(#我_圣光闪现#, playerHealthPercent < 0.85 and (#圣光闪现#:GetCurrentCastingTime() == 0 or player.Buff:Has("圣盾术"))) if v then return v end
v = CastNoTarget(#我_荣耀圣令#, playerHealthPercent < 0.3 and talent["荣耀圣令"]) if v then return v end

local damage = playerHealthWatcher:GetRecentDamagePercent(2)
if damage > 0.15 or playerHealthPercent < 0.35 then
    v = CastNoTarget(#以眼还眼#, damage > 0.25 or not player.Buff:Has("复仇之盾")) if v then return v end
    v = CastNoTarget(#复仇之盾#, damage > 0.25 or not player.Buff:Has("以眼还眼")) if v then return v end
end

v = CastNoTarget(#圣盾术#, playerHealthPercent < 0.2) if v then return v end
v = CastNoTarget(#我_圣疗术#, playerHealthPercent < 0.2) if v then return v end
v = AddRaidBuff(#我_强效王者祝福#) if v then return v end
