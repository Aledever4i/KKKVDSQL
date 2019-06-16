CREATE TABLE [dbo].[Gospitalizatsiya] (
    [ID]                        INT           NOT NULL,
    [PatID]                     INT           NULL,
    [DataGospitalizatsii]       DATETIME      NULL,
    [PatsientNapravlen]         INT           NULL,
    [TipGospitalizatsii]        INT           NULL,
    [KodNapravivshegoLpu]       NVARCHAR (25) NULL,
    [Memo1]                     NTEXT         NULL,
    [KodLpuPrikrepleniya]       NVARCHAR (25) NULL,
    [NazvanieLpuPrikrepleniya]  NVARCHAR (25) NULL,
    [DataPredpolagaemoyVipiski] DATETIME      NULL,
    [DataVipiski]               DATETIME      NULL,
    [DiagnozNapravivshegoLpu]   NTEXT         NULL,
    [VremyaGospitalizatsii]     DATETIME      NULL,
    [NomerPalati]               NVARCHAR (50) NULL,
    [Vipisan]                   NVARCHAR (1)  NULL,
    [Otdelenie]                 NVARCHAR (60) NULL,
    [IdDept]                    INT           NULL,
    [RoomIndex]                 INT           NULL,
    CONSTRAINT [GospitalizatsiyaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [GospitalizatsiyaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);


GO
CREATE TRIGGER tgGospitalizatsiya_hgOccupation_OnDelete ON Gospitalizatsiya FOR DELETE AS DELETE PATFORM FROM DELETED AS d INNER JOIN hgOccupation AS l INNER JOIN PATFORM P ON p.id = l.id ON l.UplinkId = d.ID  WHERE l.UplinkTarget = 'Gospitalizatsiya'