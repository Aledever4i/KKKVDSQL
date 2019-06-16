CREATE TABLE [dbo].[INVITRO_Test_Profile] (
    [ID]        INT          NULL,
    [MasterID]  INT          NULL,
    [test_code] VARCHAR (10) NULL,
    CONSTRAINT [FK_INVITRO_Test_Profile_MasterID] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[INVITRO_Tests] ([ID]) ON DELETE CASCADE
);

