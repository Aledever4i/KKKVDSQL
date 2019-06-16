
-- функция возвращает последнюю дату в месяце

CREATE FUNCTION fnLastMonthDate(@Value DATETIME)
RETURNS DATETIME
BEGIN
  DECLARE @V DATETIME
  SELECT @V = DATEADD(m,1,@Value+1-Day(@Value))-1
  RETURN @V
END
