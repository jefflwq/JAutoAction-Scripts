--恶魔猎手-浩劫-输出
vars["灵魂残片数"] = player.Buff:Get("灵魂残片").Count
vars["恶魔之怒"] = player:GetPower(@恶魔之怒@)
vars["恶魔之怒差值"] = player:GetPowerDeficit(@恶魔之怒@)

local v
if talent["势如破竹"] then
    v = AttackFront(#复仇回避#, 8, 20, targetRange < 5 and not player.Buff:Has("势如破竹") and #邪能冲撞#:ReadyIn(0.2)) if v then return v end
    v = AttackFront(#邪能冲撞#, 8, 20, targetRange > 7 and targetRange < 20) if v then return v end
end

if SwitchIsOn("邪能弹幕") and talent["邪能弹幕"] then
    v = CastNoTarget(#邪能弹幕#, targetRange < 8 and (boss.IsTarget or (targetHealthMax > playerHealthMax * 10 and targetHealth > playerHealthMax))) if v then return v end
    v = AoeAround(#邪能弹幕#, 8, 15, 0.65, 5, 3) if v then return v end
end
v = CastOnTarget(#黑暗鞭笞#, vars["恶魔之怒差值"] < 40 and talent["黑暗鞭笞"]) if v then return v end
v = CastOnTarget(#涅墨西斯#, talent["黑暗鞭笞"]) if v then return v end
v = run("爆发技能") if v then return v end
v = AoeAround(#献祭光环#, 8, 15, 0.65, 3, 1, talent["献祭光环"] and vars["恶魔之怒差值"] > 20) if v then return v end
v = CastOnTarget(#混乱打击#, vars["恶魔之怒"] >= 70) if v then return v end
v = AoeFront(#眼棱#, 10, 80, 15, 0.65, 5, 1, targetRange < 5 and SwitchIsOn("眼棱") and not player:IsMoving(), true, 1) if v then return v end
v = CastOnTarget(#刃舞#, targetRange < 5 and (talent["第一滴血"] or player:UpdateNearbyInfo(8).EnemyCount > 2)) if v then return v end
v = CastOnTarget(#邪能之刃#, vars["恶魔之怒差值"] >= 40 and talent["邪能之刃"] and GetLastSpell() ~= "复仇回避") if v then return v end
v = DispelEnemy(#吞噬魔法#, vars["恶魔之怒差值"] >= 20, "Magic") if v then return v end
v = CastOnTarget(#恶魔之咬#, not talent["恶魔之刃"]) if v then return v end
v = AttackFront(#邪能冲撞#, 8, 20, targetRange > 7 and targetRange < 20 and SwitchIsOn("邪能冲撞")) if v then return v end
v = CastOnTarget(#投掷利刃#, SwitchIsOn("投掷利刃") and vars["目标需要攻击"] and InCombatLockdown()) if v then return v end

