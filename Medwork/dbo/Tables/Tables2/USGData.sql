CREATE TABLE [dbo].[USGData] (
    [Id]       INT           NOT NULL,
    [MasterId] INT           NOT NULL,
    [RFoll1]   FLOAT (53)    NULL,
    [RFoll2]   FLOAT (53)    NULL,
    [RFollD]   VARCHAR (255) NULL,
    [LFoll1]   FLOAT (53)    NULL,
    [LFoll2]   FLOAT (53)    NULL,
    [LFollD]   VARCHAR (255) NULL,
    CONSTRAINT [PK_USGData] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_USGData_USG] FOREIGN KEY ([MasterId]) REFERENCES [dbo].[USG] ([Id]) ON DELETE CASCADE
);

