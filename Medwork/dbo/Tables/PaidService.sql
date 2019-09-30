CREATE TABLE [dbo].[PaidService] (
    [ID]                    INT            NOT NULL,
    [Code]                  NVARCHAR (20)  NULL,
    [ServiceName]           NVARCHAR (600) NULL,
    [BasePrice]             MONEY          NULL,
    [MasterID]              INT            NULL,
    [NodeType]              NVARCHAR (12)  NULL,
    [UET]                   FLOAT (53)     NULL,
    [FormaOsmotra]          NVARCHAR (50)  NULL,
    [Resource]              INT            NULL,
    [ObjectID]              INT            NULL,
    [tablename]             NVARCHAR (50)  NULL,
    [UETSister]             FLOAT (53)     NULL,
    [Measure]               NVARCHAR (50)  NULL,
    [AutoRefresh]           BIT            NULL,
    [Price1]                MONEY          NULL,
    [Price2]                MONEY          NULL,
    [Price3]                MONEY          NULL,
    [Price4]                MONEY          NULL,
    [Price5]                MONEY          NULL,
    [Price6]                MONEY          NULL,
    [Price7]                MONEY          NULL,
    [Price8]                MONEY          NULL,
    [Price9]                MONEY          NULL,
    [needpay]               BIT            NULL,
    [Duration]              INT            NULL,
    [Komment]               NVARCHAR (200) NULL,
    [CanNotChangePrice]     BIT            NULL,
    [CanNotChangeSkidka]    BIT            NULL,
    [Kateg]                 INT            NULL,
    [feepercent]            FLOAT (53)     NULL,
    [Cost]                  MONEY          NULL,
    [Fee]                   MONEY          NULL,
    [BezTseni]              NVARCHAR (1)   NULL,
    [PaySister]             MONEY          NULL,
    [AppointmentFeePercent] FLOAT (53)     NULL,
    [AppointmentFee]        MONEY          NULL,
    [UseUsrFeePercent]      BIT            NULL,
    [KtoOkazyvaet]          INT            NULL,
    [CodeNomenklature]      NVARCHAR (200) NULL,
    [FR_Tax1Code]           INT            NULL,
    [GdeOkazyvaetsya]       INT            NULL,
    CONSTRAINT [PaidServicePrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [PaidServiceCode]
    ON [dbo].[PaidService]([Code] ASC);


GO

CREATE TRIGGER [dbo].[UpdateService_PaidService] 
ON [dbo].[PaidService] 
AFTER UPDATE
AS
set nocount on
	update SubService set Price=i.BasePrice, ServiceName=i.ServiceName
	from  inserted i
	where SubService.Code=i.Code and SubService.Reference=1
	update dbo.Service set Price=Price-
	(
		select sum(ps.BasePrice*ss.quant)
		from SubService ss, deleted ps
		where ss.Code=ps.Code and service.ID=ss.MasterID and ss.Reference=1
	)+
	(
		select sum(ps.BasePrice*ss.quant)
		from SubService ss, inserted ps
		where ss.Code=ps.Code and service.ID=ss.MasterID and ss.Reference=1
	)
	where AutoRefresh=1
