--德鲁伊-全专精-人输出
local specId =  GetSpecialization()
if specId == 1 then --平衡
    return #枭兽形态#
elseif specId == 2 then --野性
    return #猎豹形态#
elseif specId == 3 then --守护
    return #熊形态#
elseif specId == 4 then --恢复
    --return run("人输出")--不会进来
end
