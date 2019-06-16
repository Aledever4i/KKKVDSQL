CREATE TABLE [dbo].[IfaNaOnkomarkeri] (
    [ID]                                  INT        NOT NULL,
    [PatID]                               INT        NULL,
    [NomerAnaliza]                        INT        NULL,
    [DataProvedeniyaAnaliza]              DATETIME   NULL,
    [SaharVKrovi]                         FLOAT (53) NULL,
    [MutsinopodobniyRakoviyAntigenMPA]    FLOAT (53) NULL,
    [AntigenUglevodniyRakoviyCa153]       FLOAT (53) NULL,
    [AntigenUglevodniyRakoviyCa155]       FLOAT (53) NULL,
    [AntigenRakoviyRakovoEmbrionalniyRea] FLOAT (53) NULL,
    [AntigenUglevodniyRakoviyCa199]       FLOAT (53) NULL,
    [AntigenProstatspetsificheskiyyPsa]   FLOAT (53) NULL,
    [NeyronSpetsificheskiyEnolazaHCE]     FLOAT (53) NULL,
    [AntigenUglevodniyRakoviyCa242]       FLOAT (53) NULL,
    [HronicheskiyGonadotropin]            FLOAT (53) NULL,
    [Vrach]                               INT        NULL,
    CONSTRAINT [IfaNaOnkomarkeriPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [IfaNaOnkomarkeriToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

