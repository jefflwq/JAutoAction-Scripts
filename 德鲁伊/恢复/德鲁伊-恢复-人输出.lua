--德鲁伊-恢复-人输出
local v

vars["目标预计死亡时间"] = target:TimeToDie()
v = CastDebuffOnTarget(#阳炎术#, 5.3, vars["目标预计死亡时间"]) if v then return v end
v = CastDebuffOnTarget(#月火术#, 4.5, vars["目标预计死亡时间"]) if v then return v end

if vars["团血安全"] then
    if talent["平衡亲和"] then
        v = CastNoTarget(#枭兽形态#) if v then return v end
    elseif talent["野性亲和"] and targetRange < 5 then
        v = CastNoTarget(#猎豹形态#) if v then return v end
    end
end
--if SwitchIsOn("切换敌方") then
--    return TabForDebuff("月火术", 4.5)
--end
v = CastOnTarget(#阳炎之怒#) if v then return v end
v = CastOnTarget(#月火术#) if v then return v end


