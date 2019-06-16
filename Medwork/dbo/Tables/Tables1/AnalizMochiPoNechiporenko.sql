CREATE TABLE [dbo].[AnalizMochiPoNechiporenko] (
    [PatID]                  INT        NULL,
    [ID]                     INT        NOT NULL,
    [NomerAnaliza]           INT        NULL,
    [DataProvedeniyaAnaliza] DATETIME   NULL,
    [LeykotsitiEdit]         FLOAT (53) NULL,
    [Leykotsiti]             INT        NULL,
    [EritrotsitiEdit]        FLOAT (53) NULL,
    [Eritrotsiti]            INT        NULL,
    [TsilindriEdit]          FLOAT (53) NULL,
    [Tsilindri]              INT        NULL,
    [Vrach]                  INT        NULL,
    CONSTRAINT [AnalizMochiPoNechiporenkoPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [AnalizMochiPoNechiporenkoToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

