
CREATE PROCEDURE [dbo].[FreeKoikas]
@DivID INT, @StartDate DATETIME, @FinishDate DATETIME
AS
set nocount off
declare @r table (RoomIndex2 int)
declare @i int
declare @max integer
select @max=SUM(MainCount+AddedCount-UnderRepairCount) from bedpattern
set @i=1
while @i<=@max
begin
	insert @r(RoomIndex2) values(@i)
	set @i=@i+1
end

select top 1 d.ID, r.RoomIndex2
from dept d join @r r on 
(r.RoomIndex2<=(select SUM(MainCount+AddedCount-UnderRepairCount) 
	from bedpattern bp 
	where bp.MasterID=d.id 
	and bp.StartDate<=@StartDate 
	and (bp.EndDate is null or bp.EndDate>=@FinishDate)))
where d.ParentID=@DivID

and not exists(
select * from hgOccupation o where o.ParentID=d.ID and o.RoomIndex=r.RoomIndex2 and 
--26.08.2009 Фатов М.В. исправил условие по датам
(o.HStart < @FinishDate and o.HEnd > @StartDate))



