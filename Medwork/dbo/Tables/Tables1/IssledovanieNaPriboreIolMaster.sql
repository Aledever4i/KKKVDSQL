CREATE TABLE [dbo].[IssledovanieNaPriboreIolMaster] (
    [ID]                    INT        NOT NULL,
    [PatID]                 INT        NULL,
    [RefrakciyRogoviciOD]   INT        NULL,
    [RefrakciyRogoviciOD2]  FLOAT (53) NULL,
    [GlubinaPKOD]           FLOAT (53) NULL,
    [TolshinaXrustalicaOD]  FLOAT (53) NULL,
    [DlinaGlazaOD]          FLOAT (53) NULL,
    [RefrakciyRogoviciOD3]  INT        NULL,
    [RefrakciyRogoviciOD4]  FLOAT (53) NULL,
    [RefrakciyRogoviciOS1]  INT        NULL,
    [RefrakciyRogoviciOS3]  INT        NULL,
    [RefrakciyRogoviciOS2]  FLOAT (53) NULL,
    [RefrakciyRogoviciOS4]  FLOAT (53) NULL,
    [GlubinaPKOD1]          FLOAT (53) NULL,
    [TolshinaXrustalicaOD1] FLOAT (53) NULL,
    [DlinaGlazaOD1]         FLOAT (53) NULL,
    [Prim]                  NTEXT      NULL,
    CONSTRAINT [IssledovanieNaPriboreIolMasterPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [IssledovanieNaPriboreIolMasterToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

