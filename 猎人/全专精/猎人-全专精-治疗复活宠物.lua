--猎人-全专精-治疗复活宠物
if UnitExists("pet") then --IsPetActive()
    if UnitIsDead("pet") then
        return #复活宠物#
    else
        local petHealthPercent = pet:GetHealthPercent()
        if petHealthPercent < 0.9 and #治疗宠物#:ReadyIn(0.2) then
            if UnitExists("boss1") then
                if UnitIsUnit("boss1target", "pet") then
                    return #治疗宠物#
                else
                    if petHealthPercent < 0.5 then
                        return #治疗宠物#
                    end
                end
            else
                return #治疗宠物#
            end
        end
    end
elseif ... then
    return
else
    if not &召宠&.Tag then 
        &召宠&.Tag = GetTime()
        return &召宠&
    else
        local tm = GetTime() - &召宠&.Tag
        if tm < 1.5 or tm > 3 then
            if tm > 3 then
                &召宠&.Tag = GetTime()
            end
            if &召宠&:HasBindingKey() and not #复活宠物#:CastedIn(2.5) then
                return &召宠&
            end
        else
            if #复活宠物#:HasBindingKey() and not #复活宠物#:CastedIn(2.5) then
                return #复活宠物#
            end
        end
    end
end
