--圣骑士-神圣-黎明之光
--if instance:InPVE() then
--    return #黎明之光#
--else
--    return HealFront(#黎明之光#, 15, 90, 0.9, 3)
--end
return CastNoTarget(#黎明之光#, not #黎明之光#:CastedIn(3))