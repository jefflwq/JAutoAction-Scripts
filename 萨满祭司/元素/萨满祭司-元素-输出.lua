--萨满祭司-元素-输出
local v
vars["目标附近8码敌人数量"] = target:UpdateNearbyInfo().EnemyCount + 1
v = CastOnTarget(#冰霜震击#, vars["目标附近8码敌人数量"] == 1 and #冰霜震击#:GetDamage() > targetHealth ) if v then return v end
if player.Buff:Has("升腾") then
    v = AoeAtCursor(#~地震术#, 8, 10, 0.65, 3, 2, vars["漩涡差值"] < 15) if v then return v end
    v = CastOnTarget(#大地震击#, vars["漩涡差值"] < 12) if v then return v end
    v = CastOnTarget(#熔岩弹射#, vars["目标附近8码敌人数量"] > 2) if v then return v end
    v = CastOnTarget(#熔岩爆裂#) if v then return v end
end
run("取得图腾掌握时间")
vars["风暴元素"] = (talent["风暴元素"] and (UnitName("pet") == "原始风暴元素" or totems:Update("强力风暴元素") > 0))
v = CastNoTarget(#图腾掌握#, vars["图腾掌握时间"] == 0 and not #图腾掌握#:CastedIn(5)) if v then return v end
if not InCombatLockdown() then
    v = CastOnTarget(#熔岩爆裂#, #熔岩爆裂#:GetChargeInfo():IsReachedOrSoon() and not #熔岩爆裂#:CastedIn(3)) if v then return v end
    v = CastOnTarget(#冰霜震击#, player.Buff:Has("冰怒")) if v then return v end
end
vars["目标死亡时间"] = target:TimeToDie()
v = CastOnTarget(#烈焰震击#, NeedRefill(target.Debuff:Get("烈焰震击"):GetTimeLeft(), 4.5, vars["目标死亡时间"], 5) and player.Buff:Get("呼啸狂风").Count < 13) if v then return v end
v = run("爆发技能") if v then return v end
if talent["元素宗师"] then
    if player.Buff:Has("元素宗师") or #熔岩爆裂#:IsCasting() then
        --[4.元素宗师BUFF优先级]
        --1、2+目标地震术。
        v = AoeAtCursor(#~地震术#, 8, 10, 0.65, 3, 2, talent["地震术"]) if v and v ~= 0 then return v end
        if vars["目标附近8码敌人数量"] > 2 then
            v = CastOnTarget(#闪电链#) if v then return v end
        end
        --2、触发风暴守护者的闪电箭。
        v = CastOnTarget(#闪电箭#, player.Buff:Has("风暴守护者") and not #闪电箭#:CastedIn(2.5)) if v then return v end
        --3、大地震击。
        v = CastOnTarget(#大地震击#) if v then return v end
        --4、触发冰怒的冰霜震击。
        v = CastOnTarget(#冰霜震击#, player.Buff:Has("冰怒")) if v then return v end
        --6、冰怒。
        v = CastOnTarget(#冰怒#, talent["冰怒"] and (not talent["风暴守护者"] or #风暴守护者#:GetCooldown() > 10)) if v then return v end
        --5、闪电箭。
        v = CastOnTarget(#闪电箭#, not #闪电箭#:CastedIn(2.5)) if v then return v end
        --7、冰霜震击。
        v = CastOnTarget(#冰霜震击#) if v then return v end
    elseif vars["风暴元素"] and player.Buff:Has("熔岩奔腾") then
        v = CastOnTarget(#熔岩爆裂#, not #熔岩爆裂#:CastedIn(3)) if v then return v end
    end
end

--6、使用元素冲击如果冷却好了，并且没有风暴元素在场。
v = CastOnTarget(#元素冲击#, talent["元素冲击"] and not vars["风暴元素"]) if v then return v end
--7、使用岩浆图腾无论什么时候好了，如果在60秒内将有ADD出现，那么请稍微等待直到ADD出现。
v = AoeAtCursor(#~岩浆图腾#, 8, 10, 0.65, 3, 1, talent["岩浆图腾"]) if v then return v end

v = AoeAtCursor(#~地震术#, 8, 10, 0.65, 3, 2, vars["漩涡差值"] < 15) if v and v ~= 0 then return v end




--8、使用风暴守护者无论什么时候好了，如果在60秒内将有3+目标以上ADD出现，那么请稍微等待直到ADD出现。
v = CastNoTarget(#风暴守护者#, vars["目标死亡时间"] > 10 and talent["风暴守护者"] and not player.Buff:Has("冰怒") and not player.Buff:Has("熔岩奔腾") and not #熔岩爆裂#:GetChargeInfo():IsReachedOrSoon()) if v then return v end
v = CastOnTarget(#闪电链#, vars["目标附近8码敌人数量"] > 4) if v then return v end
v = CastOnTarget(#闪电链#, vars["目标附近8码敌人数量"] > 2 and vars["风暴元素"]) if v then return v end
vars["能量湍流"] = player.Buff:Has("能量湍流")
--能量湍流	熔岩爆裂：使你的火元素的冷却时间减少6.0秒。
v = CastOnTarget(#熔岩爆裂#, not #熔岩爆裂#:IsCasting() and (player.Buff:Has("熔岩奔腾") or (not vars["风暴元素"] and vars["目标附近8码敌人数量"] < 3 and #熔岩爆裂#:GetChargeInfo():IsReachedOrSoon() and (not vars["能量湍流"] or vars["风火元素"]:GetCooldown() > 10)))) if v then return v end
v = CastOnTarget(#闪电链#, vars["目标附近8码敌人数量"] > 2) if v then return v end
--9、使用闪电箭如果风暴守护者BUFF和能量湍流BUFF触发。
v = CastOnTarget(#闪电箭#, player.Buff:Has("风暴守护者")) if v then return v end
--10、使用大地震击如果你的漩涡值在90以上。
v = CastOnTarget(#大地震击#, vars["漩涡差值"] < 12) if v then return v end
--11、使用闪电箭如果风暴元素在场上。
v = CastOnTarget(#闪电箭#, UnitName("pet") == "原始风暴元素" or totems:Update("强力风暴元素") > 0) if v then return v end
--12、使用升腾并且释放熔岩爆裂
if talent["升腾"] and not vars["风暴元素"] and run("需要开爆发吗") then
    v = CastNoTarget(#升腾#) 
    if v then
        if vars["图腾掌握时间"] < 15 then
            return #图腾掌握#
        end
        if NeedRefill(target.Debuff:Get("烈焰震击"):GetTimeLeft(), 15, vars["目标死亡时间"], 15) then
            return #烈焰震击#
        end
        return v 
    end
end

--13、使用闪电箭如果能量湍流BUFF触发。
v = CastOnTarget(#闪电箭#, player.Buff:Has("能量湍流")) if v then return v end
v = CastOnTarget(#熔岩爆裂#, #熔岩爆裂#:GetChargeInfo():IsReachedOrSoon() and not #熔岩爆裂#:CastedIn(3)) if v then return v end
--15、使用冰霜震击如果冰怒BUFF触发。
v = CastOnTarget(#冰霜震击#, player.Buff:Has("冰怒")) if v then return v end
--14、使用熔岩爆裂如果冷却好了
v = CastOnTarget(#熔岩爆裂#, not #熔岩爆裂#:CastedIn(3)) if v then return v end
--16、使用冰怒
v = CastOnTarget(#冰怒#, vars["目标死亡时间"] > 10 and talent["冰怒"] and (not talent["风暴守护者"] or #风暴守护者#:GetCooldown() > 10)) if v then return v end
--17、使用图腾掌握如果图腾小于或等于9秒。
v = CastNoTarget(#图腾掌握#, vars["图腾掌握时间"] < 9) if v then return v end
--18、使用大地震击如果你有60点漩涡值并且熔岩奔腾没有触发。
v = CastOnTarget(#大地震击#, vars["漩涡差值"] >= 60) if v then return v end
--19、使用闪电箭作为单目标时的填充技。
v = CastOnTarget(#闪电箭#) if v then return v end
--20、使用冰霜震击作为移动时的填充技。
v = CastOnTarget(#冰霜震击#) if v then return v end




--[3.三目标以上循环手法]
--1、保持图腾掌握(除非目标不会存活30秒以上)。
--2、使用风暴守护者如果冷却好了。
--3、使用岩浆图腾如果冷却好了。
--4、在三目标时保持每个目标身上的烈焰震击。
--5、把所有漩涡值用在地震术上，如果可能尽量让地震术获得元素宗师BUFF。
--6、在三目标时使用元素冲击。
--7、使用风暴元素的风暴之眼技能，但不要在召唤闪电释放前使用。
--8、使用闪电链来生成漩涡值。


