--德鲁伊-全专精-熊输出
local v
v = CastOnTarget(#裂伤#) if v then return v end
vars["附近敌人数量"] = player:UpdateNearbyInfo(6).EnemyCount
v = CastNoTarget(#痛击#, vars["附近敌人数量"] > 0) if v then return v end
v = CastDebuffOnTarget(#月火术#, 4.5) if v then return v end
--if SwitchIsOn("切换敌方") then
--    --return TabForDebuff("月火术", 4.5)
--end
v = CastNoTarget(#横扫#, vars["附近敌人数量"] > 0 and (vars["当前专精"] ~= "恢复" or talent["野性亲和"])) if v then return v end

v = CastOnTarget(#野性冲锋#, talent["野性冲锋"] and SwitchIsOn("野性冲锋")) if v then return v end
v = CastOnTarget(#月火术#) if v then return v end
