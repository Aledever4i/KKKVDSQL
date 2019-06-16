
CREATE FUNCTION [dbo].[ObratniyTalonCount]
(@PatID INT)
RETURNS INT
AS
begin
	declare @c int
	select @c=count(*) from ObratniyTalon 
			where DocDate between 
			(select max(StartDate) from shifts where StartDate<=GETDATE() and FinishDate>=GETDATE())
			and (select max(FinishDate) from shifts where StartDate<=GETDATE() and FinishDate>=GETDATE())
			and PatID=@PatID
	return @c
end
