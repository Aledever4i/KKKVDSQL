CREATE TABLE [dbo].[Bill] (
    [ID]                           INT           NOT NULL,
    [PatID]                        INT           NULL,
    [NomerScheta]                  NVARCHAR (20) NULL,
    [DataScheta]                   DATETIME      NULL,
    [KomuVipisan]                  VARCHAR (50)  NULL,
    [KategoriyaLgotnika]           INT           NULL,
    [SkidkaV]                      FLOAT (53)    NULL,
    [SummaSUchetomSkidki]          FLOAT (53)    NULL,
    [Skidka]                       NVARCHAR (1)  NULL,
    [Itogo]                        MONEY         NULL,
    [ItogoKOplate]                 MONEY         NULL,
    [SchetZakrit]                  NVARCHAR (1)  NULL,
    [SchetVipisal]                 INT           NULL,
    [NalogSProdazh5]               NVARCHAR (1)  NULL,
    [VipisatPrihodnoKassoviyOrder] NVARCHAR (1)  NULL,
    [Insurance]                    INT           NULL,
    [Creditor]                     INT           NULL,
    [ActPresent]                   BIT           NULL,
    [ActDate]                      DATETIME      NULL,
    [ActNum]                       NVARCHAR (20) NULL,
    [Program]                      INT           NULL,
    [Done]                         INT           NULL,
    [PaymentType]                  INT           NULL,
    [PaymentCode]                  INT           NULL,
    [NomerNapravleniya]            INT           NULL,
    [Void]                         NVARCHAR (1)  NULL,
    [Agent]                        INT           NULL,
    [contract]                     IMAGE         NULL,
    [PriceType]                    INT           NULL,
    [AttProgram]                   INT           NULL,
    [Draft]                        BIT           NULL,
    [Tax1Name]                     NVARCHAR (40) NULL,
    [DepartmentName]               NVARCHAR (40) NULL,
    [Tax1]                         INT           NULL,
    [Department]                   INT           NULL,
    [HozDog]                       NVARCHAR (20) NULL,
    [KodLgoti]                     NVARCHAR (10) NULL,
    [DATBEZN]                      DATETIME      NULL,
    [SDateDog]                     DATETIME      NULL,
    [EDateDog]                     DATETIME      NULL,
    [Potrebitel]                   NVARCHAR (1)  NULL,
    [PotrebitelID]                 INT           NULL,
    [FIOzak]                       NVARCHAR (50) NULL,
    [Pasportn]                     NVARCHAR (50) NULL,
    CONSTRAINT [BillPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [BillToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [BillDateIdx]
    ON [dbo].[Bill]([DataScheta] ASC);


GO
CREATE NONCLUSTERED INDEX [BillPatIDIdx]
    ON [dbo].[Bill]([PatID] ASC);


GO
CREATE NONCLUSTERED INDEX [_dta20140413_index_Bill_7_1351220114__K1_2]
    ON [dbo].[Bill]([ID] ASC)
    INCLUDE([PatID]);


GO
CREATE STATISTICS [_dta20140413_stat_1351220114_19_1_28]
    ON [dbo].[Bill]([ActPresent], [ID], [Void]);


GO

CREATE TRIGGER [dbo].[Bill_Delete] 
ON [dbo].[Bill] 
For DELETE
AS
begin
set nocount on
declare @c int

	select @c=Count(*)
	from deleted d, Payment p
	where d.ID = p.NomerScheta

if @c>0
	raiserror('Нельзя удалять счёт, по которому есть оплаты',16,1)
end
