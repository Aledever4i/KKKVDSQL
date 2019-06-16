CREATE TABLE [dbo].[Contracts] (
    [ID]             INT           NOT NULL,
    [MasterID]       INT           NULL,
    [BEG_DATE]       DATETIME      NULL,
    [END_DATE]       DATETIME      NULL,
    [Data]           DATETIME      NULL,
    [ContractNumber] NVARCHAR (20) NULL,
    [off]            INT           NULL,
    [NextDog]        INT           NULL,
    [ContractDoc]    IMAGE         NULL,
    [Notes]          NVARCHAR (50) NULL,
    CONSTRAINT [ContractsPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [ContractsToorganisations] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[Organisations] ([ID]) ON DELETE CASCADE
);


GO

CREATE TRIGGER [dbo].[Contracts_Delete] ON [dbo].[Contracts]
FOR DELETE AS
Begin
	set nocount on
	declare @c int
	select @c=Count(*) from attachment a 
	where a.Dog in (select d.id from deleted d)
	if @c>0
	begin
		raiserror('INFORMATION: Нельзя удалить организацию или договор по которому были созданы прикрепления',16,1)
		rollback transaction
	end
End

GO


CREATE TRIGGER Contracts_AttachDelete ON Contracts
 FOR DELETE AS
 DELETE _MedworkDocAttachments
 FROM 
 DELETED d
 where 
 _MedworkDocAttachments.PatFormID is null
 and _MedworkDocAttachments.LinkedTable = 'Contracts'
 and d.ID = _MedworkDocAttachments.LinkedTableID
 
