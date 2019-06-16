CREATE TABLE [dbo].[seansdates] (
    [ID]       INT      NOT NULL,
    [MasterID] INT      NULL,
    [Seans]    DATETIME NULL,
    [Done]     BIT      NULL,
    CONSTRAINT [seansdatesPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [seansdatesToDoneProcedure] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[DoneProcedure] ([ID]) ON DELETE CASCADE
);

