CREATE TABLE [dbo].[Podarki] (
    [ID]          INT            NOT NULL,
    [PatID]       INT            NULL,
    [MasterID]    INT            NULL,
    [DatePodarka] DATETIME       NULL,
    [PodarokName] NVARCHAR (100) NULL,
    [SumPodarka]  MONEY          NULL,
    CONSTRAINT [PodarkiPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PodarkiToAnketaPoluchatelyaDiskontnoyKarti] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[AnketaPoluchatelyaDiskontnoyKarti] ([ID]) ON DELETE CASCADE
);

