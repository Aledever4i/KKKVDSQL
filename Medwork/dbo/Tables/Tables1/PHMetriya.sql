CREATE TABLE [dbo].[PHMetriya] (
    [ID]                       INT        NOT NULL,
    [PatID]                    INT        NULL,
    [NomerAnaliza]             INT        NULL,
    [DataProvedeniyaAnaliza]   DATETIME   NULL,
    [PHVPredelahOt]            FLOAT (53) NULL,
    [PHdo]                     FLOAT (53) NULL,
    [Stimulyatsiya]            NTEXT      NULL,
    [PHPosleStimulirovaniyaOt] FLOAT (53) NULL,
    [PHPosleStimulirovaniyaDo] FLOAT (53) NULL,
    [Vrach]                    INT        NULL,
    CONSTRAINT [PHMetriyaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PHMetriyaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

