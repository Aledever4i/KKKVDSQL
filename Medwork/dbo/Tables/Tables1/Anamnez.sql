CREATE TABLE [dbo].[Anamnez] (
    [ID]                            INT           NOT NULL,
    [PatID]                         INT           NULL,
    [Data]                          DATETIME      NULL,
    [Vrach]                         NVARCHAR (50) NULL,
    [ObshieZabolevaniya]            NTEXT         NULL,
    [ZdoroveMuzha]                  NTEXT         NULL,
    [MenstruatsiyaS]                INT           NULL,
    [NachaloPolovoyZhizniS]         NVARCHAR (50) NULL,
    [GinekologicheskieZabolevaniya] NTEXT         NULL,
    [SkolkoDeteyZhivih]             INT           NULL,
    [Mertvorozhdennih]              INT           NULL,
    [Umerlo]                        INT           NULL,
    CONSTRAINT [AnamnezPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [AnamnezToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

