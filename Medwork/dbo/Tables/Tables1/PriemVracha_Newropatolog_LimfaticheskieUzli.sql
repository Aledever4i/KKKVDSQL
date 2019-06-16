CREATE TABLE [dbo].[PriemVracha_Newropatolog_LimfaticheskieUzli] (
    [ID]                    INT           NOT NULL,
    [PatID]                 INT           NULL,
    [ZadnieSheynie]         NVARCHAR (50) NULL,
    [PerednieSheynie]       NVARCHAR (50) NULL,
    [Okoloushnie]           NVARCHAR (50) NULL,
    [Podnizhnechelyustnie]  NVARCHAR (50) NULL,
    [Podborodochnie]        NVARCHAR (50) NULL,
    [Podborodochnie1]       NVARCHAR (50) NULL,
    [PerednieSheynie1]      NVARCHAR (50) NULL,
    [ZadnieSheynie1]        NVARCHAR (50) NULL,
    [Podnizhnechelyustnie1] NVARCHAR (50) NULL,
    [Okoloushnie1]          NVARCHAR (50) NULL,
    [Podborodochnie2]       NTEXT         NULL,
    [PerednieSheynie2]      NTEXT         NULL,
    [ZadnieSheynie2]        NTEXT         NULL,
    [Podnizhnechelyustnie2] NTEXT         NULL,
    [Okoloushnie2]          NTEXT         NULL,
    CONSTRAINT [PriemVracha_Newropatolog_LimfaticheskieUzliPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PriemVracha_Newropatolog_LimfaticheskieUzliToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

