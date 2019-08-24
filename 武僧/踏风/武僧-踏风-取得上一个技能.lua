--武僧-踏风-取得上一个技能

for i = 1, 10 do
    vars["上一个技能"] = GetLastSpell(i).Name
    if vars["上一个技能"] == "幻灭踢"
    or vars["上一个技能"] == "猛虎掌"
    or vars["上一个技能"] == "怒雷破"
    or vars["上一个技能"] == "旭日东升踢"
    or vars["上一个技能"] == "神鹤引项踢"
    or vars["上一个技能"] == "升龙霸"
    or vars["上一个技能"] == "白虎拳"
    or vars["上一个技能"] == "真气波"
    or vars["上一个技能"] == "真气爆裂"
    or vars["上一个技能"] == "碧玉疾风"
    or vars["上一个技能"] == "碎玉闪电"
    then
        break
    end
end










