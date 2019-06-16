CREATE TABLE [dbo].[stationar_VipiskaIzIstoriBolezni] (
    [ID]       INT           NOT NULL,
    [PatID]    INT           NULL,
    [Nomer]    NVARCHAR (20) NULL,
    [Recomend] NTEXT         NULL,
    CONSTRAINT [stationar_VipiskaIzIstoriBolezniPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [stationar_VipiskaIzIstoriBolezniToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

