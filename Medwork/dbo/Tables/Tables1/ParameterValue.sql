CREATE TABLE [dbo].[ParameterValue] (
    [ID]        INT            NOT NULL,
    [MasterID]  INT            NULL,
    [ParamDate] DATETIME       NULL,
    [ParamTime] DATETIME       NULL,
    [UsrID]     INT            NULL,
    [Name]      NVARCHAR (250) NULL,
    [Value]     NVARCHAR (512) NULL,
    [Notes]     NTEXT          NULL,
    CONSTRAINT [ParameterValuePrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [ParameterValueToParameterValueForm] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[ParameterValueForm] ([ID]) ON DELETE CASCADE
);

