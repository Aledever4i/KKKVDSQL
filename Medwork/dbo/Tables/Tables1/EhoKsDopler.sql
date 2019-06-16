CREATE TABLE [dbo].[EhoKsDopler] (
    [ID]                  INT           NOT NULL,
    [PatID]               INT           NULL,
    [Data]                DATETIME      NULL,
    [NomerIssledovaniya]  INT           NULL,
    [Zaklyuchenie]        NTEXT         NULL,
    [DannieIssledovaniya] NTEXT         NULL,
    [Vrach]               NVARCHAR (50) NULL,
    CONSTRAINT [EhoKsDoplerPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [EhoKsDoplerToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

