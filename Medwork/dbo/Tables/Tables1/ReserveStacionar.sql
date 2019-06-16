CREATE TABLE [dbo].[ReserveStacionar] (
    [ID]                             INT           NOT NULL,
    [Caption]                        NVARCHAR (50) NULL,
    [Status]                         NVARCHAR (50) NULL,
    [PatId]                          INT           NULL,
    [DataS]                          DATETIME      NULL,
    [DataPo]                         DATETIME      NULL,
    [OtdId]                          INT           NULL,
    [PalId]                          NVARCHAR (50) NULL,
    [PatsientLezhit]                 NVARCHAR (1)  NULL,
    [RoomIndex]                      NVARCHAR (4)  NULL,
    [DictIshodObrasheniyaVOtdelenie] INT           NULL,
    [BedProfile]                     INT           NULL,
    [Memo1]                          NTEXT         NULL,
    [LastName]                       NVARCHAR (20) NULL,
    [FirstName]                      NVARCHAR (20) NULL,
    [SecondName]                     NVARCHAR (20) NULL,
    [Comment]                        NTEXT         NULL,
    [RecID]                          INT           NULL,
    CONSTRAINT [ReserveStacionarPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO

CREATE TRIGGER [dbo].[tgReserveStacionar_hgOccupation_OnDelete] ON [dbo].[ReserveStacionar]  FOR DELETE 
AS
DELETE hgOccupation  FROM   DELETED d, hgOccupation c  where   d.ID = c.UplinkID and   c.UplinkTarget = 'ReserveStacionar'

