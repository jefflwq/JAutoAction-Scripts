--德鲁伊-全专精-猎豹输出
--德鲁伊-全专精-猎豹单体输出
--德鲁伊-全专精-猎豹输出
vars["连击点"] = player:GetPower(@连击点@)
vars["能量"] = player:GetPower(@能量@)

local v
if vars["连击点"] == 5 then
    v = CastDebuffOnTarget(#割裂#, 7) if v then return v end
    v = CastOnTarget(#凶猛撕咬#) if v then return v end
else
    v = CastDebuffOnTarget(#斜掠#, 4.5) if v then return v end
    --if SwitchIsOn("切换敌方") and vars["能量"] >= 35 then
    --    return TabForDebuff("斜掠", 7)
    --end
    v = CastNoTarget(#横扫#, player:UpdateNearbyInfo(5).EnemyCount > 2) if v then return v end
    v = CastOnTarget(#撕碎#, vars["能量"] > 60) if v then return v end
end
v = CastOnTarget(#野性冲锋#, talent["野性冲锋"] and SwitchIsOn("野性冲锋")) if v then return v end

