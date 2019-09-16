--德鲁伊-野性-_专精初始化
run("全专精-_专精初始化")
vars["打爆炸物距离"] = 6
SetAutoAttactMode(0)

--德鲁伊-野性-_天赋初始化
if talent["野蛮挥砍"] then
    vars["横扫挥砍"] = #野蛮挥砍#
else
    vars["横扫挥砍"] = #横扫#
end
if talent["化身：丛林之王"] then
    vars["狂暴化身"] = #化身：丛林之王#
else
    vars["狂暴化身"] = #狂暴#
end
--if talent["锯齿创伤"] then
--    vars["补斜掠时间"] = 12 * 0.3
--    vars["补割裂时间"] = 19.2 * 0.3
--else
    vars["补斜掠时间"] = 15 * 0.3
    vars["补割裂时间"] = 24 * 0.3
--end
