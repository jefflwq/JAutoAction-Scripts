--德鲁伊-恢复-自然之愈
return HealSingle(#_自然之愈#, vars["治疗对象"].Debuff:HasAny(1, "Magic") or vars["治疗对象"].Debuff:HasAny(1, "Curse") or vars["治疗对象"].Debuff:HasAny(1, "Poison"))
