CREATE TABLE [dbo].[StepenChistotiVlagalisha] (
    [ID]                     INT          NOT NULL,
    [PatID]                  INT          NULL,
    [NomerAnaliza]           INT          NULL,
    [DataProvedeniyaAnaliza] DATETIME     NULL,
    [Kokkovaya]              INT          NULL,
    [Batsillyarnaya]         INT          NULL,
    [Smeshannaya]            INT          NULL,
    [Leykotsiti]             INT          NULL,
    [TrObnaruzheni]          NVARCHAR (1) NULL,
    [GnObnaruzheni]          NVARCHAR (1) NULL,
    [PloskiyEpiteliy]        INT          NULL,
    [Vrach]                  INT          NULL,
    CONSTRAINT [StepenChistotiVlagalishaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [StepenChistotiVlagalishaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

