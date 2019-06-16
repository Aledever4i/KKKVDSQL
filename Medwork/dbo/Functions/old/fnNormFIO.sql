
create Function fnNormFIO(@name as nvarchar(50))
returns nvarchar(50)
begin
--Убираем лишние пробелы и делаем все буквы маленькими
set @name=LOWER(RTrim(LTrim(@name)))
declare @name2 nvarchar(50)
set @name2=''
while @name<>@name2
begin
	set @name2=@name
	set @name=REPLACE(@name,'  ',' ')
	set @name=REPLACE(@name,' -','-')
	set @name=REPLACE(@name,'- ','-')
end

--Делаем заглавными все буквы сразу после пробелов
declare @i int
set @i=CHARINDEX(' ',@name)
while (@i<>0) and (@i<Len(@name))
begin
	set @name=Left(@name,@i)+UPPER(substring(@name,@i+1,1))+Right(@name, Len(@name)-@i-1)
	set @i=CHARINDEX(' ',@name,@i+1)
end

--Делаем заглавными все буквы сразу после тире
set @i=CHARINDEX('-',@name)
while (@i<>0) and (@i<Len(@name))
begin
	set @name=Left(@name,@i)+UPPER(substring(@name,@i+1,1))+Right(@name, Len(@name)-@i-1)
	set @i=CHARINDEX('-',@name,@i+1)
end

--Делаем заглавной первую букву
if Len(@name)>0
	set @name=UPPER(substring(@name,1,1))+Right(@name, Len(@name)-1)

return @name
end
