CREATE TABLE [dbo].[PosmertniiEpikriz] (
    [ID]                       INT           NOT NULL,
    [PatID]                    INT           NULL,
    [Data]                     DATETIME      NULL,
    [Specalist]                NVARCHAR (50) NULL,
    [Time]                     DATETIME      NULL,
    [DanniePriPostuplenii]     NTEXT         NULL,
    [DataPostupleniya]         DATETIME      NULL,
    [NeposredPrichinaSmerti]   NTEXT         NULL,
    [Operacii]                 NTEXT         NULL,
    [DinamikaZabolevaniya]     NTEXT         NULL,
    [ProvedennoeLechenie]      NTEXT         NULL,
    [ProvedennieObsledovaniya] NTEXT         NULL,
    CONSTRAINT [PosmertniiEpikrizPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PosmertniiEpikrizToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

