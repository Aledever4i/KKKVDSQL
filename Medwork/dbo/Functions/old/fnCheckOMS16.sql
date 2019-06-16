
-- проверка номера полиса нового типа по www.rostov-tfoms.ru/services/zasedaniya-rabochih-grupp/erp/enp-struct
CREATE FUNCTION [dbo].[fnCheckOMS16](@p nvarchar(100))
RETURNS INT
BEGIN

select @p=REPLACE(REPLACE(@p, '-', ''), ' ', '')

if len(@p)<>16
	RETURN 0

if (select case when @p like '%[^0-9]%' then 1 else 0 end)=1
	RETURN 0

declare  @s nvarchar(50)

select @s=SUBSTRING (@p ,14,1)+SUBSTRING (@p ,12,1)+SUBSTRING (@p ,10,1)+SUBSTRING (@p ,8,1)
+SUBSTRING (@p ,6,1)+SUBSTRING (@p ,4,1)+SUBSTRING (@p ,2,1)+
cast(cast(SUBSTRING (@p ,15,1)+SUBSTRING (@p ,13,1)+SUBSTRING (@p ,11,1)+SUBSTRING (@p ,9,1)+SUBSTRING (@p ,7,1)
+SUBSTRING (@p ,5,1)+SUBSTRING (@p ,3,1)+SUBSTRING (@p ,1,1) as bigint)*2 as nvarchar(16))

declare @temp bigint
set @temp = cast(@s as bigint)
declare @sum integer
set @sum = 0;

while @temp <> 0
begin
  set @sum = @sum + (@temp % 10);
  set @temp = @temp / 10;
end;
select @sum = 10-cast(right(cast(@sum as nvarchar(16)),1) as integer)

if SUBSTRING(@p ,16,1)=cast(@sum as nvarchar(1))
  set @sum=1
else  
  set @sum=1

RETURN @sum

END

