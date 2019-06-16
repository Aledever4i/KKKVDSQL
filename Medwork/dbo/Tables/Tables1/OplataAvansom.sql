CREATE TABLE [dbo].[OplataAvansom] (
    [ID]             INT           NOT NULL,
    [PatID]          INT           NULL,
    [summa]          MONEY         NULL,
    [PaymentDate]    DATETIME      NULL,
    [UserID]         INT           NULL,
    [DocNumber]      NVARCHAR (50) NULL,
    [Type]           INT           NULL,
    [PatId2]         INT           NULL,
    [Id2]            INT           NULL,
    [PaymentCode]    INT           NULL,
    [PatContract]    INT           NULL,
    [coNum]          INT           DEFAULT ((0)) NULL,
    [Cash]           INT           NULL,
    [Osnovanie]      NVARCHAR (50) NULL,
    [Tax1Name]       NVARCHAR (40) NULL,
    [DepartmentName] NVARCHAR (40) NULL,
    [Tax1]           INT           NULL,
    [Department]     INT           NULL,
    CONSTRAINT [OplataAvansomPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [OplataAvansomToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);


GO

Create Trigger OplataAvansomOnChange
On OplataAvansom
After Delete,Update,Insert
As begin

	Set NOCOUNT On

	delete from patform
	from deleted d left join inserted i on i.id=d.id, OplataAvansom oa
	where IsNull(i.Type,0)<>2 and oa.id2=d.id and patform.id=oa.id
	
	delete from patform
	from deleted d left join inserted i on i.id=d.id
	where d.Type=3 and IsNull(i.Type,0)<>3 and patform.id=d.id2
	
	declare @t table (id int identity(1,1),iid int)
	declare @maxid int
	
	insert into @t
		(iid)
	select i.id
	from inserted i	left join OplataAvansom oa on oa.id2=i.id
	where i.Type=2 and oa.id is null
	
	select @maxid=IsNull(max(id),0) from patform
	
	insert into patform
	(PatID, FormID, FormNo, AuthorID, CreateTime, UpdateTime, Security, ID, ParentID, DisplayName, Notes)	
	select 
		oa.PatID2, pf2.FormID, pf2.FormNo, pf2.AuthorID, pf2.CreateTime, pf2.UpdateTime, pf2.Security,
			t.id+@maxid, pf2.ParentID, 'Приход денег с лицевого счёта другого пациента', pf2.Notes
	from patform pf2, OplataAvansom oa, @t t
	where t.iid=oa.id and pf2.id=oa.id
	
	insert into OplataAvansom
		(ID, PatID, summa, PaymentDate, UserID, DocNumber, Type, PatId2, Id2)
	select 
		t.id+@maxid, oa.PatID2, oa.summa, oa.PaymentDate, oa.UserID, oa.DocNumber, 3, oa.PatId, oa.id
	from OplataAvansom oa, @t t
	where t.iid=oa.id
	
	delete from @t
	
	insert into @t
		(iid)
	select i.id
	from inserted i
				left join OplataAvansom oa on oa.id2=i.id
	where i.Type=2 and oa.id is not null

	update patform 
		set PatID=pf.PatID2, FormID=pf.FormID, FormNo=pf.FormNo, AuthorID=pf.AuthorID,
			CreateTime=pf.CreateTime, UpdateTime=pf.UpdateTime, Security=pf.Security, ParentID=pf.ParentID,
				DisplayName='Приход денег с лицевого счёта другого пациента', Notes=pf.Notes
	from
	(
	select oa.PatID2, pf2.FormID, pf2.FormNo, pf2.AuthorID,	pf2.CreateTime, pf2.UpdateTime, pf2.Security,
				 pf2.ParentID, pf2.Notes, oa.id2
	from patform pf2, OplataAvansom oa, @t t
	where t.iid=oa.id and pf2.id=oa.id
	) pf
	where id=pf.id2
	
	update OplataAvansom
		set PatID=oa.PatID2, summa=oa.summa, PaymentDate=oa.PaymentDate, UserID=oa.UserID, DocNumber=oa.DocNumber,
			Type=3, PatId2=oa.PatId, Id2=oa.id1
	from
	(
	select
			oa.PatID2, oa.summa, oa.PaymentDate, oa.UserID, oa.DocNumber, oa.PatId, oa.id as id1, oa.id2
	from OplataAvansom oa, @t t
	where t.iid=oa.id
	) oa
	where id=oa.id2

end

GO

Create Trigger OplataAvansomOnChange_CalcBalance
On OplataAvansom
After Delete,Update,Insert
As begin

	Set NOCOUNT On
	
	update patient
		set PersonalAccountBalance=IsNull(PersonalAccountBalance,0)-t.sm
	from
	(
		select PatId, sum(case when type=1 or type=3 then IsNull(summa,0) else -IsNull(summa,0) end) sm
		from deleted d
		where IsNull(DocNumber,'')<>''
		group by PatId
	) t
	where t.PatId=id
	
	update patient
		set PersonalAccountBalance=IsNull(PersonalAccountBalance,0)+t.sm
	from
	(
		select PatId, sum(case when type=1 or type=3 then IsNull(summa,0) else -IsNull(summa,0) end) sm
		from inserted i
		where IsNull(DocNumber,'')<>''
		group by PatId
	) t
	where t.Patid=id
	
end


GO
EXECUTE sp_settriggerorder @triggername = N'[dbo].[OplataAvansomOnChange_CalcBalance]', @order = N'last', @stmttype = N'delete';


GO
EXECUTE sp_settriggerorder @triggername = N'[dbo].[OplataAvansomOnChange_CalcBalance]', @order = N'last', @stmttype = N'insert';


GO
EXECUTE sp_settriggerorder @triggername = N'[dbo].[OplataAvansomOnChange_CalcBalance]', @order = N'last', @stmttype = N'update';

