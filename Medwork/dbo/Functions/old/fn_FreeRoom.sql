
CREATE FUNCTION fn_FreeRoom (@DivID INT, @StartDate DATETIME, @FinishDate DATETIME)
RETURNS INT
BEGIN
RETURN (select top 1 ID from dept d where d.ParentID=@DivID and
not exists(
	select * from hgOccupation o 
	where o.ParentID=d.ID and 
	(o.HStart < @FinishDate and o.HEnd > @StartDate))
and (select top 1 MainCount+AddedCount-UnderRepairCount from bedpattern b
	where b.MasterID=d.ID)>0)
END
