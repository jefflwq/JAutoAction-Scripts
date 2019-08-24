--牧师-暗影-尖啸炸弹
if talent["心灵炸弹"] then
    if #心灵炸弹#:CanBeUsedOnTarget(0.2) then
        return #心灵炸弹#
    end
else
    if #心灵尖啸#:ReadyIn(0.2) then
        return #心灵尖啸#
    end
end
