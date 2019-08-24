--战士-武器-断筋_优先
--战士-武器-断筋

if not #断筋#:CanBeUsedOnTarget(0.2) then
    return
end
if target.Debuff:Has("断筋") then
    return
end
return #断筋#
