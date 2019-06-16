CREATE FUNCTION [dbo].[fnBedsOnDate](@TheDate datetime, @dept int)
RETURNS @Res TABLE (m INT, r INT, a Int)
BEGIN
declare @np int

-- количество палат в отделении
select @np=count(id) 
from dept
where DeptTypeid=3
	and parentid=@dept

if @np=0 BEGIN
-- если палаты не указывались, берем кол-во коек из свойств отделения
insert @Res
select 
	isnull(sum(b.maincount),0),
	isnull(sum(b.underrepaircount),0),
	isnull(sum(b.addedcount),0)
from dept d, BedPattern b
where d.id=@dept
	and b.MasterId=d.id
	and b.StartDate<=@TheDate
	and (b.EndDate IS NULL or b.EndDate>@TheDate)
END ELSE BEGIN
-- если палаты указывались, берем сумму кол-ва коек из свойств палат
insert @Res
select 
	isnull(sum(b.maincount),0),
	isnull(sum(b.underrepaircount),0),
	isnull(sum(b.addedcount),0)
from dept d, BedPattern b
where d.DeptTypeid=3
	and b.MasterId=d.id
	and d.parentid=@dept
	and b.StartDate<=@TheDate
	and (b.EndDate IS NULL or b.EndDate>@TheDate)
END
	RETURN 
END
