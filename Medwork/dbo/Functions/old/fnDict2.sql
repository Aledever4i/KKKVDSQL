
CREATE FUNCTION [dbo].[fnDict2](@ColumnName NVARCHAR(255), @FormID int = -1)
RETURNS @ResultTable TABLE (
  ID NVARCHAR(255),
  Text NVARCHAR(255),
  Text2 NVARCHAR(255),
  ord int
  )
BEGIN
	INSERT INTO @ResultTable (ID, Text, Text2, ord)
	select distinct d1.code as ID, d1.text, d1.text2, d1.ord 
	from dict d1 
		join dict d2 on d2.ID=d1.MasterID and d2.[Column]=@ColumnName
		join dict d3 on d3.ID=d2.MasterID and (d3.[FormId]=@FormID or @FormID=-1)
	RETURN
END



