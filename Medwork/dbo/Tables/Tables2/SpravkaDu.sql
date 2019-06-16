CREATE TABLE [dbo].[SpravkaDu] (
    [ID]         INT            NOT NULL,
    [PatID]      INT            NULL,
    [KudaSpravk] NVARCHAR (100) NULL,
    [Vrach]      NVARCHAR (200) NULL,
    [NoberS]     INT            NULL,
    [NaUchete]   BIT            NULL,
    CONSTRAINT [SpravkaDuPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [SpravkaDuToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

