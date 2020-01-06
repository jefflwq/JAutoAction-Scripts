--全职业-全专精-治疗流程
vars["40码平均血量"], vars["40码人数"], vars["40码最低血量"], vars["40码最高血量"], vars["40码低于70%血量人数"], vars["40码低于50%血量人数"], vars["40码低于30%血量人数"] = GetFriendsHealth(40, 0.7, 0.5, 0.3)
vars["团血危急"] = run("团血危急")
vars["团血安全"] = run("团血安全")
--Debug("团血危急", vars["40码人数"], vars["40码平均血量"], vars["40码低于50%血量人数"] / vars["40码人数"])
--if vars["团血危急"] then
    --Debug("***********团血危急", vars["40码人数"], vars["40码平均血量"], vars["40码低于50%血量人数"] / vars["40码人数"])
--end
----Debug("团血安全", vars["40码平均血量"], vars["40码低于30%血量人数"],vars["40码低于50%血量人数"] / vars["40码人数"],vars["40码低于70%血量人数"] / vars["40码人数"])
--if not vars["团血安全"] then
--    Debug("***********团血不安全", vars["40码平均血量"], vars["40码低于30%血量人数"],vars["40码低于50%血量人数"] / vars["40码人数"],vars["40码低于70%血量人数"] / vars["40码人数"])
--end

local v
--自己保命
v = run("治疗石") if v then return v end
v = run("保命") if v then return v end

if not UnitExists("target") or target:CanBeAssisted() or not vars["团血安全"] then --无目标，或者目标是友方, 或者团血不安全
    if SwitchIsOn("切换友方") then
        --v = unitSelector:SelectLowestFriend(0.95) if v then return v end
        v = unitSelector:SelectFriend("治疗选择友方条件", 40, 0.95)
        if v then
            if not UnitIsUnit(v.ID, "target") then --需要选中的目标不是当前目标，则选中该目标
                return v
            end
        else --没有需要治疗的对象
            if SwitchIsOn("切换敌方") then --如果 切换敌方 开关打开，则切换到敌方目标
                v = unitSelector:SelectAEnemy(true, true) if v then return v end
            end
        end
    end
    if target:CanBeAssisted() then
        vars["治疗对象"] = target
        vars["治疗对象血量"] = targetHealthPercent
        v = run("治疗") if v then return v end
        --被选中对象没有接受治疗
        if targetHealthPercent > 0.95 and SwitchIsOn("切换敌方") then --如果 切换敌方 开关打开，则切换到敌方目标
            v = unitSelector:SelectAEnemy(true, true) if v then return v end
        end
    end
end
--vars["治疗对象"] = player
--vars["治疗对象血量"] = playerHealthPercent

if target:CanBeAttacked() then
    v = run("输出流程") if v then return v end
end


