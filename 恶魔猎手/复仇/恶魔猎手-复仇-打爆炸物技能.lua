--恶魔猎手-复仇-打爆炸物技能
local v
v = CastOnTarget(#邪能之刃#) if v then return v end
v = CastOnTarget(vars["破裂裂魂"]) if v then return v end
v = CastOnTarget(#投掷利刃#) if v then return v end
