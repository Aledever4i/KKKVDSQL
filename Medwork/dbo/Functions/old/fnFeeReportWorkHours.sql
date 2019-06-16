
CREATE FUNCTION fnFeeReportWorkHours (@sDate DateTime, @eDate DateTime)
RETURNS @result TABLE (
	 [UsrName] [nvarchar](20)
	,[UsrID] [int]
	,[WorkClinic] [float]
	,[WorkHome] [float]
	)
AS
begin

insert into @result
select 
 u.name as [UsrName]
,u.ID as [UsrID]
,isNull(polyclinicwork,0)+isNull(WorkClinic,0)
,isNull(HomeWork,0)+isNull(WorkHome,0)
from (select doctorcode,sum(polyclinicwork) polyclinicwork, sum(HomeWork) HomeWork from workhours
where [year]>=year(@sDate) and [year]<=year(@eDate)
and ([year]>year(@sDate) or [month]>=month(@sDate)) 
and ([year]<year(@eDate) or [month]<=month(@eDate))
and (isNull(polyclinicwork,0)>0 or isNull(HomeWork,0)>0)
group by doctorcode) monthly 
--right join 
full join
(select did,sum(WorkClinic) WorkClinic, sum(WorkHome) WorkHome from WorkHome
where whDate>=@sDate and whDate<=@eDate
group by did) daily 
on monthly.doctorcode=daily.did
left join usr u on u.id=isNull(doctorcode,did)

return
end
