--德鲁伊-野性-血腥爪击
if not talent["血腥爪击"] then
    return
end
if vars["血腥爪击时间"] > 0 then
    return
end
if vars["掠食者的迅捷剩余时间"] == 0 then
    return CastNoTarget(#我_愈合#, vars["能量"] < 20 and not #我_愈合#:CastedIn(2))
else
    return CastNoTarget(#我_愈合#, vars["连击点"] == 5 or vars["掠食者的迅捷剩余时间"] < gcdmax * 2)
end


