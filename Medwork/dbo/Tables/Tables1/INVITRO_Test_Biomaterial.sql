CREATE TABLE [dbo].[INVITRO_Test_Biomaterial] (
    [ID]       INT            NULL,
    [MasterID] INT            NULL,
    [biomat]   NVARCHAR (100) NULL,
    CONSTRAINT [FK_INVITRO_Test_Biomaterial_MasterID] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[INVITRO_Tests] ([ID]) ON DELETE CASCADE
);

