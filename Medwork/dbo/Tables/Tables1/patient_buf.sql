CREATE TABLE [dbo].[patient_buf] (
    [ID]     INT NOT NULL,
    [PatId]  INT NULL,
    [UserId] INT NULL,
    CONSTRAINT [patient_bufPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

