--武僧-踏风-输出
vars["真气"] = player:GetPower(@真气@)
vars["真气差"] = player:GetPowerDeficit(@真气@)
vars["真气最大值"] = player:GetPowerMax(@真气@)
--vars["能量"] = player:GetPower(@能量@)
--vars["能量最大值"] = player:GetPowerMax(@能量@)
vars["能量回满时间"] = player:GetPowerTimeToMax(@能量@)
run("取得上一个技能")

local v
vars["3秒总伤害"] = playerHealthWatcher:GetRecentDamagePercent(3)
v = CastOnTarget(#业报之触#, vars["3秒总伤害"] > 0.15) if v then return v end
vars["幻灭踢！时间"] = player.Buff:Get("幻灭踢！"):GetTimeLeft()
v = CastOnTarget(#幻灭踢#,  vars["幻灭踢！时间"] > 0 and vars["幻灭踢！时间"] < gcdmax * 1.2) if v then return v end
vars["附近敌人数量"] = player:UpdateNearbyInfo(8).EnemyCount
if vars["附近敌人数量"] > 2 then
    v = CastNoTarget(#碧玉疾风#, talent["碧玉疾风"] and vars["上一个技能"] ~= "碧玉疾风") if v then return v end
end
v = run("爆发技能") if v then return v end
v = run("轮回之触") if v then return v end
v = run("升龙霸") if v then return v end
v = CastOnTarget(#白虎拳#, vars["真气差"] > 3) if v then return v end
v = CastOnTarget(#旭日东升踢#, vars["旭日功"] and player.Buff:Get("旭日功"):GetTimeLeft() < 2) if v then return v end
--v = AoeAround(#神鹤引项踢#, 8, 10, nil, nil, 3, vars["上一个技能"] ~= "神鹤引项踢" and GetSpellCount("神鹤引项踢") == 5) if v then return v end
v = run("怒雷破") if v then return v end

if vars["附近敌人数量"] > 2 then
    v = run("aoe") if v then return v end
else
    v = run("非aoe") if v then return v end
end

