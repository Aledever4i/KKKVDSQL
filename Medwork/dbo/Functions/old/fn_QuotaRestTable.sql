
CREATE FUNCTION [dbo].[fn_QuotaRestTable] (@QuotaId int, @ddate datetime, @all bit = 1)
RETURNS @t TABLE (
		[ID] [int],
		[qty] INT,
		[qty_fact] INT,
		[rest] INT
		)
AS
BEGIN
WITH TT (ID) AS 
(
    SELECT @quotaid
    UNION ALL
    SELECT QuotaLinkedId
	FROM Quota_Linked Q
	INNER JOIN TT ON (Q.QuotaMasterId = TT.ID)
)
INSERT INTO @t (ID, qty, qty_fact)
SELECT K.ID, K.qty, 
	(SELECT COUNT([UID])
	 FROM v_Quota_Log
	 WHERE (quota_id=K.id) 	AND (
	 ( (ISNULL(K.period, 0) = 0)
		OR (ISNULL(K.period, 0) = 1) AND (quota_date=dbo.fndate(@ddate))   ) 
		OR ((ISNULL(K.period, 0) = 2) AND (quota_date>=DATEADD(dd, - datepart(dw, dbo.fndate(@ddate)) + 1, dbo.fndate(@ddate)))  AND (quota_date<DATEADD(dd, - datepart(dw, dbo.fndate(@ddate)) + 8, dbo.fndate(@ddate))))
		OR ((ISNULL(K.period, 0) = 3) AND (quota_date>=cast(convert(char(6),dbo.fndate(@ddate),112)+'01' as datetime)) AND (quota_date<dateadd(day,-1, convert(char(6), dateadd(month,1,dbo.fndate(@ddate)),112)+'01')+1)) 
		OR ((ISNULL(K.period, 0) = 4) AND (quota_date>=dateadd(month,3*(datepart(quarter,dbo.fndate(@ddate))-1), datename(year,dbo.fndate(@ddate)))) 
		AND (quota_date<dateadd(day,-1, dateadd(month,3*datepart(quarter,dbo.fndate(@ddate)), datename(year,dbo.fndate(@ddate))))+1)) 
		OR ((ISNULL(K.period, 0) = 5) AND (quota_date>=cast(datename(year,dbo.fndate(@ddate)) as datetime)) AND (quota_date<cast(datename(year,dbo.fndate(@ddate))+'1231' as datetime)+1))
		)
	 ) [qty_fact]
FROM
Quota K 
INNER JOIN TT ON (K.ID=TT.ID)
WHERE ((DateS IS NULL) OR (DateS <= @ddate)) AND ((DateE IS NULL) OR (DateE >= @ddate))
AND ((@all = 1) OR (ISNULL(K.severity, 0) = 0))

UPDATE @t SET rest = qty - qty_fact

RETURN
END
