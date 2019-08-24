--法师-奥术-正在引导法术
local spellName = player:GetChannelingSpell()
if not spellName then
    return
end
if spellName ~= "唤醒" then
    return true
end
return player:GetPowerPercent(@法力@) < 0.95