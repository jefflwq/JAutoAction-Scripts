--恶魔猎手-复仇-输出
vars["灵魂残片数"] = player.Buff:Get("灵魂残片").Count

local v
v = CastOnTarget(#幽魂炸弹#, vars["灵魂残片数"] > 4 and InCombatLockdown() and talent["幽魂炸弹"]) if v then return v end
v = CastNoTarget(#灵魂裂劈#, vars["目标需要攻击"] and targetRange < 5 and playerHealthPercent < 0.85 or vars["痛苦差值"] < 11) if v then return v end
v = CastOnTarget(#虚空掠夺者#, talent["虚空掠夺者"] and player.Buff:Get("虚空掠夺者"):GetTimeLeft() < 1) if v then return v end
v = AoeAround(#献祭光环#, 8, 15, 0.65, 3, 1) if v then return v end
v = CastOnTarget(#邪能之刃#, talent["邪能之刃"]) if v then return v end
if talent["集结咒符"] then
    v = AoeAround(#我_烈焰咒符#, 5, 8, 0.65, 3, 1) if v then return v end
else
    v = AoeAtCursor(#~烈焰咒符#, 5) if v then return v end
end
v = DispelEnemy(#吞噬魔法#, vars["痛苦差值"] >= 20, "Magic") if v then return v end
v = CastOnTarget(vars["破裂裂魂"], targetRange < 5) if v then return v end
--v = AttackAtCursor(#~地狱火撞击#, targetRange < 30 and #~地狱火撞击#:GetChargeInfo():IsReachedOrSoon(), targetRange > 8, player:UpdateNearbyInfo(5).EnemyCount > 0) if v then return v end
v = CastNoTarget(#我_地狱火撞击#, #我_地狱火撞击#:GetChargeInfo():IsReachedOrSoon() and player:UpdateNearbyInfo(5).EnemyCount > 0) if v then return v end
v = CastOnTarget(#投掷利刃#, vars["目标需要攻击"] and InCombatLockdown()) if v then return v end

