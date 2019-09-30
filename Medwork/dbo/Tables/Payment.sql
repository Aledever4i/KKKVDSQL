CREATE TABLE [dbo].[Payment] (
    [ID]             INT            NOT NULL,
    [PatID]          INT            NULL,
    [NomerScheta]    INT            NULL,
    [DataOplati]     DATETIME       NULL,
    [Prinyal]        INT            NULL,
    [Summa]          MONEY          NULL,
    [OplataKartoy]   INT            NULL,
    [PayType]        INT            NULL,
    [Firm]           INT            NULL,
    [Paid]           NVARCHAR (1)   NULL,
    [Cash]           INT            NULL,
    [Change]         FLOAT (53)     NULL,
    [Printed]        NVARCHAR (1)   NULL,
    [MasterID]       INT            NULL,
    [DocNumber]      NVARCHAR (50)  NULL,
    [Saved]          NVARCHAR (1)   NULL,
    [coNum]          INT            DEFAULT ((0)) NULL,
    [DateNextPay]    DATETIME       NULL,
    [PatId2]         INT            NULL,
    [cash1]          INT            NULL,
    [Tax1Name]       NVARCHAR (40)  NULL,
    [DepartmentName] NVARCHAR (40)  NULL,
    [Tax1]           INT            NULL,
    [Department]     INT            NULL,
    [Notes]          NVARCHAR (255) NULL,
    [PrVozvrCode]    NVARCHAR (4)   NULL,
    CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PaymentToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [PaymentDataOplati]
    ON [dbo].[Payment]([DataOplati] ASC);


GO
CREATE NONCLUSTERED INDEX [PaymentBill]
    ON [dbo].[Payment]([NomerScheta] ASC);


GO
CREATE NONCLUSTERED INDEX [PaymentPrinyalIdx]
    ON [dbo].[Payment]([Prinyal] ASC)
    INCLUDE([ID], [DataOplati], [Cash]);


GO
CREATE STATISTICS [_dta20140413_stat_1734557513_3_1]
    ON [dbo].[Payment]([NomerScheta], [ID]);


GO

CREATE TRIGGER PaymentOnChange
ON Payment
FOR DELETE,UPDate,insert
AS 
BEGIN

		 SET NOCOUNT ON     
		      
          update dbo.Patient
          set PersonalAccountBalance = isnull(PersonalAccountBalance,0) + x.value
          from
               (
               select
                    d.PatID,
                    sum(isnull(d.Summa,0)) value,
                    d.PatId2
               from     deleted d
               where isnull(d.DocNumber,'') <> ''
               	and d.PayType=0
               group by d.PatID, d.PatId2
               )x
          where
	          	IsNull(x.Patid2,x.PatId)=patient.ID
               
               
          update dbo.Patient
          set PersonalAccountBalance = isnull(PersonalAccountBalance,0) - x.value
          from
               (
               select
                    i.PatID,
                    sum(isnull(i.Summa,0)) value,
                    i.PatId2
               from     
                     inserted i               
          
               where isnull(i.DocNumber,'') <> ''
               	and i.PayType=0
               group by i.PatID, i.PatId2
               )x
          where
	          	IsNull(x.Patid2,x.PatID)=patient.ID
     
END

GO


CREATE TRIGGER [dbo].[Payment_Delete] 
ON [dbo].[Payment] 
FOR DELETE
AS
BEGIN

--declare @c int

--	select @c=Count(*)
--	from deleted d, Payment p
--	where p.NomerScheta=d.NomerScheta and p.summa<0 and d.summa>0

--if @c>0
--	raiserror('Нельзя удалять оплату, пока есть возвраты по счёту',16,1)

DECLARE @rowcnt int
DECLARE @NomerScheta int
DECLARE @ID int
DECLARE @summ money

SET @rowcnt=@@ROWCOUNT
SET NOCOUNT ON

IF @rowcnt=1
BEGIN
	SELECT @NomerScheta=NomerScheta,@ID=ID FROM DELETED
	IF (SELECT SUM(Summa)
		FROM Payment P WITH (NOLOCK) 
		WHERE (NomerScheta=@NomerScheta) AND (ID<>@ID)
		) < 0
	RAISERROR('<INFO>Нельзя удалить оплату, т.к. сумма возвратов по счету превышает сумму оставшихся оплат</INFO>',16,1)	
END

update dbo.Bill
set Void = '-'
from deleted d left join inserted i on i.ID=d.ID
where d.NomerScheta=Bill.ID and i.ID is null
	
update BillService set PaymentID=null 
where PaymentID in (select d.ID from deleted d left join inserted i on i.ID=d.ID where i.ID is null)

END
