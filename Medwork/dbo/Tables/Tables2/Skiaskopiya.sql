CREATE TABLE [dbo].[Skiaskopiya] (
    [ID]    INT            NOT NULL,
    [PatID] INT            NULL,
    [HOD]   FLOAT (53)     NULL,
    [VOD]   FLOAT (53)     NULL,
    [HOS]   FLOAT (53)     NULL,
    [VOS]   FLOAT (53)     NULL,
    [Param] NVARCHAR (106) NULL,
    [Prim]  NTEXT          NULL,
    CONSTRAINT [SkiaskopiyaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [SkiaskopiyaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

