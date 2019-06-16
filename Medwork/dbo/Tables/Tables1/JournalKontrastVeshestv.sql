CREATE TABLE [dbo].[JournalKontrastVeshestv] (
    [ID]          INT        NOT NULL,
    [MasterID]    INT        NULL,
    [Дата]        DATETIME   NULL,
    [Oper]        INT        NULL,
    [BariaSulfat] FLOAT (53) NULL,
    [Barvips]     FLOAT (53) NULL,
    [Urografin]   FLOAT (53) NULL,
    [Omnipak]     FLOAT (53) NULL,
    [Ultravist]   FLOAT (53) NULL,
    [Another]     FLOAT (53) NULL,
    [Автор]       INT        NULL,
    CONSTRAINT [JournalKontrastVeshestvPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

