CREATE TABLE [dbo].[LN_DrugoeVremya] (
    [ID]       INT      NOT NULL,
    [MasterID] INT      NULL,
    [Time]     DATETIME NULL,
    [Time_End] DATETIME NULL,
    CONSTRAINT [LN_DrugoeVremyaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [LN_DrugoeVremyaToLN_Naznacheniya] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[LN_Naznacheniya] ([ID]) ON DELETE CASCADE
);

