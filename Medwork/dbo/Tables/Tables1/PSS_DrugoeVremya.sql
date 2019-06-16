CREATE TABLE [dbo].[PSS_DrugoeVremya] (
    [ID]       INT      NOT NULL,
    [MasterID] INT      NULL,
    [Time]     DATETIME NULL,
    [Time_End] DATETIME NULL,
    CONSTRAINT [PSS_DrugoeVremyaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PSS_DrugoeVremyaToPaidSubService] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[PaidSubService] ([ID]) ON DELETE CASCADE
);

