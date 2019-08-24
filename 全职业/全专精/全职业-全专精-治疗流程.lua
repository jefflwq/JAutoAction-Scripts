--全职业-全专精-治疗流程
vars["40码平均血量"], vars["40码人数"], vars["40码最低血量"], vars["40码最高血量"], vars["40码低于70%血量人数"], vars["40码低于50%血量人数"], vars["40码低于30%血量人数"] = GetFriendsHealth(40, 0.7, 0.5, 0.3)
vars["团血危急"] = vars["40码人数"] > 0 and ((vars["40码平均血量"] < 0.6) or ((vars["40码低于50%血量人数"] / vars["40码人数"]) > 0.35))
vars["团血安全"] = vars["40码人数"] == 0 or (vars["40码平均血量"] > 0.9 and vars["40码低于30%血量人数"] == 0 and (vars["40码低于50%血量人数"] / vars["40码人数"]) < 0.11 and (vars["40码低于70%血量人数"] / vars["40码人数"]) < 0.21)
--Debug("团血危急", vars["40码人数"], vars["40码平均血量"], vars["40码低于50%血量人数"] / vars["40码人数"])
--if vars["团血危急"] then
    --Debug("***********团血危急", vars["40码人数"], vars["40码平均血量"], vars["40码低于50%血量人数"] / vars["40码人数"])
--end
----Debug("团血安全", vars["40码平均血量"], vars["40码低于30%血量人数"],vars["40码低于50%血量人数"] / vars["40码人数"],vars["40码低于70%血量人数"] / vars["40码人数"])
--if not vars["团血安全"] then
--    Debug("***********团血不安全", vars["40码平均血量"], vars["40码低于30%血量人数"],vars["40码低于50%血量人数"] / vars["40码人数"],vars["40码低于70%血量人数"] / vars["40码人数"])
--end

local v
vars["治疗对象血量"] = playerHealthPercent
vars["治疗对象"] = player
v = run("治疗石") if v then return v end
v = run("保命") if v then return v end
--v = run("治疗") if v then return v end

if target:CanBeAssisted() then
    if targetHealthPercent < playerHealthPercent then
        vars["治疗对象"] = target
        vars["治疗对象血量"] = targetHealthPercent
    end
    v = run("治疗") if v then return v end
    if SwitchIsOn("切换友方") then
        v = unitSelector:SelectLowestFriend(0.95) if v then return v end
    end
else
    if not vars["团血安全"] then
        v = run("治疗") if v then return v end
        if SwitchIsOn("切换友方") then
            v = unitSelector:SelectLowestFriend(0.95) if v then return v end
        end
    end
end
--vars["治疗对象"] = player
--vars["治疗对象血量"] = playerHealthPercent

if target:CanBeAttacked() then
    v = run("治疗") if v then return v end
    v = run("输出流程") if v then return v end
else
    v = run("治疗") if v then return v end
    if SwitchIsOn("切换友方") then
        v = unitSelector:SelectLowestFriend(0.95) if v then return v end
    end
end
