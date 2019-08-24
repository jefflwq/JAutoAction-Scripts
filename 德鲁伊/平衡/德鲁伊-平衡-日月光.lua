--德鲁伊-平衡-日月光
if talent["艾露恩的战士"] then
    if #艾露恩的战士#:GetCooldown() > 5 then
        if vars["月光增效数量"] > vars["日光增效数量"] then
            return CastOnTarget(#明月打击#, nil, vars["星辰漂流"] or player.Buff:Has("艾露恩的战士") or player.Buff:Has("枭兽狂怒"))
        else
            return CastOnTarget(#阳炎之怒#, nil, vars["星辰漂流"])
        end
    else
        if vars["月光增效数量"] == 3 and vars["月光增效数量"] > vars["日光增效数量"] then
            return CastOnTarget(#明月打击#, nil, vars["星辰漂流"] or player.Buff:Has("艾露恩的战士") or player.Buff:Has("枭兽狂怒"))
        else
            return CastOnTarget(#阳炎之怒#, nil, vars["星辰漂流"])
        end
    end
else
    if vars["月光增效数量"] > vars["日光增效数量"] then
        return CastOnTarget(#明月打击#, nil, vars["星辰漂流"] or player.Buff:Has("艾露恩的战士") or player.Buff:Has("枭兽狂怒"))
    else
        return CastOnTarget(#阳炎之怒#, nil, vars["星辰漂流"])
    end
end


