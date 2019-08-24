--武僧-踏风-aoe
local v
v = CastNoTarget(#碧玉疾风#, talent["碧玉疾风"] and vars["上一个技能"] ~= "碧玉疾风") if v then return v end
if vars["上一个技能"] ~= "神鹤引项踢" and GetSpellCount("神鹤引项踢") > 4 then
    if vars["真气"] < 2 then
        return run("攒真气", 2)
    end
    v = CastNoTarget(#神鹤引项踢#, vars["真气"] > 1) if v then return v end
end

v = CastOnTarget(#幻灭踢#, vars["上一个技能"] ~= "幻灭踢") if v then return v end
v = AoeFront(#真气爆裂#, 15, 90, 15, 0.6, 2, 1, vars["真气差"] >= 2 and talent["真气爆裂"]) if v then return v end
v = CastOnTarget(#猛虎掌#, vars["真气差"] >= 2 and vars["上一个技能"] ~= "猛虎掌") if v then return v end
v = CastOnTarget(#真气波#, talent["真气波"]) if v then return v end
v = CastOnTarget(#猛虎掌#, vars["真气差"] >= 2 and vars["能量回满时间"] < 1) if v then return v end
