--潜行者-奇袭-诡诈锁喉中
if not talent["诡诈"] then
    return false
end
if not vars["诡诈锁喉目标"] or not vars["诡诈锁喉预计结束时间"] then
    return false
end
return vars["诡诈锁喉目标"] == UnitGUID("target") and vars["诡诈锁喉预计结束时间"] > GetTime() 