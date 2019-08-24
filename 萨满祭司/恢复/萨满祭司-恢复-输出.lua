--萨满祭司-恢复-输出

local v
--if SwitchIsOn("打断施法") then
--    v = run("净化术") if v then return v end
--end
local tm = target.Debuff:Get("烈焰震击"):GetTimeLeft()
--print("tm", tm)
v = CastOnTarget(#烈焰震击#, NeedRefill(tm, 6, target:TimeToDie(), 6)) if v then return v end
local castTm = #熔岩爆裂#:GetCurrentCastingTime()
--print("castTm", castTm)
v = CastOnTarget(#熔岩爆裂#, (tm > castTm) or #烈焰震击#:GetCooldown() < castTm, player.Buff:Has("熔岩奔腾") or player.Buff:Has("灵魂行者的恩赐"), 0.2) if v then return v end
v = CastOnTarget(#闪电链#, target:UpdateNearbyInfo(12).EnemyCount > 0) if v then return v end
v = CastOnTarget(#闪电箭#) if v then return v end
