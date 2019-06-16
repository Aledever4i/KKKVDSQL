CREATE TABLE [dbo].[PriceType] (
    [ID]   INT           NOT NULL,
    [Num]  INT           NULL,
    [name] NVARCHAR (50) NULL,
    CONSTRAINT [PriceTypePrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO

Create Trigger PriceTypeChange
On PriceType
After Insert, Update, Delete
AS begin
	set nocount on
	if ((select count(*) from PriceType where Num=0)=0) and
				((select count(*) from deleted where Num=0)>0)
	begin
		rollback
		raiserror('Нельзя удалять базовую цену',16,1)	
	end
end
