--战士-防护-_专精初始化
run("全专精-_专精初始化")
if talent["报复"] then
    vars["报复：无视苦痛"] = nil
    vars["报复：复仇"] = nil
end
AddPriorMacro("震荡波")
AddPriorMacro("天神下凡")
AddPriorMacro("挫志怒吼")
--AddPriorMacro("法术反射")
AddSpellSwitch("拦截")
AddSpellSwitch("盾牌格挡")
AddSpellSwitch("挫志怒吼")
AddSpellSwitch("盾墙")
AddSpellSwitch("破釜沉舟")
AddSpellSwitch("法术反射")
if talent["破坏者"] then AddSpellSwitch("破坏者") end
