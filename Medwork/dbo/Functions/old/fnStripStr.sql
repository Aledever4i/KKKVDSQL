CREATE FUNCTION [dbo].[fnStripStr](@Src NVARCHAR(255), @AllowedSymbols NVARCHAR(100))
RETURNS NVARCHAR(255)
BEGIN

  Declare @I INT
  Declare @Res NVARCHAR(255)
  Set @I = 0
  Set @Res = ''
  --Set @AllowedSymbols='['+@AllowedSymbols+']';

  WHILE (@I < len(@Src)) 
  BEGIN
    set @I = @I + 1
    --if SUBSTRING(@Str, @I, 1) LIKE @AllowedSymbols 
    if CharIndex(SUBSTRING(@Src, @I, 1), @AllowedSymbols) > 0
    begin
     set @Res = @Res + SUBSTRING(@Src, @I, 1)
    end
  END 
  return(select @Res)
END
