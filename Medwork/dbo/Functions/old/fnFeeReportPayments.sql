
CREATE FUNCTION fnFeeReportPayments (@sDate DateTime, @eDate DateTime)
RETURNS @result TABLE (
	 [DataOplati] [datetime]
	,[PatBriefName] [varchar](50)
	,[PatID] [int]
	,[DocNumber] [nvarchar](50)
	,[Summa] [float]
	,[PaidFromAccount] [varchar](1)
	)
AS
begin

insert into @result
select 
 DataOplati
,dbo.fnPatBriefName(PatID) [PatBriefName]
,PatID
,DocNumber
,Summa 
,(case when isNull(PayType,-1)=0 then '+' else null end) [PaidFromAccount]
from payment
where 
DataOplati>=@sDate and DataOplati<=@eDate
and nullif(docnumber,'') is not null
order by DataOplati,patid

return
end
