CREATE TABLE [dbo].[InventDocSpecification] (
    [ID]             INT           NOT NULL,
    [MasterID]       INT           NULL,
    [ServiceCode]    NVARCHAR (50) NULL,
    [ServiceName]    NVARCHAR (50) NULL,
    [Quant]          INT           NULL,
    [ServiceMeasure] NVARCHAR (50) NULL,
    [Summa]          FLOAT (53)    NULL,
    [Price]          FLOAT (53)    NULL,
    CONSTRAINT [InventDocSpecificationPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO

CREATE TRIGGER InventDocSpecification_IUD
ON InventDocSpecification
FOR INSERT, UPDATE, DELETE 
AS
 BEGIN

  SET NOCOUNT ON

  DECLARE @i int

  DECLARE tmp_cursor CURSOR FOR
  select ID from deleted union select ID from inserted

  OPEN tmp_cursor
  FETCH NEXT FROM tmp_cursor INTO @i
  WHILE @@FETCH_STATUS = 0 
    BEGIN 
     execute dbo.EditGoodsMoveFromInventDocSpecification @i
     FETCH NEXT FROM tmp_cursor INTO @i
    END

  close  tmp_cursor
  DEALLOCATE tmp_cursor

 END

