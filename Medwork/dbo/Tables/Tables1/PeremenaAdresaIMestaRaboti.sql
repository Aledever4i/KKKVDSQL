CREATE TABLE [dbo].[PeremenaAdresaIMestaRaboti] (
    [ID]    INT NOT NULL,
    [PatID] INT NULL,
    CONSTRAINT [PeremenaAdresaIMestaRabotiPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PeremenaAdresaIMestaRabotiToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

