--德鲁伊-野性-血腥爪击起手
vars["血腥爪击时间"] = player.Buff:Get("血腥爪击"):GetTimeLeft()
vars["血腥爪击数量"] = player.Buff["血腥爪击"].Count
if not talent["血腥爪击"] then
    return
end
if (InCombatLockdown() or targetRange < 15) then --  and not (boss.Exists and boss.IsTarget)
    return
end
if vars["血腥爪击时间"] > 10 and player.Buff["血腥爪击"].Count == 2 then
    return
end
if player.Buff:Has("枭兽形态") or player.Buff:Has("熊形态") then
    return
end
return CastNoTarget(#我_愈合#, not #我_愈合#:CastedIn(2))
