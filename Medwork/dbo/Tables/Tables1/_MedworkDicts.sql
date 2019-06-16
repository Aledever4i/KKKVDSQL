CREATE TABLE [dbo].[_MedworkDicts] (
    [ID]        INT            NOT NULL,
    [FormGUID]  NVARCHAR (32)  NOT NULL,
    [FieldName] NVARCHAR (255) NOT NULL,
    [UsrID]     INT            NULL,
    [Override]  BIT            NOT NULL,
    [Author]    INT            NOT NULL,
    [Data]      NTEXT          NULL,
    CONSTRAINT [PKMedworkDictsID] PRIMARY KEY CLUSTERED ([ID] ASC)
);

