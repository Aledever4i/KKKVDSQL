CREATE TABLE [dbo].[AnalizSekretaPredstatelnoyZhelezi] (
    [ID]                           INT          NOT NULL,
    [PatID]                        INT          NULL,
    [NomerAnaliza]                 INT          NULL,
    [DataProvedeniyaAnaliza]       DATETIME     NULL,
    [Leykotsiti]                   INT          NULL,
    [Eritrotsiti]                  INT          NULL,
    [PloskiyEpiteliy]              INT          NULL,
    [LetsetinovieZerna]            INT          NULL,
    [Zn]                           NVARCHAR (1) NULL,
    [Tr]                           NVARCHAR (1) NULL,
    [DrozhzhevieGribkiObnaruzheni] INT          NULL,
    [Eozinofili]                   INT          NULL,
    [Vrach]                        INT          NULL,
    CONSTRAINT [AnalizSekretaPredstatelnoyZheleziPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [AnalizSekretaPredstatelnoyZheleziToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

