--圣骑士-惩戒-输出

local v
vars["神圣能量"] = player:GetPower(@神圣能量@)
vars["神圣能量差"] = player:GetPowerDeficit(@神圣能量@)

vars["异端裁决时间"] = player.Buff:Get("异端裁决"):GetTimeLeft()
v = CastNoTarget(#异端裁决#, targetRange < 5 and (vars["异端裁决时间"] < 2 * gcd or (vars["异端裁决时间"] < 5 and player:GetPower(@神圣能量@) > 2))) if v then return v end
v = CastNoTarget(#神圣风暴#, targetRange < 5 and player.Buff:Has("苍穹之力")) if v then return v end

v = run("爆发技能") if v then return v end
v = run("终结技") if v then return v end
v = run("普通技能") if v then return v end


