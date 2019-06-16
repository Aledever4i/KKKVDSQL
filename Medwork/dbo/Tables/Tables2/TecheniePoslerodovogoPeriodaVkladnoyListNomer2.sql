CREATE TABLE [dbo].[TecheniePoslerodovogoPeriodaVkladnoyListNomer2] (
    [ID]    INT NOT NULL,
    [PatID] INT NULL,
    CONSTRAINT [TecheniePoslerodovogoPeriodaVkladnoyListNomer2PrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [TecheniePoslerodovogoPeriodaVkladnoyListNomer2ToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

