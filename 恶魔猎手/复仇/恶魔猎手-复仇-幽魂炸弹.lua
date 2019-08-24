--恶魔猎手-复仇-幽魂炸弹
if not talent["幽魂炸弹"] then
    return
end
if not InCombatLockdown() then
    return
end
--if playerHealthPercent > 0.9 then
--    return
--end
if vars["灵魂残片数"] < 5 then
    return
end
return #幽魂炸弹#
