CREATE TABLE [dbo].[FormaVkk] (
    [ID]                           INT            NOT NULL,
    [PatID]                        INT            NULL,
    [DataProvedeniya]              DATETIME       NULL,
    [Diagnoz]                      NVARCHAR (150) NULL,
    [Zaklyuchenie]                 NTEXT          NULL,
    [Vrach]                        INT            NULL,
    [PatsientNapravlyaetsyaNaMsek] NVARCHAR (1)   NULL,
    [Kuda]                         NVARCHAR (50)  NULL,
    [ProitiDo]                     DATETIME       NULL,
    [ZaklyuchenieKomissii]         NVARCHAR (MAX) NULL,
    [Doctor]                       INT            NULL,
    CONSTRAINT [FormaVkkPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FormaVkkToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

