--恶魔猎手-浩劫-打爆炸物技能
local v
v = CastOnTarget(#邪能之刃#, talent["邪能之刃"]) if v then return v end
v = CastOnTarget(#混乱打击#) if v then return v end
v = CastOnTarget(#恶魔之咬#, talent["恶魔之刃"]) if v then return v end
v = CastOnTarget(#刃舞#) if v then return v end
v = CastOnTarget(#投掷利刃#) if v then return v end
