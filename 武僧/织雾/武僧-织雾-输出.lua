--武僧-织雾-输出
local v
v = CastOnTarget(#旭日东升踢#, talent["升腾迷雾"]) if v then return v end
v = AoeAround(#神鹤引项踢#, 8, 10, nil, 5, 5) if v then return v end

v = CastOnTarget(#旭日东升踢#) if v then return v end

v = AoeAround(#神鹤引项踢#, 8, 10, nil, 3, 3) if v then return v end
v = CastOnTarget(#真气波#, vars["40码平均血量"] < 0.95 and talent["真气波"]) if v then return v end
v = CastOnTarget(#猛虎掌#, not player.Buff:Has("禅院教诲")) if v then return v end
v = CastOnTarget(#幻灭踢#) if v then return v end
v = CastOnTarget(#猛虎掌#) if v then return v end
--v = CastOnTarget(#碎玉闪电#) if v then return v end

