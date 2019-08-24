--全职业-全专精-默认
--通过run函数执行子脚本的时候，如果存在当前执行主脚本的名字作为前缀的脚本，则会优先执行
--例如在执行主脚本【默认】时，如果存在子脚本【默认初始化】，则该脚本会优先被执行
if player:GetDuty() == "HEALER" then
    return run("治疗流程")
else
    return run("输出流程")
end