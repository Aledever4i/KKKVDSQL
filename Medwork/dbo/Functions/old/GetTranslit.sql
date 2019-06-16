CREATE FUNCTION [dbo].[GetTranslit]
(
	@String varchar(MAX),
	@IncludeCaps bit
)
RETURNS varchar(MAX)
AS
BEGIN
	DECLARE @Result varchar(MAX)
	SET @Result = @String
	
	IF (@IncludeCaps = 1)
	BEGIN
		SET @Result = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(@Result, 'А', 'A'), 'Б', 'B'), 'В', 'V'), 'Г', 'G'), 'Д', 'D')
		SET @Result = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(@Result, 'Е', 'E'), 'Ё', 'Yo'), 'Ж', 'Zh'), 'З', 'Z'), 'И', 'I')
		SET @Result = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(@Result, 'Й', 'II'), 'К', 'K'), 'Л', 'L'), 'М', 'M'), 'Н', 'N')
		SET @Result = REPLACE(REPLACE(REPLACE(REPLACE(@Result, 'О', 'O'), 'П', 'P'), 'Р', 'R'), 'С', 'S')
		SET @Result = REPLACE(REPLACE(REPLACE(REPLACE(@Result, 'У', 'Y'), 'Ф', 'F'), 'Х', 'H'), 'Ц', 'Ts')
		SET @Result = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(@Result, 'Ш', 'Sh'), 'Щ', 'Sch'), 'Т', 'T'), 'Ъ', ''), 'Ь', '')
		SET @Result = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(@Result, 'Ю', 'Yu'), 'Я', 'Ya'), 'Ч', 'Ch'), 'Ы', 'Y'), 'Э', 'E')
	END
	
	SET @Result = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(@Result, 'а', 'a'), 'б', 'b'), 'в', 'v'), 'г', 'g'), 'д', 'd')
	SET @Result = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(@Result, 'е', 'e'), 'ё', 'yo'), 'ж', 'zh'), 'з', 'z'), 'и', 'i')
	SET @Result = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(@Result, 'й', 'y'), 'к', 'k'), 'л', 'l'), 'м', 'm'), 'н', 'n')
	SET @Result = REPLACE(REPLACE(REPLACE(REPLACE(@Result, 'о', 'o'), 'п', 'p'), 'р', 'r'), 'с', 's')
	SET @Result = REPLACE(REPLACE(REPLACE(REPLACE(@Result, 'у', 'u'), 'ф', 'f'), 'х', 'x'), 'ц', 'tc')
	SET @Result = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(@Result, 'ш', 'sh'), 'щ', 'sch'), 'т', 't'), 'ъ', ''), 'ь', '')
	SET @Result = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(@Result, 'ю', 'yu'), 'я', 'ya'), 'ч', 'ch'), 'ы', 'y'), 'э', 'e')
	
	RETURN @Result
END