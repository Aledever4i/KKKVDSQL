CREATE TABLE [dbo].[Perelivanie1] (
    [ID]                     INT NOT NULL,
    [PatID]                  INT NULL,
    [MasterID]               INT NULL,
    [KolichestvoPerelivaniy] INT NULL,
    [God]                    INT NULL,
    CONSTRAINT [Perelivanie1PrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [Perelivanie1ToSignalnieOtmetki] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[SignalnieOtmetki] ([ID]) ON DELETE CASCADE
);

