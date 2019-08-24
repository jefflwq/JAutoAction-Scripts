--萨满祭司-增强-爆发技能
if not run("需要开爆发吗") then
    return
end
local v
v = CastOnTarget(#土元素#) if v then return v end
v = CastOnTarget(#野性狼魂#) if v then return v end
if talent["升腾"] then
    v = CastNoTarget(#升腾#) 
    if v then
        if vars["图腾掌握时间"] < 15 then
            return #图腾掌握#
        end
        return v 
    end
    if not player.Buff:Has("升腾") then
        return
    end
else
    if not player.Buff:Has("野性狼魂") then
        return
    end
end
v = CastNoTarget(vars["药水"], vars["药水"] and boss.Exists or false) if v then return v end
v = CastNoTarget(vars["种族爆发"], UnitRace("player")~="血精灵" or vars["漩涡差值"] > 30) if v then return v end
return run("开饰品")
