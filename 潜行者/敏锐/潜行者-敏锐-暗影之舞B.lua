--潜行者-敏锐-暗影之舞B
--影舞期间(爆发流)
--爆发流必选天赋为[黑暗之影]，因此每30秒一轮单影舞。
local noShadowDance = not player.Buff:Has("暗影之舞")
if player.Buff:Get("死亡符记"):GetTimeLeft() > 8 then
    if noShadowDance then
        return CastOnTarget(#暗影之舞#)
    end
end
if noShadowDance then
    return
end
--如果选择[洞悉弱点]的话，开启[暗影之舞]和[死亡符记]之后，第一个技能锁定为[暗影打击]。
--如果选择[武器掌握]的话，开启[暗影之舞]和[死亡符记]之后，第一个技能锁定为[刺骨]。
local v
if talent["洞悉弱点"] then
    v = CastOnTarget(#暗影打击#, not target.Debuff:Has("洞悉弱点")) if v then return v end
elseif talent["武器掌握"] then
    v = CastOnTarget(#刺骨#, GetLastSpell(1).Name == "暗影之舞") if v then return v end
end
v = run("爆发技能") if v then return v end
v = CastOnTarget(#死亡标记#, vars["连击点差"] > 3 and talent["死亡标记"]) if v then return v end
v = CastOnTarget(#影分身#, vars["连击点差"] == 0 and talent["影分身"]) if v then return v end
v = CastOnTarget(#刺骨#, vars["连击点差"] == 0 or vars["附近敌人数量"] > 2 and vars["连击点"] > 2 and player.Buff:Get("袖剑连击").Count > 2) if v then return v end
v = CastNoTarget(#袖剑旋风#, vars["连击点差"] > 0 and vars["附近敌人数量"] > 2 and talent["袖剑旋风"]) if v then return v end
v = run("袖剑风暴") if v then return v end
v = CastOnTarget(#暗影打击#) if v then return v end
