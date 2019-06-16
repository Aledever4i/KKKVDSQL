CREATE TABLE [dbo].[ProgramQuotas] (
    [ID]          INT           NOT NULL,
    [MasterID]    INT           NULL,
    [ServiceName] NVARCHAR (50) NULL,
    [Kvota]       NVARCHAR (50) NULL,
    [Price]       FLOAT (53)    NULL,
    [ServiceCode] NVARCHAR (50) NULL,
    CONSTRAINT [ProgramQuotasPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [ProgramQuotasToProgram] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[Program] ([ID]) ON DELETE CASCADE
);

