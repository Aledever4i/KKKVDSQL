CREATE FUNCTION dbo.fnDict
(
	@FORM NVARCHAR(255)
)
RETURNS @ResultTable table
(
  ID int Primary Key,  
  Text NVARCHAR(255),
  Text2 NVARCHAR(255),
  ord int
)
BEGIN
	INSERT INTO @ResultTable (
		ID, 
		Text, 
		Text2, 
		ord
	)
	select 
		d1.code as ID, 
		d1.text, 
		d1.text2, 
		d1.ord 
		from dbo.dict AS d1 
		JOIN dbo.dict AS d2 ON d2.ID = d1.MasterID AND d2.[Column] = @FORM
		
	RETURN
END

