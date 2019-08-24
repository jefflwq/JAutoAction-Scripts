--萨满祭司-元素-爆发技能
if not run("需要开爆发吗") then
    return
end
local v
--3、使用火元素如果冷却好了，并且尽可能的在有急速BUFF(如嗜血)时使用，但是不要强求导致延迟太久释放，推迟后边的火元素。
v = CastOnTarget(vars["风火元素"], not UnitExists("pet"))
if v then
    if talent["图腾掌握"] and totems:Update("图腾掌握") < 30 then
        return #图腾掌握#
    end
    return v 
end
v = vars["风火元素"]:GetCooldown()
if (v < 10 or v > 25) and not player.Buff:Has("升腾") then
    return
end
--4、使用土元素如果冷却好了，并且你没有使用元素尊者天赋，或者你的火元素并没有在场上。因为你不能同时有两个尊者元素在场上。

v = CastOnTarget(#土元素#, not UnitExists("pet")) if v then return v end
v = CastNoTarget(vars["药水"], vars["药水"] and boss.Exists or false) if v then return v end
v = CastNoTarget(vars["种族爆发"], UnitRace("player")~="血精灵" or vars["漩涡差值"] > 30) if v then return v end
return run("开饰品")
