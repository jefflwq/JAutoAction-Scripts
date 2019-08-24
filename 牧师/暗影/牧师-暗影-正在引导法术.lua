--牧师-暗影-正在引导法术
vars["正在引导的法术"] = player:GetChannelingSpell()
if not vars["正在引导的法术"] then
    return
end
if vars["正在引导的法术"] == "精神鞭笞" and UnitSpellHaste("player") > 50 then
    return
end
return true