CREATE TABLE [dbo].[Requisition] (
    [ID]                INT            NOT NULL,
    [PatID]             INT            NULL,
    [SampleInfo]        NVARCHAR (50)  NULL,
    [Laboratory]        INT            NULL,
    [Priority]          NVARCHAR (50)  NULL,
    [AnalysisKind]      INT            NULL,
    [NapID]             INT            NULL,
    [SpecimenType]      NVARCHAR (150) NULL,
    [ReqID]             NVARCHAR (50)  NULL,
    [SpecimenTypeID]    NVARCHAR (256) NULL,
    [Document]          IMAGE          NULL,
    [comment]           NVARCHAR (MAX) NULL,
    [GUID]              NVARCHAR (40)  NULL,
    [BarCodeConteinera] INT            NULL,
    [DeptID]            INT            NULL,
    [VrachId]           INT            NULL,
    CONSTRAINT [PK_Requisition] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [RequisitionToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);


GO

CREATE TRIGGER [dbo].[Requisition_Delete] 
ON [dbo].[Requisition] 
For DELETE
AS
begin
set nocount on
declare @c int

	select @c=Count(*)
	from deleted d, Laboratory L
	where IsNull(d.ReqID,'')<>'' and l.id=d.Laboratory and l.type=1

if @c>0
	raiserror('Нельзя удалять заявки с присвоенным ИНЗ',16,1)
end
