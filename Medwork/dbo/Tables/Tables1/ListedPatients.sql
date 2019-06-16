CREATE TABLE [dbo].[ListedPatients] (
    [id]      INT            IDENTITY (1, 1) NOT NULL,
    [ListID]  INT            NULL,
    [PatID]   INT            NULL,
    [Checked] BIT            NOT NULL,
    [ToStr]   NVARCHAR (255) NULL,
    [FromStr] NVARCHAR (255) NULL,
    PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_ListedPatients_PatientLists] FOREIGN KEY ([ListID]) REFERENCES [dbo].[PatientLists] ([id]) ON DELETE CASCADE
);

