--法师-全专精-法术吸取_优先
--法师-全专精-法术吸取

if #法术吸取#:CanBeUsedOnTarget(0.2) and target.Buff:HasAny(1, "Magic", true) then
    return #法术吸取#
end
