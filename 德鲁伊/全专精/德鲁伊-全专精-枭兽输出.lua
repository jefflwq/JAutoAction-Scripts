--德鲁伊-全专精-枭兽输出
--德鲁伊-全专精-枭兽单体输出
local v
run("日月光效")

vars["目标预计死亡时间"] = target:TimeToDie()
v = CastDebuffOnTarget(#阳炎术#, 5.3, vars["目标预计死亡时间"]) if v then return v end
v = CastOnTarget(#星涌术#, vars["月光增效数量"] < 3 and vars["日光增效数量"] < 3) if v then return v end
v = CastDebuffOnTarget(#月火术#, 4.5, vars["目标预计死亡时间"]) if v then return v end
--if SwitchIsOn("切换敌方") then
--    --return TabForDebuff("月火术", 4.5)
--end
if vars["月光增效数量"] > vars["日光增效数量"] then
    v = CastOnTarget(#明月打击#) if v then return v end
else
    v = CastOnTarget(#阳炎之怒#) if v then return v end
end
v = CastOnTarget(#月火术#) if v then return v end
