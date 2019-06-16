﻿CREATE TABLE [dbo].[EhoEntsefalografiya] (
    [ID]                                       INT          NOT NULL,
    [PatID]                                    INT          NULL,
    [NomerIssledovaniya]                       INT          NULL,
    [DataProvedeniya]                          DATETIME     NULL,
    [TMSMm]                                    FLOAT (53)   NULL,
    [TMDMm]                                    FLOAT (53)   NULL,
    [DBTMm]                                    FLOAT (53)   NULL,
    [SKKMm]                                    FLOAT (53)   NULL,
    [Jeludochek]                               FLOAT (53)   NULL,
    [Ep]                                       INT          NULL,
    [EstUsilenieLateralnihEhoSignalovSprava]   NVARCHAR (1) NULL,
    [EstUsilenieLateralnihEhoSignalovSleva]    NVARCHAR (1) NULL,
    [SmeshenieSredinnihStrukturGolovnogoMozga] INT          NULL,
    [Na]                                       FLOAT (53)   NULL,
    [UzPriznakovVnutricherepnoyGipertenziiNet] NVARCHAR (1) NULL,
    [StepenGipertenzii]                        INT          NULL,
    [UzPriznakiMezhpolusharnoyAsimmetrii]      NVARCHAR (1) NULL,
    [Kommentarii]                              NTEXT        NULL,
    [Vrach]                                    INT          NULL,
    [Zaklyuchenie]                             NTEXT        NULL,
    CONSTRAINT [EhoEntsefalografiyaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [EhoEntsefalografiyaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);
