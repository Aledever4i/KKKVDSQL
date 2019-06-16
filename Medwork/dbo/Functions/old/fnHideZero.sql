
CREATE FUNCTION fnHideZero(@Value FLOAT)
RETURNS FLOAT
BEGIN
  RETURN (
    SELECT 
      CASE 
        WHEN @Value=0 THEN NULL
        ELSE @Value 
      END
    )
END
