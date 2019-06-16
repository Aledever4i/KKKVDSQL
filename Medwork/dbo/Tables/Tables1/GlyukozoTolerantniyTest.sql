CREATE TABLE [dbo].[GlyukozoTolerantniyTest] (
    [ID]                     INT        NOT NULL,
    [PatID]                  INT        NULL,
    [NomerAnaliza]           INT        NULL,
    [DataProvedeniyaAnaliza] DATETIME   NULL,
    [I]                      FLOAT (53) NULL,
    [II]                     FLOAT (53) NULL,
    [III]                    FLOAT (53) NULL,
    [Vrach]                  INT        NULL,
    CONSTRAINT [GlyukozoTolerantniyTestPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [GlyukozoTolerantniyTestToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

