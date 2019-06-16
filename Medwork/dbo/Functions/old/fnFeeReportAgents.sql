
CREATE FUNCTION fnFeeReportAgents (@sDate DateTime, @eDate DateTime)
RETURNS @result TABLE (
	 [UsrName] [nvarchar](20)
	,[UsrID] [int]
	,[PatBriefName] [varchar](50)
	,[PatID] [int]
	,[DataS] [datetime]
	,[DataPo] [datetime]
	,[AgentPercent] [float]
	,[ServicesSum] [money]
	,[AgentFee] [money]
	)
AS
begin

insert into @result
select 
 u.name as [UsrName]
,u.ID as [UsrID]
,dbo.fnPatBriefName(pa.PatID) [PatBriefName]
,pa.PatID
,pa.DataS
,pa.DataPo
,pa.AgentPercent
,sum([Summa]) as [ServicesSum]
,sum([Summa])*(pa.AgentPercent/100) as [AgentFee]
from
fnFeeReportPayments(@sDate,@eDate) pm
inner join PatAgents pa on pa.patid = pm.patid
	and ((pa.DataS <= pm.DataOplati) or pa.DataS is null) and ((pa.DataPo >= pm.DataOplati) or pa.DataPo is null)
	and pa.Annulirovan<>'+'
left join usr u on u.id=pa.AgentUserID
group by 
 pa.id
,pa.PatID
,pa.DataS
,pa.DataPo
,pa.AgentPercent
,u.ID
,u.name

return
end
