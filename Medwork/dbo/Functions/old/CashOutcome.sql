
CREATE function [dbo].[CashOutcome](@StartDate datetime, @FinishDate datetime, @Cash int)
returns table as 
return select * from
(
select id, cast(null as int ) as id_in_patform, cast (null as int) as PatId, date as [Дата], PaymentCode, summa,
					--case when summa>0 then 'приходный ордер' else 'расходный ордер' end
					(select top 1 TypeName from CashOrderTypes where id=DocType)
						+IsNull(' №'+DocNumber,'') as doc,
					case when PaymentCode=1	then summa end summa_nal, case when PaymentCode<>1	then summa end summa_beznal,
					Coment
					,Author as [Автор]
					,coNum
					,Cash,type, Kateg
from CashOrder
where DocType=2/*1*/ and Type=3 and (Cash=@Cash or @Cash is null)

union all

select null, p.id, p.PatId, p.DataOplati, p.PayType, summa,
					case when summa>0 then 'оплата' else 'возврат' end+' №'+DocNumber+IsNull(' ('+IsNull('№ИБ '+pat.CardNum+' ', '')+dbo.fnPatBriefName(p.PatId)+')',''),
					case when p.PayType=1	then p.summa end summa_nal, case when p.PayType<>1	then p.summa end summa_beznal,
					''
					,Prinyal
					,coNum
					,Cash as cash, 3 as type, null
from payment p, bill b, patient pat
where p.NomerScheta=b.id and (b.PaymentType=4 or b.PaymentType=3) and p.PayType<>0 and pat.id=p.PatId and IsNull(DocNumber,'')<>''
	and Summa<0/*>0*/
	and (Cash=@Cash or @Cash is null)

union all

select null, oa.id, oa.PatId, oa.PaymentDate, oa.PaymentCode, 
				--oa.summa, 
				case when type=1 then oa.summa else -oa.summa end as summa,
				case when type=1 then 'пополнение лиц. счета' else 'возврат с лиц. счета' end+IsNull(' ('+IsNull('№ИБ '+pat.CardNum+' ', '')+dbo.fnPatBriefName(oa.PatId)+')',''),
				case when oa.PaymentCode=1	then case when type=1 then oa.summa else -oa.summa end end summa_nal, case when oa.PaymentCode<>1	then case when type=1 then oa.summa else -oa.summa end end summa_beznal,
				''
				,UserID
				,coNum
				,Cash,3 as type,null
from oplataavansom oa, patient pat
where (/*type=1 or */type=4) and pat.id=oa.PatId -- #3182 - только возвраты с ЛС
	and (Cash=@Cash or @Cash is null)

) as q 
where [Дата]>=@StartDate and [Дата]<=@FinishDate

