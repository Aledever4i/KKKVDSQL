
CREATE FUNCTION fn_FreeKoikasInRoom (@RoomID INT, @StartDate DATETIME, @FinishDate DATETIME)
RETURNS INT
BEGIN
declare @r table (RoomIndex2 int) 
declare @i int 
declare @max int
select @max=SUM(MainCount+AddedCount-UnderRepairCount) from bedpattern set @i=1 
while @i<=@max begin insert @r(RoomIndex2) values(@i) set @i=@i+1 end 
RETURN (select top 1 r.RoomIndex2 
from @r r
where (r.RoomIndex2<=(select SUM(MainCount+AddedCount-UnderRepairCount) 
											from bedpattern bp
											where bp.MasterID=@RoomID
											and bp.StartDate<=@StartDate 
											and (bp.EndDate is null or bp.EndDate>=@FinishDate)))
	and not exists(select * 
									from hgOccupation o 
									where o.ParentID=@RoomID and o.RoomIndex=r.RoomIndex2 
									and (o.HStart < @FinishDate and o.HEnd > @StartDate)))
END
