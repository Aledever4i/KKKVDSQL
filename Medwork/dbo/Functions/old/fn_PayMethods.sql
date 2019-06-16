
CREATE FUNCTION [dbo].[fn_PayMethods] (@PatID_ int, @date datetime)
RETURNS @t TABLE (
		[ID] [int],
		[name] nvarchar(255),
		[discount] float,
		[PayType] int,
		[WarningMessage] nvarchar(255)		
		)
AS
begin
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
			when 7 then
				'ВМП'  			
			when 2 then
				'Договор '+ 
				case o.Type
					when 'СК' then 'с СК'
					when 'Организация' then	'с Орг.'
					when 'Физическое лицо' then 'с ФЛ'
					else ''
				end +''
		when 3 then
			IsNull('Дог. с пациентом № '+DogNum+IsNull(' от '+ convert(nvarchar,DocDate,102),'')+' ','')
		else ''
		end --[25.01.2007]
		+ IsNull(' ('+case when Len(IsNull(o.BriefName,''))=0 then o.fullname else o.BriefName end --[04.05.2007]
		+ IsNull('('+ct.ContractNumber+')','')+') ','')
		+ case when a.letresult <> '' then ', г/п ' + a.letresult else '' end
		) [name],
		0 [discount],
		a.AttType [PayType],
		case 
			when not ((a.beg_Date <= @date or a.beg_Date is null) And (a.End_Date+1 > @date or a.End_Date is null))
				then 'Выбранная дата не соответствует срокам прикрепления (' 
				+ isnull(convert(nvarchar(30), a.Beg_Date, 104),'') +
				+ isnull(' - ' + convert(nvarchar(30), a.End_Date, 104),'') + ')'
			when not ((@date>=ct.beg_date or ct.beg_date is not null) And (@date<=ct.end_date or ct.end_date is null)) 
				then 'Выбранная дата не соответствует срокам договора (' 
				+ isnull(convert(nvarchar(30), ct.Beg_Date, 104),'') +
				+ isnull(' - ' + convert(nvarchar(30), ct.End_Date, 104),'') + ')' 
			else ''
		end as [WarningMessage]
	from attachment a left join organisations o on a.[off] = o.code 
		left join contracts ct on ct.id = dbo.fnActualcontractID(a.dog,@Date) 	
	where a.masterid = @PatID_
	union
	select 
		0, 
		'Разовое посещение' , 
		0,
		4,
		'' as [WarningMessage]
	from patient
	where id=@PatID_
return
end
