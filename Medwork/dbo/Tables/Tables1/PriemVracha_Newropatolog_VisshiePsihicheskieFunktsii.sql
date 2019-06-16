CREATE TABLE [dbo].[PriemVracha_Newropatolog_VisshiePsihicheskieFunktsii] (
    [ID]             INT   NOT NULL,
    [PatID]          INT   NULL,
    [totalnaja]      NTEXT NULL,
    [dynamic]        NTEXT NULL,
    [semantik]       NTEXT NULL,
    [akystiko]       NTEXT NULL,
    [kineticheskaja] NTEXT NULL,
    [kinestet]       NTEXT NULL,
    [optiko]         NTEXT NULL,
    [Vernike]        NTEXT NULL,
    [affer]          NTEXT NULL,
    [Broka]          NTEXT NULL,
    CONSTRAINT [PriemVracha_Newropatolog_VisshiePsihicheskieFunktsiiPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PriemVracha_Newropatolog_VisshiePsihicheskieFunktsiiToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

