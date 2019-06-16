

CREATE FUNCTION [dbo].[CyrToLat]
(@string nvarchar(100))
RETURNS nvarchar(100)
AS
BEGIN

declare @result nvarchar (50)
set @result=''
set @string=LTrim(RTrim(@string))
while Len(@string)>0 
begin
	set @result=@result+dbo.CyrToLat_char(Left(@string,1))
	set @string=Right(@string,Len(@string)-1)
end
return @result

END
