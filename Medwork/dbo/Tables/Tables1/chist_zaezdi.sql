CREATE TABLE [dbo].[chist_zaezdi] (
    [ID]               INT          NOT NULL,
    [datazaezda]       DATETIME     NULL,
    [zaezdmax]         INT          NULL,
    [DostupnoTolkoNam] NVARCHAR (1) NULL,
    CONSTRAINT [chist_zaezdiPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [date]
    ON [dbo].[chist_zaezdi]([datazaezda] ASC);

