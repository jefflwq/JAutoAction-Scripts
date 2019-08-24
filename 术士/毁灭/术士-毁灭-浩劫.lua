--术士-毁灭-浩劫
local v
vars["准备浩劫"] = false
vars["浩劫冷却"] = #~浩劫#:GetCooldown()
if not SwitchIsOn("浩劫") then
    return
end
if vars["浩劫"] then --在浩劫状态中
    v = CastOnTarget(#混乱之箭#, vars["爆燃层数"] > 1 or (vars["爆燃层数"] == 1 and not #混乱之箭#:IsCasting())) if v then return v end
    v = CastOnTarget(#燃烧#, vars["爆燃层数"] < 2 and vars["灵魂碎片裂片"] >= 5) if v then return v end
    v = CastOnTarget(#灵魂之火#, talent["灵魂之火"]) if v then return v end
    v = CastOnTarget(#暗影灼烧#, talent["暗影灼烧"]) if v then return v end
    v = CastOnTarget(#烧尽#) if v then return v end
    return
end
if vars["浩劫冷却"] > 10 then
    return
end
local enemies = player:UpdateNearbyInfo(40, true)
if enemies.EnemyCount < 2 then
    return
end
if UnitExists("focus") then
    if UnitIsUnit("focus", "target") or not IsBigGuy("focus") then
        return
    end
elseif UnitExists("mouseover") then
    if UnitIsUnit("mouseover", "target") or not IsBigGuy("mouseover") then
        return
    end
else
    if IsBigGuy(enemies:GetEnemy(-2).PlateId) then
        Error("请将设置焦点霍鼠标移动到一个高血量目标身上以施放《浩劫》")
    end
    return
end

if (SwitchIsOn("输出爆发") and #~召唤地狱火#:ReadyIn(10)) or (vars["地狱火时间"] > 21 and talent["统御魔典"]) then
    vars["准备浩劫"] = true
    return
end
if vars["爆燃层数"] == 0 then
    vars["准备浩劫"] = true
    return
end
if vars["灵魂碎片裂片"] < 35 then
    vars["准备浩劫"] = true
    return
end
vars["准备浩劫"] = true
if vars["浩劫冷却"] > 2 then
    return
end
    
if UnitExists("focus") then
    --print(focus.Debuff:Get("献祭"):GetTimeLeft())
    if focus.Debuff:Get("献祭"):GetTimeLeft() < 10 then
        if talent["大灾变"] then
            --v = AoeAtFocus(#~大灾变#, 8, 10, 0.65, 3, 1, talent["大灾变"]) if v then return v end
            v = CastOnFocus(#献祭#, not #大灾变#:CastedIn(2.5)) if v and v:IsSafeToCast() then return v end
        else
            v = CastOnFocus(#~献祭#) if v and v:IsSafeToCast() then return v end
            --v = CastOnFocus(#~献祭#)
            --if v then
            --    print(v, v:IsSafeToCast())
            --    return v
            --end
        end
    end
    v = CastOnFocus(#~浩劫#)
	if v then
		vars["准备浩劫"] = false
		return v
	end
elseif UnitExists("mouseover") then
    if focus.Debuff:Get("献祭"):GetTimeLeft() < 10 then
        if talent["大灾变"] then
            --v = AoeAtCursor(#~大灾变#, 8, 10, 0.65, 3, 1, talent["大灾变"]) if v then return v end
            v = CastOnCursor(#献祭#, not #大灾变#:CastedIn(2.5)) if v and v:IsSafeToCast() then return v end
        else
            v = CastOnFocus(#~献祭#) if v and v:IsSafeToCast() then return v end
        end
    end
    if vars["爆燃层数"] == 0 then
        return
    end
    v = CastOnCursor(#~浩劫#)
	if v then
		vars["准备浩劫"] = false
		return v
	end
end
