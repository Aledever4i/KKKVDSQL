CREATE TABLE [dbo].[Specialitie] (
    [ID]             INT            NOT NULL,
    [NameSpeciality] NVARCHAR (120) NULL,
    [Kod]            INT            NULL,
    [KodLine]        INT            NULL,
    CONSTRAINT [SpecialitiePrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

