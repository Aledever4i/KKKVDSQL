CREATE TABLE [dbo].[BiohimicheskoeIssledovanieZhelchi] (
    [ID]                     INT        NOT NULL,
    [PatID]                  INT        NULL,
    [NomerAnaliza]           INT        NULL,
    [DataProvedeniyaAnaliza] DATETIME   NULL,
    [BilirubinA]             FLOAT (53) NULL,
    [HolesterinA]            FLOAT (53) NULL,
    [BilirubinB]             FLOAT (53) NULL,
    [HolesterinB]            FLOAT (53) NULL,
    [BilirubinC]             FLOAT (53) NULL,
    [HolesterinC]            FLOAT (53) NULL,
    [Vrach]                  INT        NULL,
    CONSTRAINT [BiohimicheskoeIssledovanieZhelchiPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [BiohimicheskoeIssledovanieZhelchiToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

