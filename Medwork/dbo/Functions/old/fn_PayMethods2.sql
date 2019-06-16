create FUNCTION [dbo].[fn_PayMethods2] (@PatID_ int, @date datetime)
RETURNS @t TABLE (
		[ID] [int],
		[name] nvarchar(255),
		ContractNumDate varchar(255),
  	[discount] float,
	  [PayType] int
		)
AS
begin

declare @ct table (Dog int, NewDog int, contractnumber nvarchar(50), newcontractNumber nvarchar(50), beg_date datetime, end_date datetime)

insert into @ct
select id,id,contractnumber,contractnumber,beg_date,end_date
from contracts c

declare @c int
set @c=0

while ((select count(*) from @ct)-@c)>0
begin
	set @c=(select count(*) from @ct)
	insert @ct
	select ct1.dog,ct2.dog,ct1.contractnumber,ct2.contractnumber,case when ct1.end_date<ct2.beg_date then ct2.beg_date else ct1.end_date end,ct2.end_date
	from @ct ct1, @ct ct2, contracts c1, contracts c2
	where ct1.dog=c1.id and ct2.dog=c2.id and c2.MasterId=c1.MasterID and c1.id<>c2.id and c2.end_date>c1.end_date
		and c1.nextdog=c2.id
		and c2.id not in
		(select newdog from @ct ct3 where ct3.dog=ct1.dog)
end
----

 insert into @t
  select distinct
	  a.id, 
  	( --[25.01.2007]
  	case a.AttType
	  	when 1 then
  			'ОМС'
	  	when 5 then
  			'Гос.Бюджет'
	  	when 6 then
  			'Квота'  			
  		when 2 then
  			'Договор '+ 
  					case o.Type
				  	when 'СК' then
				  			'с СК'
			  		when 'Организация' then
	  					'с Орг.'
			  		when 'Физическое лицо' then
  						'с ФЛ'
				  	else
  						''
			  	end +''
  		when 3 then
  			IsNull('Дог. с пациентом № '+DogNum+IsNull(' от '+ convert(nvarchar,DocDate,102),'')+' ','')
	  	else
  			''
  	end --[25.01.2007]
  	+IsNull(' ('+case when Len(IsNull(o.BriefName,''))=0 then o.fullname else o.BriefName end --[04.05.2007]
  	+ isnull('('+ct.newcontractNumber+')','')+') ','')
  	+ case when a.letresult <> '' then ', г/п ' + a.letresult else '' end
  	 ) [name],
  	IsNull('№ '+DogNum+IsNull(' от '+ convert(nvarchar,DocDate,102),'')+' ',''),
  	0 [discount],
	  a.AttType [PayType]
  from attachment a 
	  left join organisations o on a.[off] = o.code 
		left join @ct ct on ct.dog = a.dog and @date>=ct.beg_date and @date<=ct.end_date   	
  where a.masterid = @PatID_
	  And (a.beg_Date <= @date or a.beg_Date is null)
  	And (a.End_Date+1 > @date or a.End_Date is null)
  	and (a.AttType<>2 or ct.newdog is not null)
union
  select 
    0, 
    'Разовое посещение' ,
    '',
    0,
    4
  from patient
  where id=@PatID_
	

return
end
