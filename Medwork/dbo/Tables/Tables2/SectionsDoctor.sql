CREATE TABLE [dbo].[SectionsDoctor] (
    [ID]               INT NOT NULL,
    [MasterID]         INT NULL,
    [SectionsDoctorId] INT NULL,
    CONSTRAINT [SectionsDoctorPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [SectionsDoctorToSections] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[Sections] ([ID]) ON DELETE CASCADE
);

