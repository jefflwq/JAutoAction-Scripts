--潜行者-敏锐-_专精初始化
run("全专精-_专精初始化")
if talent["幽暗之刃"] then
    vars["幽暗背刺"] = #幽暗之刃#
else
    vars["幽暗背刺"] = #背刺#
end
AddSpellSwitch("暗影步")
