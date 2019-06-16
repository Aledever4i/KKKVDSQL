CREATE FUNCTION fnDictValue(@FORM NVARCHAR(255), @ID INTEGER)
RETURNS NVARCHAR(255)
BEGIN
	return (select top 1 d1.text from dict d1 join dict d2 on d2.ID=d1.MasterID and d2.[Column]=@FORM where d1.code=@ID)
END
