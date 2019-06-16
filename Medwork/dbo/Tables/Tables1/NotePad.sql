CREATE TABLE [dbo].[NotePad] (
    [ID]        INT      NOT NULL,
    [MasterID]  INT      NULL,
    [Note]      NTEXT    NULL,
    [AuthorID]  INT      NULL,
    [Time]      DATETIME NULL,
    [Vipolneno] BIT      NULL,
    [Дата]      DATETIME NULL,
    CONSTRAINT [NotePadPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

