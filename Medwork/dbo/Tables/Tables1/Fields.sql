CREATE TABLE [dbo].[Fields] (
    [guid]                NVARCHAR (32)  NOT NULL,
    [FieldTypeGUID]       NVARCHAR (32)  NULL,
    [FieldSize]           INT            NULL,
    [Nullable]            BIT            CONSTRAINT [DF_Fields_Nullable] DEFAULT ((1)) NULL,
    [IsServiceField]      BIT            CONSTRAINT [DF_Fields_IsServiceField] DEFAULT ((0)) NULL,
    [CopyToChilds]        BIT            CONSTRAINT [DF_Fields_CopyToChilds] DEFAULT ((0)) NULL,
    [Postfix_or_Measure]  VARCHAR (50)   NULL,
    [Width]               INT            NULL,
    [DefaultValue]        VARCHAR (50)   NULL,
    [URL]                 VARCHAR (1024) NULL,
    [ControlDatatypeGUID] NVARCHAR (32)  NULL,
    [TrueValue]           VARCHAR (20)   NULL,
    [FalseValue]          VARCHAR (20)   NULL,
    PRIMARY KEY CLUSTERED ([guid] ASC),
    CONSTRAINT [FK_Fields_Form] FOREIGN KEY ([guid]) REFERENCES [dbo].[Form] ([GUID])
);

