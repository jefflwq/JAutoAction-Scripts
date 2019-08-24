--术士-毁灭-保命
local v
v = CastNoTarget(#黑暗契约#, playerHealthPercent < 0.5 and talent["黑暗契约"] and not player.Buff:Has("黑暗契约")) if v then return v end
v = CastOnTarget(#死亡缠绕#, playerHealthPercent < 0.45 and talent["死亡缠绕"] and target:CanBeAttacked()) if v then return v end
v = CastNoTarget(#暗影壁垒#, UnitExists("pet") and (GetSpellInfo("恶魔掌控") == "暗影壁垒") and (playerHealthPercent < 0.2 or (playerHealthPercent < 0.35 and not player.Buff:Has("黑暗契约") and not player.Buff:Has("不灭决心")))) if v then return v end
v = CastNoTarget(#不灭决心#, playerHealthPercent < 0.3 and not player.Buff:Has("黑暗契约")) if v then return v end
v = CastOnTarget(#吸取生命#, playerHealthPercent < (instance:InPVE() and 0.25 or 0.4)) if v then return v end
v = run("宠物") if v then return v end
v = CastNoTarget(#我_灵魂石#, SwitchIsOn("灵魂石") and not instance:InInstance() and not target:IsTrainDummy() and not player.Buff:Has("灵魂石")) if v then return v end
v = CastNoTarget(#制造治疗石#, SwitchIsOn("制造治疗石") and not InCombatLockdown() and @治疗石@:GetCount() == 0 and not player:IsMoving() and not #制造治疗石#:CastedIn(4)) if v then return v end

