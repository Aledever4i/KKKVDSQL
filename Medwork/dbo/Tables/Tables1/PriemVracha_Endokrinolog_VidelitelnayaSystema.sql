CREATE TABLE [dbo].[PriemVracha_Endokrinolog_VidelitelnayaSystema] (
    [ID]                   INT           NOT NULL,
    [PatID]                INT           NULL,
    [simptompasternackogo] NVARCHAR (50) NULL,
    [Pochki]               NVARCHAR (50) NULL,
    [boleznennoe]          NVARCHAR (50) NULL,
    [Dizuricheskie]        NVARCHAR (50) NULL,
    [Pripuhlosti]          NVARCHAR (50) NULL,
    [Zatrudnennoe]         NVARCHAR (50) NULL,
    [OtekiMemo]            NTEXT         NULL,
    CONSTRAINT [PriemVracha_Endokrinolog_VidelitelnayaSystemaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PriemVracha_Endokrinolog_VidelitelnayaSystemaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

