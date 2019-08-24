--德鲁伊-平衡-枭兽输出
vars["目标预计死亡时间"] = target:TimeToDie()
vars["星界能量"] = player:GetPower(@星界能量@)
vars["星界能量差值"] = player:GetPowerDeficit(@星界能量@)

local v
v = run("爆发技能") if v then return v end
v = AoeAtCursor(#~星辰坠落#, 10, 15, 0.65, 3, 3, SwitchIsOn("星辰坠落")) if v and v ~= 0 then return v end
v = run("自然之力") if v then return v end

v = CastOnTarget(#艾露恩之怒#, vars["星界能量差值"] >= 20 and talent["艾露恩之怒"]) if v then return v end

v = run("日月光效") if v then return v end
v = CastNoTarget(#艾露恩的战士#,  vars["月光增效数量"] > 1 and talent["艾露恩的战士"]) if v then return v end

v = CastDebuffOnTarget(#阳炎术#, 5.3, vars["目标预计死亡时间"], 8, vars["星界能量差值"] > 2) if v then return v end
v = CastDebuffOnTarget(#月火术#, 6.5, vars["目标预计死亡时间"], 8, vars["星界能量差值"] > 2) if v then return v end
--if SwitchIsOn("切换敌方") then
--    --return TabForDebuff("月火术", 5.5)
--end

v = CastDebuffOnTarget(#星辰耀斑#, 6.5, vars["目标预计死亡时间"], 8, vars["星界能量差值"] > 7 and talent["星辰耀斑"] and not #星辰耀斑#:CastedIn(2)) if v then return v end
--if SwitchIsOn("切换敌方") then
--    return TabForDebuff("星辰耀斑", 7.1)
--end

v = CastOnTarget(#星涌术#, vars["月光增效数量"] < 3 and vars["日光增效数量"] < 3 and (vars["星界能量"] > 55 or player:UpdateNearbyInfo(50).EnemyCount < 3)) if v then return v end

vars["星辰漂流"] = player.Buff:Has("星辰漂流") 

v = CastOnTarget(#新月#, talent["新月"] and vars["星界能量差值"] >= #新月#.Tag, vars["星辰漂流"]) if v then return v end

v = CastOnTarget(#明月打击#, vars["月光增效数量"] > 0 and vars["日光增效数量"] < 3 and talent["艾露恩的战士"] and player.Buff:Has("艾露恩的战士"), true) if v then return v end
v = run("日月光") if v then return v end
v = CastOnTarget(#阳炎之怒#, vars["日光增效数量"] > 0 and vars["月光增效数量"] < 3, vars["星辰漂流"]) if v then return v end

v = CastOnTarget(#明月打击#, vars["月光增效数量"] == 0 and vars["日光增效数量"] < 3 and target:UpdateNearbyInfo(8).EnemyCount > 0, vars["星辰漂流"] or player.Buff:Has("艾露恩的战士")) if v then return v end

v = CastOnTarget(#阳炎之怒#, nil, vars["星辰漂流"]) if v then return v end
v = CastOnTarget(#月火术#) if v then return v end
