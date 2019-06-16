CREATE TABLE [dbo].[DeleteServices] (
    [ID]        INT           NOT NULL,
    [MasterID]  INT           NULL,
    [ServiceId] NVARCHAR (50) NULL,
    CONSTRAINT [DeleteServicesPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [DeleteServicesToInsuranceProgram] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[InsuranceProgram] ([ID]) ON DELETE CASCADE
);

