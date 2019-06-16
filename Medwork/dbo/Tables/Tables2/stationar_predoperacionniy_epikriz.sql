CREATE TABLE [dbo].[stationar_predoperacionniy_epikriz] (
    [ID]                     INT           NOT NULL,
    [PatID]                  INT           NULL,
    [Nomer]                  NVARCHAR (20) NULL,
    [Recomend]               NTEXT         NULL,
    [narkoz]                 NVARCHAR (50) NULL,
    [DataPostupleniya]       DATETIME      NULL,
    [DataVipiski]            DATETIME      NULL,
    [PatBrName]              NVARCHAR (50) NULL,
    [PatBDate]               DATETIME      NULL,
    [ProvedLech]             NTEXT         NULL,
    [epikriz]                NTEXT         NULL,
    [RezultatiObsledovaniya] NTEXT         NULL,
    [analizi]                NTEXT         NULL,
    [SpecZakl]               NTEXT         NULL,
    [DiagOsn]                NTEXT         NULL,
    [Specalist]              NVARCHAR (50) NULL,
    [Data]                   DATETIME      NULL,
    [Time]                   DATETIME      NULL,
    CONSTRAINT [stationar_predoperacionniy_epikrizPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [stationar_predoperacionniy_epikrizToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

