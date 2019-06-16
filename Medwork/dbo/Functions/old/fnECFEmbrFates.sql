create function fnECFEmbrFates(@ECFEmbr int)
returns table
as
return select dbo.EmbrDevToString(f.id,ed.DayNumber) [stage], action, RecDate
from EmbrionDevelopment ed
left join Ofate f on f.id=ed.masterid
where f.MasterID = @ECFEmbr
