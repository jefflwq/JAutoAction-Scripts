--死亡骑士-冰霜-输出
--vars["附近敌人数量"] = player:UpdateNearbyInfo(15).EnemyCount
local v
vars["杀戮机器"] = player.Buff:Has("杀戮机器")
vars["冰霜之柱中"] = player.Buff:Has("冰霜之柱")
vars["白霜"] = player.Buff:Has("白霜")
v = run("冰龙吐息") if v then return v end
v = AoeFront(#冰霜巨龙之怒#, 20, 60, 20, 0.65, 3, 1, targetRange < 5 and talent["冰霜巨龙之怒"] and run("需要开爆发吗")) if v then return v end

v = run("冰霜之柱") if v then return v end





