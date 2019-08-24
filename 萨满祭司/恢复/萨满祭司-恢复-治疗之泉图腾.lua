--萨满祭司-恢复-治疗之泉图腾
if talent["暴雨图腾"] then
    return
end
if not InCombatLockdown() then
    return
end
if not #治疗之泉图腾#:ReadyIn(0.2) then
    return
end
if talent["元素回响"] then
    if vars["40码平均血量"] > 0.98 then
        return
    end
    if #治疗之泉图腾#:IsReachedOrSoon() then
        return #治疗之泉图腾#
    end
end
if vars["40码平均血量"] < 0.95 then
    return #治疗之泉图腾#
end
