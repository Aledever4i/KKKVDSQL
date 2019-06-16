CREATE TABLE [dbo].[IssledovanieMazkaIzUretriSheykiMatkiVlagalisha] (
    [ID]                           INT          NOT NULL,
    [PatID]                        INT          NULL,
    [NomerAnaliza]                 INT          NULL,
    [DataProvedeniyaAnaliza]       DATETIME     NULL,
    [Epiteliy]                     INT          NULL,
    [Leykotsiti]                   INT          NULL,
    [Flora]                        INT          NULL,
    [FrichVagObnaruzheni]          NVARCHAR (1) NULL,
    [HlamidiiObnaruzheni]          NVARCHAR (1) NULL,
    [DrozhzhevieGribkiObnaruzheni] NVARCHAR (1) NULL,
    [NitiMitseliyaObnaruzheni]     NVARCHAR (1) NULL,
    [Vrach]                        INT          NULL,
    CONSTRAINT [IssledovanieMazkaIzUretriSheykiMatkiVlagalishaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [IssledovanieMazkaIzUretriSheykiMatkiVlagalishaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

