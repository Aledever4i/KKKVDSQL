CREATE TABLE [dbo].[shifts] (
    [ID]             INT            NOT NULL,
    [StartDate]      DATETIME       NULL,
    [FinishDate]     DATETIME       NULL,
    [State]          NVARCHAR (50)  NULL,
    [ShiftType]      NVARCHAR (50)  NULL,
    [Comment]        NTEXT          NULL,
    [Orgs]           NVARCHAR (255) NULL,
    [OFF]            INT            NULL,
    [AttProgram]     INT            NULL,
    [AttProgramName] NVARCHAR (70)  NULL,
    CONSTRAINT [PK_shifts] PRIMARY KEY CLUSTERED ([ID] ASC)
);

