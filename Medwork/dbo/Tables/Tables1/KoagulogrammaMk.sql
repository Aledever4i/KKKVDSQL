CREATE TABLE [dbo].[KoagulogrammaMk] (
    [ID]                              INT        NOT NULL,
    [PatID]                           INT        NULL,
    [mno]                             INT        NULL,
    [PTI]                             INT        NULL,
    [achtv]                           FLOAT (53) NULL,
    [PV]                              FLOAT (53) NULL,
    [AktivnostProtrombinovogoIndeksa] FLOAT (53) NULL,
    [fibrinogenPV]                    FLOAT (53) NULL,
    [TV]                              FLOAT (53) NULL,
    [fibrinogenB]                     FLOAT (53) NULL,
    [Vrach2]                          INT        NULL,
    [Data1]                           DATETIME   NULL,
    CONSTRAINT [KoagulogrammaMkToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

