CREATE TABLE [dbo].[InsuranceProgramBuffer] (
    [ID]                  INT            IDENTITY (1, 1) NOT NULL,
    [MasterID]            INT            NULL,
    [PROGRAM_ID]          INT            NULL,
    [IMPORT_PROGRAM_NAME] NVARCHAR (200) NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [InsuranceProgramBufferToorganisations] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[Organisations] ([ID]) ON DELETE CASCADE
);

