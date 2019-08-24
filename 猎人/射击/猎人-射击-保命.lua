--猎人-射击-保命
if player.Buff:Has("假死") then
    return 0
end
v = CastNoTarget(#意气风发#, playerHealthPercent < 0.2 and SwitchIsOn("意气风发")) if v then return v end
vars["3秒总伤害"] = playerHealthWatcher:GetRecentDamagePercent(3)
UpdateReduce("player")
if IsDying(playerHealthPercent, vars["3秒总伤害"], vars["当前减伤"], 0.45) then
    v = CastNoTarget(#优胜劣汰#, SwitchIsOn("优胜劣汰") and not player.Buff:Has("灵龟守护")) if v then return v end
end
if IsDying(playerHealthPercent, vars["3秒总伤害"], vars["当前减伤"], 0.25) then
    v = CastNoTarget(#灵龟守护#, SwitchIsOn("灵龟守护") and not player.Buff:Has("优胜劣汰")) if v then return v end
end
--如果没有宠物，不会自动召唤
v = run("治疗复活宠物", true) if v then return v end
