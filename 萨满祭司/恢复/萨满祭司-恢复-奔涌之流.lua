--萨满祭司-恢复-奔涌之流
if not talent["奔涌之流"] then
    return
end
if instance:InPVE() then
    return #奔涌之流#
else
    return HealFront(#奔涌之流#, 30, 120, 0.9, 3)
end
