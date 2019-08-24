--武僧-织雾-抚慰之雾
local guid = UnitGUID(vars["治疗对象"].UnitId)
local v
if vars["正在引导的法术"] == "抚慰之雾" and vars["抚慰对象"] == guid then
    v = CastMacro(&取消施法&, vars["治疗对象血量"] > 0.98)
    if v then
        vars["抚慰对象"] = false
    end
    return v
end

v = HealSingle(#_抚慰之雾#, vars["治疗对象血量"] < 0.95)
if v then
    vars["抚慰对象"] = guid
end
return v
