CREATE TABLE [dbo].[InsuranceProgram] (
    [ID]                    INT            NOT NULL,
    [Code]                  INT            NULL,
    [ProgramName]           NVARCHAR (150) NULL,
    [VseUslugi]             NVARCHAR (1)   NULL,
    [Skidka]                FLOAT (53)     NULL,
    [Round]                 INT            NULL,
    [ProgramDescription]    IMAGE          NULL,
    [PriceType]             INT            NULL,
    [Price]                 MONEY          NULL,
    [CheckSumValue]         NVARCHAR (1)   NULL,
    [CheckSumNumber]        NVARCHAR (1)   NULL,
    [OrgID]                 INT            NULL,
    [BonusPercent]          FLOAT (53)     NULL,
    [ArchiveProgram]        BIT            NULL,
    [ImportedFromExcelFile] NVARCHAR (255) NULL,
    CONSTRAINT [InsuranceProgramPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

