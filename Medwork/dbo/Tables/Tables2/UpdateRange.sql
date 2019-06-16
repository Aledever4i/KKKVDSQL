CREATE TABLE [dbo].[UpdateRange] (
    [RangeStart] INT NOT NULL,
    [RangeEnd]   INT NULL,
    [Result]     INT NULL,
    CONSTRAINT [PK_UpdateRange] PRIMARY KEY CLUSTERED ([RangeStart] ASC)
);

