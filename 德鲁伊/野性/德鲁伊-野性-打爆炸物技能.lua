--德鲁伊-野性-打爆炸物技能
local v
if talent["月之灵"] then
    v = CastOnTarget(#月火术#) if v then return v end
else
    v = CastOnTarget(#斜掠#) if v then return v end
end
