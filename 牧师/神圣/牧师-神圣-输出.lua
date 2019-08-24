--牧师-神圣-输出
local v
v = DispelEnemy(#驱散魔法#, SwitchIsOn("驱散魔法"), "Magic") if v then return v end
v = CastOnTarget(#神圣之火#) if v then return v end
v = CastOnTarget(#圣言术：罚#) if v then return v end
v = AoeAround(#神圣新星#, 12, 15, 0.65, 3, 3) if v then return v end
v = CastOnTarget(#惩击#) if v then return v end
