CREATE TABLE [dbo].[BillActs] (
    [ID]       INT NOT NULL,
    [MasterID] INT NULL,
    [Act]      INT NULL,
    CONSTRAINT [BillActsPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [BillActsToUDP_Bill] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[UDP_Bill] ([ID]) ON DELETE CASCADE
);

