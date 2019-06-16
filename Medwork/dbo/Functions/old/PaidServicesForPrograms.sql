
CREATE FUNCTION [dbo].[PaidServicesForPrograms]()
RETURNS @t TABLE (
		[ID] [int] NOT NULL,
		[Code] [nvarchar](20),
		[ServiceName] [nvarchar](255),
		[BasePrice] [float],
		[Price] [float],
		[MasterID] [int],
		[NodeType] [nvarchar](12),
		[Komment] nvarchar(200),
		[Duration] [int],
		[feepercent] [float],
		[Fee] [money],
		[MaxCount] [int],
		[TotalCount] [int],
		ProgramId int
		)
AS
begin
	declare @id int
	
	declare InsPr cursor for
	select Id
	from InsuranceProgram
	open InsPr

	FETCH NEXT FROM InsPr
	into @Id
	
	WHILE @@FETCH_STATUS = 0
	BEGIN
		insert into @t
		select *, @Id
		from PaidServicesForProgram(@id)
		
		FETCH NEXT FROM InsPr
		into @Id
	END
	
	CLOSE InsPr
	DEALLOCATE InsPr
	
	return
end
