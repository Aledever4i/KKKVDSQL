-- =============================================
CREATE FUNCTION [dbo].[fnPatKDniOtd](@SDate datetime, @EDate datetime, @dept int)
RETURNS @Res TABLE (PatId INT, Kdni INT, ID001 int)
BEGIN

declare @StartDate datetime
declare @EndDate datetime

set @StartDate=CAST(FLOOR(CAST(@SDate AS FLOAT)) AS DATETIME)
set @EndDate=CAST(FLOOR(CAST(@EDate AS FLOAT)) AS DATETIME)


INSERT @Res
select t.patid, qq.ndays, qq.id001
from
(
select ID001, sum(
	FLOOR(CAST((case when (EndDate>@EndDate) or isNull(EndDate,0)=0 then @EndDate ELSE
	(case when (EndDate>@StartDate) then EndDate ELSE @StartDate end)
	End) as FLOAT))
	-
	FLOOR(CAST((case when (StartDate<@StartDate) then @StartDate ELSE StartDate End) as FLOAT))
	) as ndays

from(
select ID001, p.StartDate, p.EndDate
from
	Patientlocation p
where p.StartDate<@EndDate and((p.EndDate is NULL) or (p.EndDate>@StartDate))
	 and p.OtdId=@dept

) q 
group by ID001
) qq
left join forma001 t on t.id=qq.ID001
RETURN 
END


