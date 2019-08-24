--武僧-织雾-正在引导法术
vars["正在引导的法术"] = player:GetChannelingSpell()
if not vars["正在引导的法术"] then
    return
end
return vars["正在引导的法术"] ~= "抚慰之雾" 