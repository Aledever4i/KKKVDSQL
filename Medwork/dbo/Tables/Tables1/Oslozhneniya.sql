CREATE TABLE [dbo].[Oslozhneniya] (
    [ID]                    INT           NOT NULL,
    [PatID]                 INT           NULL,
    [MasterID]              INT           NULL,
    [Data]                  DATETIME      NULL,
    [VozniksheeOslozhnenie] NVARCHAR (50) NULL,
    CONSTRAINT [OslozhneniyaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [OslozhneniyaToTechenieIOslozhneniyaNastoyasheyBeremennosti] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[TechenieIOslozhneniyaNastoyasheyBeremennosti] ([ID]) ON DELETE CASCADE
);

