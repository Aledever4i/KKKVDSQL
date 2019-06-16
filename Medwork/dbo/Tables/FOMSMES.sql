CREATE TABLE [dbo].[FOMSMES] (
    [RecId]              INT           IDENTITY (1, 1) NOT NULL,
    [CD_PRUB]            VARCHAR (6)   NULL,
    [CD_USL]             VARCHAR (14)  NULL,
    [NAME]               VARCHAR (500) NULL,
    [STEPT]              VARCHAR (40)  NULL,
    [LEVUSL]             VARCHAR (40)  NULL,
    [PRIZNAK]            VARCHAR (20)  NULL,
    [NUMDAYS]            FLOAT (53)    NULL,
    [LECHPLAC]           VARCHAR (40)  NULL,
    [IsActivePolyclinic] BIT           CONSTRAINT [DF_FOMSMES_IsActivePolyclinic] DEFAULT ((0)) NOT NULL,
    [IsActiveHospital]   BIT           CONSTRAINT [DF_FOMSMES_IsActive] DEFAULT ((0)) NOT NULL,
    [InsertStamp]        DATETIME      CONSTRAINT [DF_FOMSMES_InsertStamp] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_FOMSMES] PRIMARY KEY CLUSTERED ([RecId] ASC)
);

