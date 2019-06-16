CREATE TABLE [dbo].[VipiskaIzProtokolaKek] (
    [ID]                   INT            NOT NULL,
    [PatID]                INT            NULL,
    [DataOsmotra]          DATETIME       NULL,
    [ZaklyuchenieKomissii] NTEXT          NULL,
    [PredsedatelKek]       NVARCHAR (50)  NULL,
    [vibor]                NVARCHAR (50)  NULL,
    [Chleni]               NTEXT          NULL,
    [Ds]                   NVARCHAR (100) NULL,
    CONSTRAINT [VipiskaIzProtokolaKekPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [VipiskaIzProtokolaKekToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

