--潜行者-敏锐-袖剑风暴
if vars["连击点"] == 0 then
    return
end
if vars["附近敌人数量"] < 3 then
    return
end
if talent["袖剑旋风"] then
    if #袖剑旋风#:ReadyIn(7) and player:GetPower(@能量@) < 90 then
        return 0
    end
    if #袖剑旋风#:CastedIn(4.5) then
        return 0
    end
end
if #袖剑风暴#:ReadyIn(0.2) then
    return #袖剑风暴#
end
