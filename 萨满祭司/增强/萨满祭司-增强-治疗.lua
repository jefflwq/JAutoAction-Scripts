--萨满祭司-增强-治疗
v = CastOnTarget(#治疗之涌#, targetHealthPercent < (instance:InPVE() and 0.4 or 0.6), vars["漩涡值"] >= 20) if v then return v end
