--牧师-暗影-打爆炸物技能
local v
v = CastOnTarget(#虚空箭#) if v then return v end
v = CastOnTarget(#暗言术：虚#, talent["暗言术：虚"]) if v  then return v end  --保持损劈
v = CastOnTarget(#心灵震爆#, not talent["暗言术：虚"]) if v  then return v end  --保持损劈

if target:UpdateNearbyInfo(10).EnemyCount + 1 > 2 then
    v = CastOnTarget(#精神灼烧#) if v then return v end
else
    v = CastOnTarget(#精神鞭笞#) if v then return v end
end
