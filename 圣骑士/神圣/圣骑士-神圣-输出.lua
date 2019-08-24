--圣骑士-神圣-输出
local v
v = CastOnTarget(#审判#) if v then return v end
v = CastOnTarget(#神圣棱镜#, vars["40码平均血量"] < 0.95 and talent["神圣棱镜"]) if v then return v end
v = CastNoTarget(#奉献#, targetRange < 6 and GetEnemyDebuffCount("奉献") == 0) if v then return v end
v = CastOnTarget(#十字军打击#) if v then return v end
v = CastOnTarget(#神圣震击#, SwitchIsOn("输出震击")) if v then return v end
