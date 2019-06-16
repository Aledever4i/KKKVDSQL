
CREATE FUNCTION fnDateTimeToText(@Date DATETIME, @Time DATETIME, @Today DATETIME)
RETURNS VARCHAR(35)
BEGIN
  RETURN (
  SELECT 

  CASE 
    WHEN @Time IS NULL THEN 'не указано'
    ELSE 
     
    CASE 
			WHEN DateDiff(dd, @Today, @Date)=0 THEN CONVERT(CHAR(8),@Time, 108)+' - сегодня'
			WHEN DateDiff(dd, @Today, @Date)=1 THEN CONVERT(CHAR(8),@Time, 108)+' - завтра'
			WHEN DateDiff(dd, @Today, @Date)=-1 THEN CONVERT(CHAR(8),@Time, 108)+' - вчера'
			ELSE CONVERT(CHAR(10),@Date, 104)
		END
  END


  )
END
