CREATE TABLE [dbo].[SostoyaniePriPostuplenii] (
    [ID]                      INT           NOT NULL,
    [PatID]                   INT           NULL,
    [Data]                    DATETIME      NULL,
    [Vrach]                   NVARCHAR (50) NULL,
    [DannieNaruzhnogoOsmotra] NTEXT         NULL,
    [Serdtse]                 NVARCHAR (50) NULL,
    [Puls]                    INT           NULL,
    [ADsis]                   INT           NULL,
    [ADdiast]                 INT           NULL,
    [ADsis1]                  INT           NULL,
    [ADdiast1]                INT           NULL,
    [OrganiDihaniya]          NTEXT         NULL,
    [OrganiPishevareniya]     NTEXT         NULL,
    [MochevayaSistema]        NTEXT         NULL,
    [MochaPriKipyachenii]     NVARCHAR (50) NULL,
    CONSTRAINT [SostoyaniePriPostupleniiPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [SostoyaniePriPostupleniiToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

