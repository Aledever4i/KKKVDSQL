CREATE TABLE [dbo].[KatLgot] (
    [MasterID] INT      NOT NULL,
    [FedLgota] BIT      NULL,
    [Status]   CHAR (1) NULL,
    PRIMARY KEY NONCLUSTERED ([MasterID] ASC),
    CONSTRAINT [FK_KatLgot_Kategoriya] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[Kategoriya] ([ID]) ON DELETE CASCADE
);

