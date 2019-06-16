CREATE TABLE [dbo].[SoglasieNaMeditsinskoeVmeshatelstvo] (
    [ID]       INT           NOT NULL,
    [PatID]    INT           NULL,
    [Date]     DATETIME      NULL,
    [Vrah]     NVARCHAR (50) NULL,
    [Soglasie] NTEXT         NULL,
    CONSTRAINT [SoglasieNaMeditsinskoeVmeshatelstvoPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [SoglasieNaMeditsinskoeVmeshatelstvoToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

