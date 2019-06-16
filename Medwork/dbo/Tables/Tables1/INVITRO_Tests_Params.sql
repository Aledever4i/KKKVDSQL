CREATE TABLE [dbo].[INVITRO_Tests_Params] (
    [ID]         INT           NULL,
    [MasterID]   INT           NULL,
    [param_name] NVARCHAR (50) NULL,
    [req]        VARCHAR (10)  NULL,
    CONSTRAINT [FK_INVITRO_Tests_Params_MasterID] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[INVITRO_Tests] ([ID]) ON DELETE CASCADE
);

