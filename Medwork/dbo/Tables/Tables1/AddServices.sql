CREATE TABLE [dbo].[AddServices] (
    [ID]           INT           NOT NULL,
    [MasterID]     INT           NULL,
    [Price]        MONEY         NULL,
    [DefaultPrice] NVARCHAR (1)  NULL,
    [ServiceId]    NVARCHAR (50) NULL,
    [MaxCount]     INT           NULL,
    [Comment]      NVARCHAR (50) NULL,
    [TotalCount]   INT           NULL,
    [feepercent]   FLOAT (53)    NULL,
    [Fee]          MONEY         NULL,
    CONSTRAINT [AddServicesPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [AddServicesToInsuranceProgram] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[InsuranceProgram] ([ID]) ON DELETE CASCADE
);

