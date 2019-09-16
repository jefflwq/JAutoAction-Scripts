--圣骑士-神圣-治疗
local v
v = HealSingle(#_圣疗术#, vars["治疗对象血量"] < 0.2) if v then return v end
v = CastOnTarget(#牺牲祝福#, targetHealthPercent < 0.4 and not UnitIsUnit("target", "player") and (UnitInRaid("target") or UnitInParty("target")) and (playerHealthPercent > 0.6 or player.Buff:Has("圣盾术"))) if v then return v end
v = CastNoTarget(#神圣复仇者#, vars["团血危急"] and talent["神圣复仇者"] and not player.Buff:Has("复仇十字军") and (vars["40码平均血量"] < 0.5 or not player.Buff:Has("复仇之怒"))) if v then return v end
v = CastNoTarget(#光环掌握#, vars["团血危急"]) if v then return v end

if vars["团血危急"] and (vars["40码平均血量"] < 0.45 or not player.Buff:Has("神圣复仇者")) then
    if talent["复仇十字军"] then
        v = CastNoTarget(#复仇十字军#, targetRange < 5)
    else
        v = CastNoTarget(#复仇之怒#)
    end
end

if vars["治疗对象血量"] < 0.6 then
    v = HealSingle(#_神圣震击#) if v then return v end
    v = HealSingle(#_神圣棱镜#, talent["神圣棱镜"]) if v then return v end
    v = CastOnTarget(#殉道者之光#, targetHealthPercent < 0.4 and not UnitIsUnit("target", "player") and target:CanBeAssisted() and (playerHealthPercent > 0.4 or player.Buff:Has("圣盾术"))) if v then return v end
    v = HealSingle(#_圣光闪现#) if v then return v end
end
v = HealSingle(#_神圣震击#, vars["治疗对象血量"] < 0.8 or (vars["治疗对象血量"] < 0.85 and player:IsMoving())) if v then return v end
v = HealFront(#黎明之光#, 15, 90, 0.9, 3) if v then return v end
v = CastNoTarget(#美德道标#, vars["40码平均血量"] < 0.8 and talent["美德道标"]) if v then return v end
v = CastOnTarget(#殉道者之光#, targetHealthPercent < 0.4 and not UnitIsUnit("target", "player") and target:CanBeAssisted() and (playerHealthPercent > 0.4 or player.Buff:Has("圣盾术"))) if v then return v end
v = CastNoTarget(#律法之则#, talent["律法之则"] and ((vars["40码平均血量"] < 0.7 or vars["治疗对象血量"] < 0.5) or ((vars["40码平均血量"] < 0.9 or vars["治疗对象血量"] < 0.7) and #律法之则#:GetChargeInfo():IsReachedOrSoon()))) if v then return v end
v = HealSingle(#_赋予信仰#, talent["赋予信仰"] and vars["治疗对象血量"] < 0.85) if v then return v end

v = HealSingle(#_神圣棱镜#, talent["神圣棱镜"] and vars["治疗对象血量"] < 0.8) if v then return v end
v = HealSingle(#_圣光术#, vars["治疗对象血量"] < 0.9 and vars["治疗对象血量"] > 0.6 and player.Buff:Has("圣光灌注") and not (vars["治疗对象血量"] > 0.80 and #圣光术#:CastedIn(3))) if v then return v end
v = HealSingle(#_圣光闪现#, vars["治疗对象血量"] < 0.85 and (vars["治疗对象血量"] < 0.6 or vars["40码平均血量"] < 0.7) and not (vars["治疗对象血量"] > 0.85 and #圣光闪现#:CastedIn(3))) if v then return v end
if player:GetPowerPercent(@法力@) > 0.5 then
    v = HealSingle(#_圣光闪现#, vars["治疗对象血量"] < 0.9 and vars["治疗对象血量"] > 0.6 and not (vars["治疗对象血量"] > 0.85 and #圣光闪现#:CastedIn(3))) if v then return v end
else
    v = HealSingle(#_圣光术#, vars["治疗对象血量"] < 0.9 and vars["治疗对象血量"] > 0.6 and not (vars["治疗对象血量"] > 0.85 and #圣光术#:CastedIn(3))) if v then return v end
end

