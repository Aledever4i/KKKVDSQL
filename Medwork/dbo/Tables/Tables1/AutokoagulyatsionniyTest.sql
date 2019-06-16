CREATE TABLE [dbo].[AutokoagulyatsionniyTest] (
    [ID]                     INT        NOT NULL,
    [PatID]                  INT        NULL,
    [NomerAnaliza]           INT        NULL,
    [DataProvedeniyaAnaliza] DATETIME   NULL,
    [A]                      FLOAT (53) NULL,
    [Iit]                    FLOAT (53) NULL,
    [T1]                     INT        NULL,
    [Ma]                     FLOAT (53) NULL,
    [T2]                     INT        NULL,
    [Vrach]                  INT        NULL,
    CONSTRAINT [AutokoagulyatsionniyTestPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [AutokoagulyatsionniyTestToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

