--潜行者-狂徒-打爆炸物技能
local v
vars["连击点差"] = player:GetPowerDeficit(@连击点@)
v = CastOnTarget(#手枪射击#, player.Buff:Has("神射手")) if v then return v end
v = CastOnTarget(#手枪射击#, vars["连击点差"] >= (talent["快速拔枪"] and 2 or 1) and player.Buff:Has("可乘之机")) if v then return v end
v = CastOnTarget(#影袭#) if v then return v end
