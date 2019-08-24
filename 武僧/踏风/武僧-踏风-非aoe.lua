--武僧-踏风-非aoe
local v
v = CastOnTarget(#猛虎掌#, vars["真气差"] >= 2 and (vars["上一个技能"] ~= "猛虎掌" or vars["能量回满时间"] < 1)) if v then return v end
v = CastOnTarget(#旭日东升踢#, vars["真气"] > 2 or player.Buff:Has("屏气凝神")) if v then return v end
v = CastOnTarget(#幻灭踢#, vars["上一个技能"] ~= "幻灭踢") if v then return v end
v = AoeFront(#真气爆裂#, 15, 90, 15, 0.6, 2, 1, vars["真气差"] >= 2 and talent["真气爆裂"]) if v then return v end
v = CastOnTarget(#猛虎掌#, vars["真气差"] >= 2 and vars["上一个技能"] ~= "猛虎掌") if v then return v end
v = CastOnTarget(#真气波#, talent["真气波"]) if v then return v end
--v = CastOnTarget(#旭日东升踢#, vars["真气"] > 2) if v then return v end
v = CastOnTarget(#幻灭踢#, vars["真气"] > 3) if v then return v end
v = CastOnTarget(#猛虎掌#) if v then return v end
