CREATE FUNCTION [dbo].[fnFreeBedsOnDateDeptPat](@dept INT, @StartDate DATETIME, @FinishDate DATETIME,@PatId INT, @cur_hg INT)
RETURNS @Res TABLE (placename nvarchar(150),plt int,prf int,knum int)
BEGIN

declare @sex nvarchar(1)
select @sex=sex from Patient where id=@PatId

declare @r table (ik int) 
declare @max int
declare @i int 

select @max=SUM(MainCount+AddedCount-UnderRepairCount) from bedpattern set @i=1 
while @i<=@max begin insert @r(ik) values(@i) set @i=@i+1 end 

insert @Res
select [name]+', койка '+ProfileName+' №'+cast(ik as nvarchar(10)) as [место]
,id as palata, BedProfile as [pr], ik as [k]
--,cast(id as nvarchar(10))+'/'+cast(BedProfile as nvarchar(10))+'/'+cast(ik as nvarchar(10)) as txtid
from
(
select d.id, d.[name], d.gender, bp.BedProfile, bpn.ProfileName
,r.ik, isnull(q.occup,0) as ocup
from dept d
left join bedpattern bp on bp.MasterId=d.id
left join BedProfile bpn on bpn.id=bp.BedProfile
left join @r r on r.ik<=(bp.MainCount+bp.AddedCount-bp.UnderRepairCount)
left join (
select count(o.id) as occup, o.ParentId, o.BedProfile, o.RoomIndex from hgOccupation o 
	where (o.HStart < @FinishDate and o.HEnd > @StartDate) and o.Id<>@cur_hg
--	and o.PatId<>@patid
group by o.ParentId,o.BedProfile,o.RoomIndex
) q on q.parentId=d.id and q.BedProfile=bp.BedProfile and q.RoomIndex=r.ik
where d.ParentId=@dept
and d.DeptTypeId=3
and (
 (@sex='M' and (d.gender='Мужская' or d.gender='Общая'))
	or
 (@sex='F' and (d.gender='Женская' or d.gender='Общая'))
	or isnull(d.gender,'')=''
)
) z where z.ocup=0 and z.BedProfile is NOT NULL


	RETURN 
END
