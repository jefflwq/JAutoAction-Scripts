--猎人-野兽控制-打爆炸物技能
local v
v = CastOnTarget(#奇美拉射击#, talent["奇美拉射击"]) if v then return v end
vars["目标数量"] = target:UpdateNearbyInfo(8).EnemyCount + 1
vars["野兽顺劈时间"] = pet.Buff:Get("野兽顺劈"):GetTimeLeft()
v = CastOnTarget(#多重射击#, SwitchIsOn("AOE") and vars["野兽顺劈时间"] < gcdmax and vars["目标数量"] > 1) if v  then return v end  --保持损劈
v = CastOnTarget(#眼镜蛇射击#) if v then return v end
