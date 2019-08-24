--全职业-全专精-防暂离
local t = GetTime() - (vars["上次时间"] or 0)
if t > 10 then
    if t > 15 then
        vars["上次时间"] = GetTime()
    end
    return "A"
end