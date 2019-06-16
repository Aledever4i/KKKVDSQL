CREATE TABLE [dbo].[FOMSDoctorProfessions] (
    [RecId] INT            IDENTITY (1, 1) NOT NULL,
    [K_SP]  INT            NOT NULL,
    [I_SP]  VARCHAR (1000) NOT NULL,
    CONSTRAINT [PK_FOMSDoctors] PRIMARY KEY CLUSTERED ([RecId] ASC)
);

