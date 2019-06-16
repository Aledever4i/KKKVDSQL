CREATE TABLE [dbo].[VipiskaIzIstoriiBolezni] (
    [ID]                     INT           NOT NULL,
    [PatID]                  INT           NULL,
    [Specalist]              NVARCHAR (50) NULL,
    [Data]                   DATETIME      NULL,
    [Time]                   DATETIME      NULL,
    [DataPostupleniya]       DATETIME      NULL,
    [DataVipiski]            DATETIME      NULL,
    [ProvedLech]             NTEXT         NULL,
    [epikriz]                NTEXT         NULL,
    [RezultatiObsledovaniya] NTEXT         NULL,
    [PatBrName]              NVARCHAR (50) NULL,
    [analizi]                NTEXT         NULL,
    [PatBDate]               DATETIME      NULL,
    [Protocoloper]           NTEXT         NULL,
    [SpecZakl]               NTEXT         NULL,
    CONSTRAINT [VipiskaIzIstoriiBolezniPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [VipiskaIzIstoriiBolezniToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

