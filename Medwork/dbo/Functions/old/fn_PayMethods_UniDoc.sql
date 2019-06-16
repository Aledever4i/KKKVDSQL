
CREATE FUNCTION fn_PayMethods_UniDoc (@PatID_ int, @date datetime)
RETURNS TABLE 
AS RETURN 
(
select *
from fn_PayMethods (@PatID_, @date)
where PayType<>4
)
