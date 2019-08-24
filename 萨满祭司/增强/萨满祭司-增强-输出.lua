--萨满祭司-增强-输出
local v
run("取得图腾掌握时间")
v = CastNoTarget(#图腾掌握#, vars["图腾掌握时间"] == 0) if v then return v end
vars["附近敌人数量"] = player:UpdateNearbyInfo().EnemyCount
v = CastNoTarget(#空气之怒#, targetRange < 5 and vars["漩涡值"] >= 20 and vars["附近敌人数量"] > 2 and talent["空气之怒"] and not player.Buff:Has("空气之怒")) if v then return v end
vars["面前目标数"] = player:UpdateFrontInfo(8).EnemyCount
v = CastOnTarget(#毁灭闪电#, vars["面前目标数"] > 1 and not player.Buff:Has("毁灭闪电")) if v then return v end
v = CastOnTarget(#冰封#, talent["冰雹"] and NeedRefill(player.Buff:Get("冰封"):GetTimeLeft(), 4.5, target:TimeToDie(), 6)) if v then return v end
v = CastOnTarget(#火舌#, NeedRefill(player.Buff:Get("火舌"):GetTimeLeft(), 4.5, target:TimeToDie(), 5)) if v then return v end
v = CastOnTarget(#大地之刺#, talent["大地之刺"]) if v then return v end
if targetRange < 5 then
    v = run("爆发技能") if v then return v end
end
v = AoeFront(#裂地术#, 5, 100, 8, 0.65, 3, 2, targetRange < 5 and talent["裂地术"]) if v then return v end
v = CastOnTarget(#毁灭闪电#, vars["面前目标数"] > 2) if v then return v end
v = CastOnTarget(#风暴打击#, player.Buff:Has("风暴使者")) if v then return v end
v = CastOnTarget(#熔岩猛击#, talent["灼热之手"] and player.Buff:Has("灼热之手")) if v then return v end
v = CastOnTarget(#闪电箭#, talent["超载"]) if v then return v end
v = AoeFront(#裂地术#, 5, 100, 8, 0.65, 3, 1, targetRange < 5 and talent["裂地术"]) if v then return v end
v = CastOnTarget(#风暴打击#) if v then return v end
v = CastOnTarget(#石化#, vars["漩涡值"] <= 70 and #石化#:GetChargeInfo():IsReachedOrSoon()) if v then return v end
v = CastOnTarget(#火舌#, talent["灼热强袭"]) if v then return v end
v = CastOnTarget(#熔岩猛击#) if v then return v end
v = CastOnTarget(#石化#, vars["漩涡值"] <= 70) if v then return v end
v = CastOnTarget(#火舌#) if v then return v end

v = CastOnTarget(#狂野扑击#, talent["狂野扑击"] and SwitchIsOn("狂野扑击")) if v then return v end
