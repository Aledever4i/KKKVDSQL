CREATE TABLE [dbo].[PerianalniySoskob] (
    [ID]                     INT          NOT NULL,
    [PatID]                  INT          NULL,
    [NomerAnaliza]           INT          NULL,
    [DataProvedeniyaAnaliza] DATETIME     NULL,
    [YaytsaOstrits]          NVARCHAR (1) NULL,
    [Vrach]                  INT          NULL,
    CONSTRAINT [PerianalniySoskobPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PerianalniySoskobToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

