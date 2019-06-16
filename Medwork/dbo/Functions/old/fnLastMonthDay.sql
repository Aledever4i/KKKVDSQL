
-- функция возвращает последний день в месяце

CREATE FUNCTION fnLastMonthDay(@Value DATETIME)
RETURNS INT
BEGIN
  DECLARE @V INTEGER
  SELECT @V = DAY(DATEADD(m,1,@Value+1-Day(@Value))-1)
  RETURN @V
END
