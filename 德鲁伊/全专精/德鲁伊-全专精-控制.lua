--德鲁伊-全专精-控制
local v
v = AoeFront(#台风#, 12, 120, 15, 0.65, 3, nil, talent["台风"]) if v then return v end
v = CastNoTarget(#群体缠绕#, talent["群体缠绕"]) if v then return v end
v = CastOnTarget(#蛮力猛击#, talent["蛮力猛击"]) if v then return v end
v = CastOnTarget(#纠缠根须#, not target.Debuff:Has("纠缠根须")) if v then return v end
