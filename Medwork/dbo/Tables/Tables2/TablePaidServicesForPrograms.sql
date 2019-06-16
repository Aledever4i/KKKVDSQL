CREATE TABLE [dbo].[TablePaidServicesForPrograms] (
    [ID]          INT            NOT NULL,
    [Code]        NVARCHAR (20)  NULL,
    [ServiceName] NVARCHAR (255) NULL,
    [BasePrice]   FLOAT (53)     NULL,
    [Price]       FLOAT (53)     NULL,
    [MasterID]    INT            NULL,
    [NodeType]    NVARCHAR (12)  NULL,
    [MaxCount]    INT            NULL,
    [ProgramId]   INT            NOT NULL,
    [Komment]     NVARCHAR (200) NULL,
    [Duration]    INT            NULL,
    [TotalCount]  INT            NULL,
    [feepercent]  FLOAT (53)     NULL,
    [Fee]         MONEY          NULL,
    CONSTRAINT [TablePaidServicesForProgramsPrimKey] PRIMARY KEY CLUSTERED ([ProgramId] ASC, [ID] ASC),
    CONSTRAINT [TablePaidServicesForProgramsToInsuranceProgram] FOREIGN KEY ([ProgramId]) REFERENCES [dbo].[InsuranceProgram] ([ID]) ON DELETE CASCADE
);

