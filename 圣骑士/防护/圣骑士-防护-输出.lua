--圣骑士-防护-输出

local v
v = CastNoTarget(#奉献#, targetRange < 6 and not player.Buff:Has("奉献")) if v then return v end
v = run("爆发技能") if v then return v end
local ci = #正义盾击#:GetChargeInfo()
v = CastNoTarget(#炽天使#, talent["炽天使"] and ci.Charges > 1) if v then return v end
v = CastNoTarget(#圣光壁垒#, talent["圣光壁垒"] and ci.Charges == 0) if v then return v end
v = ci:TimeToCharges(3)
if not player.Buff:Has("正义盾击") and (playerHealthPercent < 0.8 or v < 3) then
    if talent["炽天使"] then
        v = AoeFront(#正义盾击#, 5, 140, 8, 0.65, 3, 1, ((talent["圣光壁垒"] and #圣光壁垒#:GetCooldown() > #炽天使#:GetCooldown()) or (#炽天使#:GetCooldown() > v))) if v then return v end
    else
        v = AoeFront(#正义盾击#, 5, 140, 8, 0.65, 3, 1) if v then return v end
    end
end
v = CastOnTarget(#审判#) if v then return v end
v = CastOnTarget(#复仇者之盾#) if v then return v end
v = CastOnTarget(vars["正义祝福"], targetRange < 5) if v then return v end
