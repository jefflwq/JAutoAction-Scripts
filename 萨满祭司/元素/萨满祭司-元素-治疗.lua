--萨满祭司-元素-治疗
v = CastOnTarget(#治疗之涌#, targetHealthPercent < (instance:InPVE() and 0.4 or 0.6)) if v then return v end
