--术士-毁灭-浩劫_优先
if UnitExists("focus") then
    return CastOnFocus(#浩劫#)
elseif UnitExists("mouseover") then
    return CastOnCursor(#~浩劫#)
else
    Error("请将设置焦点霍鼠标移动到一个目标身上以施放《浩劫》")
end
