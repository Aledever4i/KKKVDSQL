CREATE TABLE [dbo].[KonsultatsiyaNevrologaPovtornaya] (
    [ID]                                                      INT           NOT NULL,
    [PatID]                                                   INT           NULL,
    [Memo1]                                                   NTEXT         NULL,
    [Memo2]                                                   NTEXT         NULL,
    [Combo1]                                                  NVARCHAR (50) NULL,
    [EditBox1]                                                NVARCHAR (50) NULL,
    [EditBox2]                                                NVARCHAR (50) NULL,
    [Memo3]                                                   NTEXT         NULL,
    [Memo4]                                                   NTEXT         NULL,
    [DopolneniyaKAnamnezu]                                    NTEXT         NULL,
    [DinamikaSubektivnogoSostoyaniya]                         NTEXT         NULL,
    [Sostoyanie]                                              NVARCHAR (50) NULL,
    [Ad]                                                      NVARCHAR (50) NULL,
    [PS]                                                      NVARCHAR (50) NULL,
    [DinamikaObektivnogoSostoyaniya]                          NTEXT         NULL,
    [RezultatiLaboratornoInstrumentalnihMetodovObsledovaniya] NTEXT         NULL,
    [Diagnoz]                                                 NTEXT         NULL,
    [Rekomendatsii]                                           NTEXT         NULL,
    [Data]                                                    DATETIME      NULL,
    CONSTRAINT [KonsultatsiyaNevrologaPovtornayaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [KonsultatsiyaNevrologaPovtornayaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

