CREATE FUNCTION dbo.GetRuEnReplace
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
		SET @Result = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(@Result, 'Й', 'Q'), 'Ц', 'W'), 'У', 'E'), 'К', 'R'), 'Е', 'T')
		SET @Result = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(@Result, 'Н', 'Y'), 'Г', 'U'), 'Ш', 'I'), 'Щ', 'O'), 'З', 'P')
		SET @Result = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(@Result, 'Ф', 'A'), 'Ы', 'S'), 'В', 'D'), 'А', 'F'), 'П', 'G')
		SET @Result = REPLACE(REPLACE(REPLACE(REPLACE(@Result, 'Р', 'H'), 'О', 'J'), 'Л', 'K'), 'Д', 'L')
		SET @Result = REPLACE(REPLACE(REPLACE(REPLACE(@Result, 'Я', 'Z'), 'Ч', 'X'), 'С', 'C'), 'М', 'V')
		SET @Result = REPLACE(REPLACE(REPLACE(@Result, 'И', 'B'), 'Т', 'N'), 'Ь', 'M')
	END
	
	SET @Result = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(@Result, 'й', 'q'), 'ц', 'w'), 'у', 'e'), 'к', 'r'), 'е', 't')
	SET @Result = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(@Result, 'н', 'y'), 'г', 'u'), 'ш', 'i'), 'щ', 'o'), 'з', 'p')
	SET @Result = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(@Result, 'ф', 'a'), 'ы', 's'), 'в', 'd'), 'а', 'f'), 'п', 'g')
	SET @Result = REPLACE(REPLACE(REPLACE(REPLACE(@Result, 'р', 'h'), 'о', 'j'), 'л', 'k'), 'д', 'l')
	SET @Result = REPLACE(REPLACE(REPLACE(REPLACE(@Result, 'я', 'z'), 'ч', 'x'), 'с', 'c'), 'м', 'v')
	SET @Result = REPLACE(REPLACE(REPLACE(@Result, 'и', 'b'), 'т', 'n'), 'ь', 'm')
	
	RETURN @Result
END