--法师-火焰-防止火焰冲击连击
if not #火焰冲击#.Tag then
    #火焰冲击#.Tag = GetTime()
    return 
end
local tm = GetTime() - #火焰冲击#.Tag
if tm < 0.2 then
    return 0
end

