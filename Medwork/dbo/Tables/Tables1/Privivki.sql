CREATE TABLE [dbo].[Privivki] (
    [ID]             INT           NOT NULL,
    [PatID]          INT           NULL,
    [MasterID]       INT           NULL,
    [Kogda]          DATETIME      NULL,
    [KakayaPrivivka] NVARCHAR (50) NULL,
    CONSTRAINT [PrivivkiPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PrivivkiToSignalnieOtmetki] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[SignalnieOtmetki] ([ID]) ON DELETE CASCADE
);

