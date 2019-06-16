CREATE TABLE [dbo].[MazokNaHlamidiiIGardnelli] (
    [ID]                     INT          NOT NULL,
    [PatID]                  INT          NULL,
    [NomerAnaliza]           INT          NULL,
    [DataProvedeniyaAnaliza] DATETIME     NULL,
    [HlamidiiObnaruzheni]    NVARCHAR (1) NULL,
    [GardnelliObnaruzheni]   NVARCHAR (1) NULL,
    [Vrach]                  INT          NULL,
    CONSTRAINT [MazokNaHlamidiiIGardnelliPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [MazokNaHlamidiiIGardnelliToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

