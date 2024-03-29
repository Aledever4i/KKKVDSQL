﻿CREATE TABLE [dbo].[OsmotrTerapevtaStatsionaraPervichniy] (
    [ID]                                                      INT           NOT NULL,
    [PatID]                                                   INT           NULL,
    [Vrach]                                                   INT           NULL,
    [Data]                                                    DATETIME      NULL,
    [EditBox9]                                                NVARCHAR (50) NULL,
    [EditBox8]                                                NVARCHAR (50) NULL,
    [EditBox7]                                                NVARCHAR (50) NULL,
    [EditBox6]                                                NVARCHAR (50) NULL,
    [EditBox5]                                                NVARCHAR (50) NULL,
    [EditBox4]                                                NVARCHAR (50) NULL,
    [EditBox3]                                                NVARCHAR (50) NULL,
    [Memo4]                                                   NTEXT         NULL,
    [EditBox2]                                                NVARCHAR (50) NULL,
    [EditBox1]                                                NVARCHAR (50) NULL,
    [Memo3]                                                   NTEXT         NULL,
    [Memo2]                                                   NTEXT         NULL,
    [Memo1]                                                   NTEXT         NULL,
    [EditBox10]                                               INT           NULL,
    [EditBox11]                                               INT           NULL,
    [EditBox12]                                               NVARCHAR (50) NULL,
    [EditBox13]                                               NVARCHAR (50) NULL,
    [EditBox14]                                               NVARCHAR (50) NULL,
    [EditBox15]                                               NVARCHAR (50) NULL,
    [EditBox16]                                               NVARCHAR (50) NULL,
    [EditBox17]                                               NVARCHAR (50) NULL,
    [Combo1]                                                  NVARCHAR (50) NULL,
    [Combo2]                                                  NVARCHAR (50) NULL,
    [Combo3]                                                  NVARCHAR (50) NULL,
    [Combo4]                                                  NVARCHAR (50) NULL,
    [EditBox18]                                               NVARCHAR (50) NULL,
    [Combo5]                                                  NVARCHAR (50) NULL,
    [Combo6]                                                  NVARCHAR (50) NULL,
    [DictCombo1]                                              NVARCHAR (50) NULL,
    [EditBox19]                                               NVARCHAR (50) NULL,
    [Combo7]                                                  NVARCHAR (50) NULL,
    [Combo8]                                                  NVARCHAR (50) NULL,
    [EditBox20]                                               NVARCHAR (50) NULL,
    [ZevChistiy]                                              NVARCHAR (1)  NULL,
    [DictCombo2]                                              NVARCHAR (50) NULL,
    [EditBox21]                                               NVARCHAR (50) NULL,
    [Combo9]                                                  NVARCHAR (50) NULL,
    [Memo5]                                                   NTEXT         NULL,
    [Combo10]                                                 NVARCHAR (50) NULL,
    [Combo11]                                                 NVARCHAR (50) NULL,
    [EditBox22]                                               NVARCHAR (50) NULL,
    [Combo12]                                                 NVARCHAR (50) NULL,
    [Combo13]                                                 NVARCHAR (50) NULL,
    [EditBox23]                                               NVARCHAR (50) NULL,
    [Combo14]                                                 NVARCHAR (50) NULL,
    [EditBox24]                                               NVARCHAR (50) NULL,
    [Combo15]                                                 NVARCHAR (50) NULL,
    [EditBox25]                                               NVARCHAR (50) NULL,
    [Combo16]                                                 NVARCHAR (50) NULL,
    [EditBox26]                                               NVARCHAR (50) NULL,
    [Combo17]                                                 NVARCHAR (50) NULL,
    [EditBox27]                                               NVARCHAR (50) NULL,
    [Combo18]                                                 NVARCHAR (50) NULL,
    [EditBox28]                                               NVARCHAR (50) NULL,
    [EditBox29]                                               NVARCHAR (50) NULL,
    [EditBox30]                                               NVARCHAR (50) NULL,
    [EditBox31]                                               NVARCHAR (50) NULL,
    [DictCombo3]                                              NVARCHAR (50) NULL,
    [EditBox32]                                               NVARCHAR (50) NULL,
    [Combo19]                                                 NVARCHAR (50) NULL,
    [EditBox33]                                               NVARCHAR (50) NULL,
    [Combo20]                                                 NVARCHAR (50) NULL,
    [Combo21]                                                 NVARCHAR (50) NULL,
    [Combo22]                                                 NVARCHAR (50) NULL,
    [Combo23]                                                 NVARCHAR (50) NULL,
    [Combo24]                                                 NVARCHAR (50) NULL,
    [Combo25]                                                 NVARCHAR (50) NULL,
    [Combo26]                                                 NVARCHAR (50) NULL,
    [EditBox34]                                               NVARCHAR (50) NULL,
    [DictCombo4]                                              NVARCHAR (50) NULL,
    [Combo27]                                                 NVARCHAR (50) NULL,
    [EditBox35]                                               NVARCHAR (50) NULL,
    [Combo28]                                                 NVARCHAR (50) NULL,
    [Combo29]                                                 NVARCHAR (50) NULL,
    [Combo30]                                                 NVARCHAR (50) NULL,
    [EditBox36]                                               NVARCHAR (50) NULL,
    [EditBox37]                                               NVARCHAR (50) NULL,
    [EditBox38]                                               NVARCHAR (50) NULL,
    [EditBox39]                                               NVARCHAR (50) NULL,
    [Combo31]                                                 NVARCHAR (50) NULL,
    [EditBox40]                                               NVARCHAR (50) NULL,
    [Memo6]                                                   NTEXT         NULL,
    [Memo8]                                                   NTEXT         NULL,
    [Memo9]                                                   NTEXT         NULL,
    [Vrach1]                                                  INT           NULL,
    [SDiagnozomPlanomObsledovaniyaILecheniyaSoglasnaSoglasen] NVARCHAR (1)  NULL,
    CONSTRAINT [OsmotrTerapevtaStatsionaraPervichniyPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [OsmotrTerapevtaStatsionaraPervichniyToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

