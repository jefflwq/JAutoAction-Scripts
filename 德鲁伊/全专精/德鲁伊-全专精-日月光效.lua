--德鲁伊-全专精-日月光效
vars["月光增效"] = player.Buff:Get("月光增效")
vars["日光增效"] = player.Buff:Get("日光增效")

vars["月光增效数量"] = vars["月光增效"].Count
vars["日光增效数量"] = vars["日光增效"].Count
vars["月光增效时间"] = vars["月光增效"]:GetTimeLeft()
vars["日光增效时间"] = vars["日光增效"]:GetTimeLeft()
if vars["月光增效数量"] > 0 and #明月打击#:IsCasting() then
    vars["月光增效数量"] = vars["月光增效数量"] - 1
end
if vars["日光增效数量"] > 0 and #阳炎之怒#:IsCasting() then
    vars["日光增效数量"] = vars["日光增效数量"] - 1
end
