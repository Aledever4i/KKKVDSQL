CREATE PROCEDURE [dbo].[spCashOrderNum]
as
BEGIN
	set nocount on
	declare @i int
	set @i = (select max(num)+1 from CashOrderNum)
	update CashOrderNum set num=@i
	return @i
END
