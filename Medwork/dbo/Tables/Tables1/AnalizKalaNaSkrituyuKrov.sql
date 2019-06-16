CREATE TABLE [dbo].[AnalizKalaNaSkrituyuKrov] (
    [ID]                                INT          NOT NULL,
    [PatID]                             INT          NULL,
    [NomerAnaliza]                      INT          NULL,
    [DataProvedeniyaAnaliza]            DATETIME     NULL,
    [ReaktsiyaGregersenaPolozhitelnaya] NVARCHAR (1) NULL,
    [Vrach]                             INT          NULL,
    CONSTRAINT [AnalizKalaNaSkrituyuKrovPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [AnalizKalaNaSkrituyuKrovToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

