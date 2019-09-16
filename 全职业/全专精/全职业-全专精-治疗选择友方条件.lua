--全职业-全专精-治疗选择友方条件
local selected, current, maxHPercent = ...
if current.HealthPercent < (selected and selected.HealthPercent or (maxHPercent or 1)) then
    return true
end
