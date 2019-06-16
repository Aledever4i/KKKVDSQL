CREATE TABLE [dbo].[EtapiObrasheniyaBolnogo] (
    [ID]                        INT            NOT NULL,
    [PatID]                     INT            NULL,
    [MasterID]                  INT            NULL,
    [DataObrasheniya]           DATETIME       NULL,
    [NaimenovanieUchrezhdeniya] NVARCHAR (100) NULL,
    [MetodiIssledovaniya]       NVARCHAR (50)  NULL,
    [PostavlenniyDiagnoz]       NVARCHAR (100) NULL,
    [ProvedennoeLechenie]       NTEXT          NULL,
    [DSName]                    NVARCHAR (50)  NULL,
    CONSTRAINT [EtapiObrasheniyaBolnogoPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [EtapiObrasheniyaBolnogoToForma0272] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[Forma0272] ([ID]) ON DELETE CASCADE
);

