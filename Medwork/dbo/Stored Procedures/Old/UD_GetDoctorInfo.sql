
Create PROCEDURE UD_GetDoctorInfo
	@CardNum int,
	@WHDate DateTime
As
Select
	a.id [ID],
	LTrim(RTrim(a.LastName+' '+CoalEsce(a.FirstName,''))+' '+RTrim(CoalEsce(a.SecondName,''))) [Name],
	a.Attendance [CanP],
	a.Desease [CanD],
	a.FreeService [CanBPU],
	a.PayService [CanPU],
	b.workhome [WorkHome],
	d.Type,
	isnull(a.isStomat, 0) [isStomat],
	isnull(a.DateOn, cast(10000 as datetime)) [DateOn],
	isnull(a.DateOff, cast(90000 as datetime))  [DateOff]
	,d.Name [DeptName]
from
	usr a left join workhome b on (b.did=a.id and	b.whDate=@WHDate) left join Dept d on a.DeptID=d.ID
where
	CardNum=@CardNum	
