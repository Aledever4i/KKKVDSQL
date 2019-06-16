CREATE TABLE [dbo].[ZaklDiag] (
    [ID]            INT            NOT NULL,
    [PatID]         INT            NULL,
    [MasterID]      INT            NULL,
    [Vrach]         INT            NULL,
    [Data]          DATETIME       NULL,
    [first]         BIT            NULL,
    [prof]          BIT            NULL,
    [DiagCode]      NVARCHAR (7)   NULL,
    [isOff]         BIT            NULL,
    [OffDate]       DATETIME       NULL,
    [sourceId]      INT            NULL,
    [source]        NVARCHAR (255) NULL,
    [Text]          VARCHAR (4000) NULL,
    [DiagType]      INT            NULL,
    [UnsetDoctor]   INT            NULL,
    [DiagKind]      INT            NULL,
    [Final]         BIT            DEFAULT ((0)) NOT NULL,
    [Smert]         BIT            NULL,
    [AddToZaklDiag] BIT            NULL,
    [Hron]          BIT            NULL,
    CONSTRAINT [ZaklDiagPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ZaklDiag_PatForm] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);


GO

CREATE TRIGGER [dbo].[ListZaklDiagCreateHead] 
   ON  [dbo].[ZaklDiag] 
   AFTER INSERT
AS 
BEGIN
	--при вставке записи в позиции листа уточнённых диагнозов, если для данного пациента нет головы, создаётся
	SET NOCOUNT ON;
	declare @PatFormId int, @id int, @patid int, @userid int, @AddToZaklDiag bit
	
	select top 1 @patid=i.patid, @userid=f.AuthorID, @AddToZaklDiag=AddToZaklDiag from inserted i join PatForm f on i.MasterID=f.id order by f.id desc
	
	Set @PatFormId=(select top 1 id from patform with (nolock) where PatId=@PatId and FormId=3754)
	if @PatFormId is null
	begin
		Set @PatFormId = IsNull((Select Max(ID)+1 From PatForm),1)
		Insert Into PatForm (PatID, FormID, FormNo, AuthorId, CreateTime, UpdateTime, Security, ID)
		Values (@PatId, 3754, 0, @UserId, GetDate(), GetDate(), 0, @PatFormId)
		
		Insert Into ListZaklDiag (ID, PatID)
		Values (@PatFormId, @PatId)
	end
END

