CREATE TABLE [dbo].[Rassilki] (
    [ID]          INT            NOT NULL,
    [PatID]       INT            NULL,
    [MasterID]    INT            NULL,
    [VidRassilki] NVARCHAR (100) NULL,
    CONSTRAINT [RassilkiPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [RassilkiToAnketaPoluchatelyaDiskontnoyKarti] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[AnketaPoluchatelyaDiskontnoyKarti] ([ID]) ON DELETE CASCADE
);

