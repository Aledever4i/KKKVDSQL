CREATE TABLE [dbo].[UziDays] (
    [id]        INT NOT NULL,
    [MasterID]  INT NULL,
    [DayNumber] INT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [UziDays_MasterID_ECFStim_FK] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[ECFStim] ([Id]) ON DELETE CASCADE
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UziDay_Day]
    ON [dbo].[UziDays]([MasterID] ASC, [DayNumber] ASC);

