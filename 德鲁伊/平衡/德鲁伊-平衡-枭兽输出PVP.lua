--德鲁伊-平衡-枭兽输出PVP
vars["目标预计死亡时间"] = target:TimeToDie()
vars["星界能量"] = player:GetPower(@星界能量@)
vars["星界能量差值"] = player:GetPowerDeficit(@星界能量@)
vars["星辰漂流"] = player.Buff:Has("星辰漂流") 
--#新月#:UpdateName()
run("更新新半满月")
local v
v = run("日月光效") if v then return v end
if SwitchIsOn("输出爆发") then -- 爆发
    v = run("自然之力") if v then return v end
    v = run("爆发技能") if v then return v end
    v = CastOnTarget(#新月#, #新月#.Name == "满月" and talent["新月"] and player:GetCastingSpell() ~= "满月", vars["星辰漂流"]) if v then return v end
    v = CastOnTarget(#星涌术#) if v then return v end
    v = CastNoTarget(#艾露恩的战士#,  vars["月光增效数量"] > 1 and talent["艾露恩的战士"]) if v then return v end
    v = run("PVP明月打击") if v then return v end
    v = CastOnTarget(#明月打击#, player.Buff:Has("艾露恩的战士"), true) if v then return v end
    v = CastOnTarget(#艾露恩之怒#, vars["星界能量差值"] >= 20 and talent["艾露恩之怒"]) if v then return v end
end
--平稳
v = CastDebuffOnTarget(#阳炎术#, 5.3, vars["目标预计死亡时间"], 8, vars["星界能量差值"] > 2) if v then return v end
v = CastDebuffOnTarget(#月火术#, 6.5, vars["目标预计死亡时间"], 8, vars["星界能量差值"] > 2) if v then return v end
v = CastDebuffOnTarget(#星辰耀斑#, 6.5, vars["目标预计死亡时间"], 8, vars["星界能量差值"] > 7 and talent["星辰耀斑"] and not #星辰耀斑#:CastedIn(2)) if v then return v end
v = CastOnTarget(#星涌术#, vars["星界能量"] >= 85) if v then return v end
v = CastOnTarget(#新月#, #新月#.Name ~= "满月" and talent["新月"] and player:GetCastingSpell() ~= "半月", vars["星辰漂流"]) if v then return v end

--v = run("星辰坠落") if v then return v end
v = run("日月光") if v then return v end
v = CastOnTarget(#阳炎之怒#, nil, vars["星辰漂流"]) if v then return v end
v = CastOnTarget(#月火术#) if v then return v end
