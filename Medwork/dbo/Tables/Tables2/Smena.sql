CREATE TABLE [dbo].[Smena] (
    [Data]     DATETIME      NULL,
    [ID]       INT           NULL,
    [MasterId] INT           NULL,
    [Newadres] NVARCHAR (20) NULL,
    CONSTRAINT [SmenaToPeremenaAdresaIMestaRaboti] FOREIGN KEY ([MasterId]) REFERENCES [dbo].[PeremenaAdresaIMestaRaboti] ([ID]) ON DELETE CASCADE
);

