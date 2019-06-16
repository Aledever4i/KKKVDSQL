CREATE TABLE [dbo].[INVITRO_Tests] (
    [ID]             INT            NOT NULL,
    [npu_code]       NVARCHAR (12)  NULL,
    [test_code]      NVARCHAR (10)  NULL,
    [test_name]      NVARCHAR (256) NULL,
    [container_code] VARCHAR (10)   NULL,
    [ref]            VARCHAR (50)   NULL,
    [container_ref]  VARCHAR (50)   NULL,
    [is_profile]     BIT            NULL,
    [comment]        NVARCHAR (256) NULL,
    [test_name_lab]  NVARCHAR (256) NULL,
    [dop_blank]      NVARCHAR (50)  NULL,
    [section]        VARCHAR (10)   NULL,
    [cito]           BIT            NULL,
    [credit]         BIT            NULL,
    [sex]            VARCHAR (10)   NULL,
    [remind]         NVARCHAR (256) NULL,
    [fri_sat]        BIT            NULL,
    [html]           VARCHAR (100)  NULL,
    [nap_blank]      NVARCHAR (50)  NULL,
    CONSTRAINT [INVITRO_TestsPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

