--猎人-生存-保命
if player.Buff:Has("假死") then
    return 0
end
v = CastNoTarget(#意气风发#, playerHealthPercent < 0.2 and SwitchIsOn("意气风发")) if v then return v end
v = CastNoTarget(#灵龟守护#,  SwitchIsOn("灵龟守护") and (playerHealthPercent < 0.15 or (playerHealthPercent < 0.3 and targetHealth > playerHealth))) if v then return v end
v = run("治疗复活宠物") if v then return v end
