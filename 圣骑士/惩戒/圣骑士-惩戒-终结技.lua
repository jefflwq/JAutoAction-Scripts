--圣骑士-惩戒-终结技
--处决宣判    3层神圣能量        召唤圣光惩罚一名敌方目标，造成2,968点神圣伤害，并使你对目标造成的神圣伤害提高20%，持续12秒。
--圣殿骑士的裁决    3层神圣能量        发动一次强大的武器打击，对一个敌方目标造成2,879点神圣伤害。
--审判官复仇    5层神圣能量        将神圣能量汇聚到武器上，发动一次强大的攻击，造成2,226点神圣伤害，并为你恢复同等数量的生命。对昏迷的目标使用时造成的伤害提高50%。
--异端裁决    1到3层神圣能量        消耗最多3层神圣能量，使你造成的伤害和急速提高7%。每层神圣能量产生的效果持续时间为15秒。
--神圣风暴    3层神圣能量        释放神圣能量的旋风，对附近所有敌人造成1,377点神圣伤害。

vars["神圣意志时间"] = player.Buff:Get("神圣意志"):GetTimeLeft()
v = CastOnTarget(#审判官复仇#, vars["神圣意志时间"] > 0 and vars["神圣意志时间"] < 2 * gcdmax and (target.Debuff:Has("昏迷") or playerHealthPercent < 0.3)) if v then return v end

if vars["神圣意志时间"] == 0 then
    if vars["神圣能量"] < 3 then
        return
    end
    if vars["神圣能量"] < 5 and #灰烬觉醒#:GetCooldown() > (gcdmax + 0.2) then
        v = run("普通技能") if v then return v end
    end
end
v = CastOnTarget(#审判官复仇#, target.Debuff:Has("昏迷") or playerHealthPercent < 0.3) if v then return v end
v = CastOnTarget(#处决宣判#) if v then return v end
v = CastNoTarget(#神圣风暴#, player:UpdateNearbyInfo(12).EnemyCount > 2) if v then return v end
v = CastOnTarget(#圣殿骑士的裁决#) if v then return v end
