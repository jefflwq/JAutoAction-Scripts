--德鲁伊-平衡-星辰坠落_优先
if UnitExists("mouseover") then
    local v = AoeAtCursor(#~星辰坠落#, 10, 15, 0.65, 3, SwitchIsOn("星辰坠落")) if v and v ~= 0 then return v end
end

