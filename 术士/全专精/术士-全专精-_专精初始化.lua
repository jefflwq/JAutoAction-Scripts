--术士-全专精-_专精初始化
run("全职业-全专精-_专精初始化")
SetAutoAttactMode(false)
local _, _, body = GetMacroInfo("召宠")
if not body or not string.find(body, "spec") then
    AddCharactorMacro("召宠", "INV_MISC_QUESTIONMARK", "#showtooltip\\n/cast [spec:1] 召唤小鬼;[spec:2] 召唤恶魔卫士;[spec:3] 召唤小鬼;")
end
AddSpellSwitch("灵魂石", "我灵魂石")
AddSpellSwitch("制造治疗石", "造治疗石")

SetBreakSpell(#法术封锁#)