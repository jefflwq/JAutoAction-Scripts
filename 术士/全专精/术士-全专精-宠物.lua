--术士-全专精-宠物
if not talent["牺牲魔典"] then
    if not UnitExists("pet") or UnitIsDead("pet") then
        if &召宠&:HasBindingKey() then
            if player:GetCastingSpell() == GetSpellInfo(GetMacroSpell("召宠")) then
                --正在召宠
                vars["上次召宠时间"] = GetTime()
            else
                if not vars["上次召宠时间"] or GetTime() - vars["上次召宠时间"] > 2  then
                    return &召宠&
                end
            end
        end
    elseif player:GetCastingSpell() == GetSpellInfo(GetMacroSpell("召宠")) then
        if &取消施法&:HasBindingKey() then
            return &取消施法&
        end
    end
end
if UnitExists("pet") and not UnitIsDead("pet") then
    if not #生命通道#:CanBeUsedOnTarget(0.2, false, "pet") then
        return
    end
    if pet:GetHealthPercent() < (instance:InPVE() and 0.25 or 0.4) then
        return #生命通道#
    end
end





