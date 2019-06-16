CREATE TABLE [dbo].[AppQueue] (
    [ID]            INT            NOT NULL,
    [PatID]         INT            NULL,
    [CardNum]       NVARCHAR (50)  NULL,
    [SecondName]    NVARCHAR (50)  NULL,
    [FirstName]     NVARCHAR (50)  NULL,
    [LastName]      NVARCHAR (50)  NULL,
    [Contacts]      NVARCHAR (255) NULL,
    [Resource]      INT            NULL,
    [QueueLastDate] DATETIME       NULL,
    [Author]        INT            NULL,
    [CreateDate]    DATETIME       NULL,
    [AppCreated]    BIT            NULL,
    [Cause]         NVARCHAR (50)  NULL,
    CONSTRAINT [AppQueuePrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

