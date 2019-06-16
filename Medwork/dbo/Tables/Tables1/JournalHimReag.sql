CREATE TABLE [dbo].[JournalHimReag] (
    [ID]           INT        NOT NULL,
    [MasterID]     INT        NULL,
    [Oper]         INT        NULL,
    [Дата]         DATETIME   NULL,
    [Projavitel_A] FLOAT (53) NULL,
    [Fiksag_A]     FLOAT (53) NULL,
    [Projavitel]   FLOAT (53) NULL,
    [Fiksag]       FLOAT (53) NULL,
    [Автор]        INT        NULL,
    [Vosstanvitel] FLOAT (53) NULL,
    CONSTRAINT [JournalHimReagPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

