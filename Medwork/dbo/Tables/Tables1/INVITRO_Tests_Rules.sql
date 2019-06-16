CREATE TABLE [dbo].[INVITRO_Tests_Rules] (
    [ID]        INT          NULL,
    [MasterID]  INT          NULL,
    [test_code] VARCHAR (10) NULL,
    [npu_code]  VARCHAR (12) NULL,
    [rule]      VARCHAR (20) NULL,
    CONSTRAINT [FK_INVITRO_Tests_Rules_MasterID] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[INVITRO_Tests] ([ID]) ON DELETE CASCADE
);

