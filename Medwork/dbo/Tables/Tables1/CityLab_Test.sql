CREATE TABLE [dbo].[CityLab_Test] (
    [id]                            INT            NULL,
    [resultType]                    INT            NULL,
    [duration]                      INT            NULL,
    [format]                        VARCHAR (20)   NULL,
    [unit]                          INT            NULL,
    [needPrint]                     BIT            NULL,
    [rank]                          INT            NULL,
    [autoApproval]                  INT            NULL,
    [hotKey]                        VARCHAR (20)   NULL,
    [exponential]                   BIT            NULL,
    [showAllNorms]                  INT            NULL,
    [workingDays]                   INT            NULL,
    [analyte]                       INT            NULL,
    [useDefaultNormComments]        BIT            NULL,
    [normsText]                     NVARCHAR (MAX) NULL,
    [viewPriority]                  INT            NULL,
    [initValueToDefaultOnManualAdd] BIT            NULL,
    [sortByRank]                    BIT            NULL,
    [oldStyleResultsAdd]            BIT            NULL,
    [antibiotic]                    INT            NULL,
    [engName]                       VARCHAR (500)  NULL,
    [name]                          NVARCHAR (MAX) NULL,
    [description]                   NVARCHAR (MAX) NULL,
    [code]                          VARCHAR (50)   NULL,
    [mnemonics]                     VARCHAR (100)  NULL,
    [removed]                       BIT            NULL,
    [pid]                           INT            NULL
);


GO
CREATE NONCLUSTERED INDEX [CityLab_Test_pidIdx]
    ON [dbo].[CityLab_Test]([pid] ASC);

