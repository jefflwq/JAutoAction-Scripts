--术士-毁灭-地狱火
if vars["灵魂碎片裂片"] < 40 then
    return
end
if not target:IsBigGuy() and not focus:IsBigGuy() and not mouseover:IsBigGuy() then
    return
end
v = AoeAtCursor(#~召唤地狱火#, 8, 10, 0.65, 3, 1) if v then return v end

