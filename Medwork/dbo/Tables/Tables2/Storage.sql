CREATE TABLE [dbo].[Storage] (
    [ID]                INT            NOT NULL,
    [Name]              NVARCHAR (100) NULL,
    [JobPlan]           NVARCHAR (6)   NULL,
    [Enabled]           BIT            NULL,
    [Dept]              INT            NULL,
    [ResponsiblePerson] INT            NULL,
    [FullName]          NVARCHAR (100) NULL,
    [Person]            NVARCHAR (100) NULL,
    [DName]             NVARCHAR (100) NULL,
    CONSTRAINT [StoragePrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
--******************************************************************************
--Проверяем есть ли документы по складу ... если есть то запрещаем его удаление.
-- Назаркин Д.
--******************************************************************************

CREATE TRIGGER [TR_DEL_Storage] ON [dbo].[Storage] 
FOR DELETE 
AS
	if Exists( select ID  from StorageDocument (nolock) where Storage = (Select deleted.ID From deleted))  
	begin
	rollback tran
	raiserror 50001 'Удаление не возможно ! Есть документы, привязанные к данному складу. '
	end
	

