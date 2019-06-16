
create procedure GetForm16cc
  @d1 datetime, 
  @d2 datetime, 
  @Patid int = -1, 
  @Ceh varchar(100) = '-1', 
  @CompanyFor int = -1,
  @dateoffset int = 0 
as
begin
set ansi_warnings off
set nocount on
set @d2 = dateadd(dd, @dateoffset, @d2)

declare @CompanyForBrief varchar(70)
set @CompanyForBrief = '-1'

-- для случая "не указано" указывать пустое значние для @CompanyForBrief не хорошо, т.к. и в листках у места работы может быть пусто
-- "не указано" = '-1', "не найдена" = '-2' <> "не указано"

if @CompanyFor > 0
begin
	select @CompanyForBrief = isnull(BriefName, '-2') from Organisations where id = @CompanyFor
end

--if OBJECT_ID('tempdb..#Form16cc') is not null
--	drop table #Form16cc

if OBJECT_ID('tempdb..#sl100cc') is not null
	drop table #sl100cc;

if OBJECT_ID('tempdb..#sl101cc') is not null
	drop table #sl101cc;

-- варианты связывания листков - листок А номер 100 и Б номер 101
-- 1 в А стоит, что выдано продолжение с номером 101 (то есть Б), в Б ничего не стоит
-- 2 в Б стоит, что он продолжение листа 100 (то есть А), в А ничего не стоит

declare @rcnt int
set @rcnt = 0

-- _первичные_ листки, начавшиеся в периоде
-- листки в сериях надо нумеровать, что бы знать последний листок серии (по id из-за дубликатов не определяется)
-- надо тащить признак, что лист дубликат, что бы считать количество обращений к врачу
select * into #sl100cc from
( -- в качестве серии берется йд листка-оригинала sl1.id, вместо sl1.ln_code
	select sl1.id, sl1.ln_code, sl1.prev_ln_code, sl1.next_ln_code, sl1.TREAT1_DT1,
				 case when sl1.Closed_in_other_LPU=0 then sl1.RETURN_DATE_LPU
				 else case
					when sl1.RETURN_DATE_LPU is not null then sl1.RETURN_DATE_LPU
					when sl1.TREAT3_DT2 is not null then sl1.TREAT3_DT2
					when sl1.TREAT2_DT2 is not null then sl1.TREAT2_DT2
					else sl1.TREAT1_DT2
				 end end as [RETURN_DATE_LPU], -- sl1.RETURN_DATE_LPU as [RETURN_DATE_LPU],
		    sl1.id as serie, sl1.DiagCode, sl1.Vozrast, sl1.patid,
	(case when sl1.REASON1='01' then 1
	 when sl1.REASON1='02' then 2
	 when sl1.REASON1='03' then 3
	 when sl1.REASON1='05' then 5
	 when sl1.REASON1='08' then 8
	 when sl1.REASON1='09' then 9
	 else 0 end) as [REASON1], 1 as cnt, DUPLICATE_FLAG, Open_in_other_LPU, Closed_in_other_LPU, PRIMARY_FLAG,
	 LN_EMPLOYER, REPLACE(Ceh, CHAR(13), '') ceh --, sl1.ID as Open_LN_ID, sl1.ID as Close_LN_ID
	from sicklist sl1
	left join patform pf on pf.id=sl1.id	
	where ((PRIMARY_FLAG=1) or (PRIMARY_FLAG=0 and Open_in_other_LPU=1 and prev_ln_code='')) and DUPLICATE_FLAG <> 1 and TREAT1_DT1>=@d1 and TREAT1_DT1<=@d2 and Canceled = 0	and (sl1.PatId=@PatId or @PatId=-1)
) as tt
set @rcnt = @@rowcount

-- дубликаты первичных листков начавшихся в периоде надо вставлять отдельно, что бы они были связаны серией с листком оригиналом
if (@rcnt > 0)
begin
	insert into #sl100cc (id, ln_code, prev_ln_code, next_ln_code, TREAT1_DT1, RETURN_DATE_LPU, serie, DiagCode, Vozrast, patid, REASON1, cnt, DUPLICATE_FLAG, Open_in_other_LPU, Closed_in_other_LPU, PRIMARY_FLAG, LN_EMPLOYER, Ceh)
	select sl1.id, sl1.ln_code, sl1.prev_ln_code, sl1.next_ln_code, sl1.TREAT1_DT1,
	case when sl1.Closed_in_other_LPU=0 then sl1.RETURN_DATE_LPU
	else
		case
			when sl1.RETURN_DATE_LPU is not null then sl1.RETURN_DATE_LPU
			when sl1.TREAT3_DT2 is not null then sl1.TREAT3_DT2
			when sl1.TREAT2_DT2 is not null then sl1.TREAT2_DT2
			else sl1.TREAT1_DT2
		end
	end, -- sl1.RETURN_DATE_LPU,
	 sl.serie,
	(case when sl.DiagCode='' then sl1.DiagCode else sl.DiagCode end), isnull(sl.Vozrast, sl1.Vozrast), sl1.patid,
	(case when sl1.REASON1='01' then 1
	when sl1.REASON1='02' then 2
	when sl1.REASON1='03' then 3
	when sl1.REASON1='05' then 5
	when sl1.REASON1='08' then 8
	when sl1.REASON1='09' then 9
	else sl.REASON1 end) as REASON1, 2 as cnt, sl1.DUPLICATE_FLAG, sl.Open_in_other_LPU,
	(case when sl1.Closed_in_other_LPU = 1 then 1 else sl.Closed_in_other_LPU end) as Closed_in_other_LPU, sl1.PRIMARY_FLAG,
	(case when sl.LN_EMPLOYER = '' then sl1.LN_EMPLOYER else sl.LN_EMPLOYER end) as LN_EMPLOYER, -- если в оригинале пуст, то взять из не оригинала
	(case when sl.Ceh = '' then REPLACE(sl1.Ceh, CHAR(13), '') else sl.Ceh end) as Ceh
	from sicklist as sl1
	inner join #sl100cc sl on sl.patid = sl1.patid and sl.TREAT1_DT1 = sl1.TREAT1_DT1 and sl.DiagCode=sl1.DiagCode -- листки дубликаты связываются с листком оригиналом по дате выдачи
	inner join patform pf on pf.id=sl1.id
	where sl1.DUPLICATE_FLAG = 1 and Canceled = 0 -- листки которые дубликаты связаны с листками оригиналами
end

while (@rcnt > 0)
begin
	-- 1) потомки и дубликаты потомков первичных листков
	set @rcnt = 0
	-- вставка листков-продолжений, которые ссылаются на листки-предшественники из таблицы
	-- в предшественниках ссылки не обязательны
	insert into #sl100cc (id, ln_code, prev_ln_code, next_ln_code, TREAT1_DT1, RETURN_DATE_LPU, serie, DiagCode, Vozrast, patid, REASON1, cnt, DUPLICATE_FLAG, Open_in_other_LPU, Closed_in_other_LPU, LN_EMPLOYER, Ceh)
	select sl1.id, sl1.ln_code, sl1.prev_ln_code, sl1.next_ln_code, sl1.TREAT1_DT1,
	case when sl1.Closed_in_other_LPU=0 then sl1.RETURN_DATE_LPU
	else
		case
			when sl1.RETURN_DATE_LPU is not null then sl1.RETURN_DATE_LPU
			when sl1.TREAT3_DT2 is not null then sl1.TREAT3_DT2
			when sl1.TREAT2_DT2 is not null then sl1.TREAT2_DT2
			else sl1.TREAT1_DT2
		end
	end, -- sl1.RETURN_DATE_LPU,
	sl.serie,
	(case when sl.DiagCode='' then sl1.DiagCode else sl.DiagCode end), isnull(sl.Vozrast, sl1.Vozrast), sl1.patid,
	(case when sl1.REASON1='01' then 1
	when sl1.REASON1='02' then 2
	when sl1.REASON1='03' then 3
	when sl1.REASON1='05' then 5
	when sl1.REASON1='08' then 8
	when sl1.REASON1='09' then 9
	else sl.REASON1 end) as REASON1, sl.cnt + 1, sl1.DUPLICATE_FLAG, sl.Open_in_other_LPU,
	(case when sl1.Closed_in_other_LPU = 1 then 1 else sl.Closed_in_other_LPU end) as Closed_in_other_LPU,
	(case when sl.LN_EMPLOYER = '' then sl1.LN_EMPLOYER else sl.LN_EMPLOYER end) as LN_EMPLOYER,
	(case when sl.Ceh = '' then REPLACE(sl1.Ceh, CHAR(13), '') else sl.Ceh end) as Ceh
	from sicklist as sl1
	inner join #sl100cc sl on sl.ln_code = sl1.prev_ln_code
	inner join patform pf on pf.id=sl1.id
	where sl1.prev_ln_code <> '' and sl1.DUPLICATE_FLAG <> 1 and Canceled = 0 -- листки в которых ссылки на листки выборки и не дубликаты
	and sl1.id not in (select id from #sl100cc)
	set @rcnt = @rcnt + @@rowcount

	-- дополнить набор не попавшими листками в которых нет ссылок на предшественников, но у предшественников которых есть ссылки на них,
	-- уже обязательно не первичные
	insert into #sl100cc (id, ln_code, prev_ln_code, next_ln_code, TREAT1_DT1, RETURN_DATE_LPU, serie, DiagCode, Vozrast, patid, REASON1, cnt, DUPLICATE_FLAG, Open_in_other_LPU, Closed_in_other_LPU, LN_EMPLOYER, Ceh)
	select sl1.id, sl1.ln_code, sl1.prev_ln_code, sl1.next_ln_code, sl1.TREAT1_DT1,
	case when sl1.Closed_in_other_LPU=0 then sl1.RETURN_DATE_LPU
	else
		case
			when sl1.RETURN_DATE_LPU is not null then sl1.RETURN_DATE_LPU
			when sl1.TREAT3_DT2 is not null then sl1.TREAT3_DT2
			when sl1.TREAT2_DT2 is not null then sl1.TREAT2_DT2
			else sl1.TREAT1_DT2
		end
	end, -- sl1.RETURN_DATE_LPU,
	sl.serie,
	(case when sl.DiagCode='' then sl1.DiagCode else sl.DiagCode end), isnull(sl.Vozrast,sl1.Vozrast), sl1.patid,
	(case when sl1.REASON1='01' then 1
	 when sl1.REASON1='02' then 2
	 when sl1.REASON1='03' then 3
	 when sl1.REASON1='05' then 5
	 when sl1.REASON1='08' then 8
	 when sl1.REASON1='09' then 9
	 else sl.REASON1 end), sl.cnt + 1, sl1.DUPLICATE_FLAG, sl.Open_in_other_LPU,
	(case when sl1.Closed_in_other_LPU = 1 then 1 else sl.Closed_in_other_LPU end) as Closed_in_other_LPU,
	(case when sl.LN_EMPLOYER = '' then sl1.LN_EMPLOYER else sl.LN_EMPLOYER end) as LN_EMPLOYER,
	(case when sl.Ceh = '' then REPLACE(sl1.Ceh, CHAR(13), '') else sl.Ceh end) as Ceh
	from sicklist as sl1
	inner join #sl100cc sl on sl.next_ln_code = sl1.ln_code
	inner join patform pf on pf.id=sl1.id
	where sl1.DUPLICATE_FLAG <> 1 and sl1.ln_code <> '' and Canceled = 0 and sl1.id not in (select id from #sl100cc)
	set @rcnt = @rcnt + @@rowcount

	-- дополнить набор дубликатами вставленных листков-потомков
	-- с какого листка будет продолжена цепочка - не известно
	-- может быть, выдано 2 листка l1 и l2, на l2 выдан дубликат d2 c которого продолжается выдача потомков
	-- l1 -> l2 = d2 -> l3 -> ...
	-- а может быть выдано 3 листка l1 -> l2 -> l3 а потом на испорченный l2 выдан d2, который в цепочке не участвует, кроме как,
	-- что может иметь id больший чем у листка-потомка l3, т.е. не позволяет по id определять кем цепочка листков заканчивается
	if (@rcnt > 0)
	begin
		insert into #sl100cc (id, ln_code, prev_ln_code, next_ln_code, TREAT1_DT1, RETURN_DATE_LPU, serie, DiagCode, Vozrast, patid, REASON1, cnt, DUPLICATE_FLAG, Open_in_other_LPU, Closed_in_other_LPU, LN_EMPLOYER, Ceh)
		select sl1.id, sl1.ln_code, sl1.prev_ln_code, sl1.next_ln_code, sl1.TREAT1_DT1,
		case when sl1.Closed_in_other_LPU=0 then sl1.RETURN_DATE_LPU
		else
			case
				when sl1.RETURN_DATE_LPU is not null then sl1.RETURN_DATE_LPU
				when sl1.TREAT3_DT2 is not null then sl1.TREAT3_DT2
				when sl1.TREAT2_DT2 is not null then sl1.TREAT2_DT2
				else sl1.TREAT1_DT2
			end
		end, -- sl1.RETURN_DATE_LPU,
	 	sl.serie,
		(case when sl.DiagCode='' then sl1.DiagCode else sl.DiagCode end), isnull(sl.Vozrast, sl1.Vozrast), sl1.patid,
		(case when sl1.REASON1='01' then 1
		when sl1.REASON1='02' then 2
		when sl1.REASON1='03' then 3
		when sl1.REASON1='05' then 5
		when sl1.REASON1='08' then 8
		when sl1.REASON1='09' then 9
		else sl.REASON1 end) as REASON1, sl.cnt + 1, sl1.DUPLICATE_FLAG, sl.Open_in_other_LPU,
		(case when sl1.Closed_in_other_LPU = 1 then 1 else sl.Closed_in_other_LPU end) as Closed_in_other_LPU,
		(case when sl.LN_EMPLOYER = '' then sl1.LN_EMPLOYER else sl.LN_EMPLOYER end) as LN_EMPLOYER,
		(case when sl.Ceh = '' then REPLACE(sl1.Ceh, CHAR(13), '') else sl.Ceh end) as Ceh
		from sicklist as sl1
		inner join #sl100cc sl on sl.patid = sl1.patid and sl.TREAT1_DT1 = sl1.TREAT1_DT1 and sl.DiagCode=sl1.DiagCode
		inner join patform pf on pf.id=sl1.id
		where sl1.DUPLICATE_FLAG = 1 and Canceled = 0 -- листки которые дубликаты связаны с листками оригиналами
		and sl1.id not in (select id from #sl100cc)
	end
	-- все первичные из периода и их потомки собраны, остались листки начавшиеся до периода и завершившиеся в периоде
	-- становится важным заполнение поля диагноз у исходного листка и дубликата, иначе не свяжутся
	-- а связь по датам и пациентам - менее четкая и на случае одновременных листков может ошибнуть
end
-- в результате собраны серии листков с дубликатами, начавшиеся в периоде и завершившиеся либо в нем, либо в следующем периоде,
-- либо не завершившиеся
-- из этого набора для отчета нужны только завершившиеся в периоде

-- так же собрать все серии завершившиеся в периоде и не попавшие в предыдущий набор (то есть начавшиеся до начала периода)
-- похожая процедура, но начинать сбор серий листков с конца
-- собрать все завершившиеся в периоде листки, они не обязательно первичны
-- id не в #sl100cc
-- новые серии не будут пересекаться с сериями из #sl100cc, поэтому для ускорения собирать их в другой аналогичной таблице

-- надо аккуратно сгруппировать их по сериям (дубликаты и их оригиналы завершаются одинаково)
-- все листки (не дубликаты), завершившиеся в периоде
select * into #sl101cc from
( -- в качестве серии берется йд листка
	select sl1.id, sl1.ln_code, sl1.prev_ln_code, sl1.next_ln_code, sl1.TREAT1_DT1,
	case when sl1.Closed_in_other_LPU=0 then sl1.RETURN_DATE_LPU
	else
		case
			when sl1.RETURN_DATE_LPU is not null then sl1.RETURN_DATE_LPU
			when sl1.TREAT3_DT2 is not null then sl1.TREAT3_DT2
			when sl1.TREAT2_DT2 is not null then sl1.TREAT2_DT2
			else sl1.TREAT1_DT2
		end
	end as [RETURN_DATE_LPU], -- sl1.RETURN_DATE_LPU,
  sl1.id as serie, sl1.DiagCode, sl1.Vozrast, sl1.patid,
	(case when sl1.REASON1='01' then 1
	 when sl1.REASON1='02' then 2
	 when sl1.REASON1='03' then 3
	 when sl1.REASON1='05' then 5
	 when sl1.REASON1='08' then 8
	 when sl1.REASON1='09' then 9
	 else 0 end) as [REASON1],  5000 as cnt, DUPLICATE_FLAG, Open_in_other_LPU, Closed_in_other_LPU, PRIMARY_FLAG, LN_EMPLOYER, REPLACE(Ceh, CHAR(13), '') ceh
	from sicklist sl1
	left join patform pf on pf.id=sl1.id	
	where DUPLICATE_FLAG <> 1 and 
	(case when sl1.Closed_in_other_LPU=0 then sl1.RETURN_DATE_LPU
	else
		case
			when sl1.RETURN_DATE_LPU is not null then sl1.RETURN_DATE_LPU
			when sl1.TREAT3_DT2 is not null then sl1.TREAT3_DT2
			when sl1.TREAT2_DT2 is not null then sl1.TREAT2_DT2
			else sl1.TREAT1_DT2
		end
	end)>=@d1 and -- RETURN_DATE_LPU>=@d1 and 
	(case when sl1.Closed_in_other_LPU=0 then sl1.RETURN_DATE_LPU
	else
		case
			when sl1.RETURN_DATE_LPU is not null then sl1.RETURN_DATE_LPU
			when sl1.TREAT3_DT2 is not null then sl1.TREAT3_DT2
			when sl1.TREAT2_DT2 is not null then sl1.TREAT2_DT2
			else sl1.TREAT1_DT2
		end
	end)<=@d2 and -- RETURN_DATE_LPU<=@d2 and
	Canceled = 0
	and (sl1.PatId=@PatId or @PatId=-1)
	and sl1.id not in (select id from #sl100cc)
) as tt
set @rcnt = @@rowcount

-- Сотрудник может иметь несколько больничных за одно и тот же время, в том случае, если он обратился одновременно к нескольким врачам.
-- Например, он сломал руку и обратился в травмпункт, где получил свой законный больничный. Во время лечения перелома, он заболел
-- еще и гриппом, обратился к другому врачу и получил второй больничный. В итоге человек имеет два больничных, которые выданы по
-- разным заболеваниям.
-- есть незначительная вероятность ошибки - выданы два накладывающихся ЛН, кончающиеся в один день и
-- хотя бы на один выдан дубликат, если с дубликатом были связи, то они могут покосячить, с малой вероятностью
-- тогда вязать еще и по коду мкб
if (@rcnt > 0) -- вставить дубликаты вставленных
begin
	insert into #sl101cc (id, ln_code, prev_ln_code, next_ln_code, TREAT1_DT1, RETURN_DATE_LPU, serie, DiagCode, Vozrast, patid, REASON1, cnt, DUPLICATE_FLAG, Open_in_other_LPU, Closed_in_other_LPU, PRIMARY_FLAG, LN_EMPLOYER, Ceh)
	select sl1.id, sl1.ln_code, sl1.prev_ln_code, sl1.next_ln_code, sl1.TREAT1_DT1,
	case when sl1.Closed_in_other_LPU=0 then sl1.RETURN_DATE_LPU
	else
		case
			when sl1.RETURN_DATE_LPU is not null then sl1.RETURN_DATE_LPU
			when sl1.TREAT3_DT2 is not null then sl1.TREAT3_DT2
			when sl1.TREAT2_DT2 is not null then sl1.TREAT2_DT2
			else sl1.TREAT1_DT2
		end
	end, -- sl1.RETURN_DATE_LPU,
	 sl.serie,
	(case when sl.DiagCode='' then sl1.DiagCode else sl.DiagCode end), isnull(sl.Vozrast, sl1.Vozrast), sl1.patid,
	(case when sl1.REASON1='01' then 1
	when sl1.REASON1='02' then 2
	when sl1.REASON1='03' then 3
	when sl1.REASON1='05' then 5
	when sl1.REASON1='08' then 8
	when sl1.REASON1='09' then 9
	else sl.REASON1 end) as REASON1, sl.cnt - 1, sl1.DUPLICATE_FLAG, sl.Open_in_other_LPU,
	(case when sl1.Closed_in_other_LPU = 1 then 1 else sl.Closed_in_other_LPU end) as Closed_in_other_LPU, sl1.PRIMARY_FLAG,
	(case when sl1.LN_EMPLOYER = '' then sl.LN_EMPLOYER else sl1.LN_EMPLOYER end) as LN_EMPLOYER,
	(case when REPLACE(sl1.Ceh, CHAR(13), '') = '' then sl.Ceh else REPLACE(sl1.Ceh, CHAR(13), '') end) as Ceh
	from sicklist as sl1 -- однозначных указаний на заполнение даты к труду в дубликатах не нашел, поэтому такая связь листков инструкциями
	inner join #sl101cc sl on sl.patid = sl1.patid and sl.RETURN_DATE_LPU = 
	(case when sl1.Closed_in_other_LPU=0 then sl1.RETURN_DATE_LPU
	else
		case
			when sl1.RETURN_DATE_LPU is not null then sl1.RETURN_DATE_LPU
			when sl1.TREAT3_DT2 is not null then sl1.TREAT3_DT2
			when sl1.TREAT2_DT2 is not null then sl1.TREAT2_DT2
			else sl1.TREAT1_DT2
		end
	end) --	sl1.RETURN_DATE_LPU
	and sl.DiagCode=sl1.DiagCode -- не подтверждена
	inner join patform pf on pf.id=sl1.id
	where sl1.DUPLICATE_FLAG = 1 and Canceled = 0 and 
	(case when sl1.Closed_in_other_LPU=0 then sl1.RETURN_DATE_LPU
	else
		case
			when sl1.RETURN_DATE_LPU is not null then sl1.RETURN_DATE_LPU
			when sl1.TREAT3_DT2 is not null then sl1.TREAT3_DT2
			when sl1.TREAT2_DT2 is not null then sl1.TREAT2_DT2
			else sl1.TREAT1_DT2
		end
	end)  is not null -- sl1.RETURN_DATE_LPU is not null -- листки которые дубликаты связаны с листками оригиналами
	and sl1.id not in (select id from #sl100cc)
end

-- при пострении цепочки листков с конца, схема вставки сначала не дубликатов, а потом их дубликатов не работает т.к.
-- может быть, выдано 2 листка l1 и l2, на l2 выдан дубликат d2 c которого продолжается выдача потомков
-- l1 -> l2 = d2 -> l3 -> ... поэтому вставлять все по связям и потом добавлять все дубликатной связи, которых нигде нет
while (@rcnt > 0)
begin
	-- 1) завершенные листки, их предки и их дубликаты
	set @rcnt = 0
	-- вставка листков-предков, которые ссылаются на листки-продолжения
	-- в предшественниках ссылки не обязательны

	insert into #sl101cc (id, ln_code, prev_ln_code, next_ln_code, TREAT1_DT1, RETURN_DATE_LPU, serie, DiagCode, Vozrast, patid, REASON1, cnt, DUPLICATE_FLAG, Open_in_other_LPU, Closed_in_other_LPU, PRIMARY_FLAG, LN_EMPLOYER, Ceh)
	select sl1.id, sl1.ln_code, sl1.prev_ln_code, sl1.next_ln_code, sl1.TREAT1_DT1, 
	case when sl1.Closed_in_other_LPU=0 then sl1.RETURN_DATE_LPU
	else
		case
			when sl1.RETURN_DATE_LPU is not null then sl1.RETURN_DATE_LPU
			when sl1.TREAT3_DT2 is not null then sl1.TREAT3_DT2
			when sl1.TREAT2_DT2 is not null then sl1.TREAT2_DT2
			else sl1.TREAT1_DT2
		end
	end,
	sl.serie,
	(case when sl.DiagCode='' then sl1.DiagCode else sl.DiagCode end), isnull(sl.Vozrast, sl1.Vozrast), sl1.patid,
	(case when sl1.REASON1='01' then 1
	when sl1.REASON1='02' then 2
	when sl1.REASON1='03' then 3
	when sl1.REASON1='05' then 5
	when sl1.REASON1='08' then 8
	when sl1.REASON1='09' then 9
	else sl.REASON1 end) as REASON1, sl.cnt - 1, sl1.DUPLICATE_FLAG, sl.Open_in_other_LPU,
	(case when sl1.Closed_in_other_LPU = 1 then 1 else sl.Closed_in_other_LPU end) as Closed_in_other_LPU, sl1.PRIMARY_FLAG,
	(case when sl1.LN_EMPLOYER = '' then sl.LN_EMPLOYER else sl1.LN_EMPLOYER end) as LN_EMPLOYER,
	(case when REPLACE(sl1.Ceh, CHAR(13), '') = '' then sl.Ceh else REPLACE(sl1.Ceh, CHAR(13), '') end) as Ceh
	from sicklist as sl1
	inner join #sl101cc sl on sl.prev_ln_code = sl1.ln_code
	inner join patform pf on pf.id=sl1.id
	where sl1.ln_code <> '' and Canceled = 0
	and sl1.id not in (select id from #sl101cc) 
	set @rcnt = @rcnt + @@rowcount 

	insert into #sl101cc (id, ln_code, prev_ln_code, next_ln_code, TREAT1_DT1, RETURN_DATE_LPU, serie, DiagCode, Vozrast, patid, REASON1, cnt, DUPLICATE_FLAG, Open_in_other_LPU, Closed_in_other_LPU, PRIMARY_FLAG, LN_EMPLOYER, Ceh)
	select sl1.id, sl1.ln_code, sl1.prev_ln_code, sl1.next_ln_code, sl1.TREAT1_DT1,
	case when sl1.Closed_in_other_LPU=0 then sl1.RETURN_DATE_LPU
	else
		case
			when sl1.RETURN_DATE_LPU is not null then sl1.RETURN_DATE_LPU
			when sl1.TREAT3_DT2 is not null then sl1.TREAT3_DT2
			when sl1.TREAT2_DT2 is not null then sl1.TREAT2_DT2
			else sl1.TREAT1_DT2
		end
	end, -- sl1.RETURN_DATE_LPU,
	sl.serie,
	(case when sl.DiagCode='' then sl1.DiagCode else sl.DiagCode end), isnull(sl.Vozrast,sl1.Vozrast), sl1.patid,
	(case when sl1.REASON1='01' then 1
	 when sl1.REASON1='02' then 2
	 when sl1.REASON1='03' then 3
	 when sl1.REASON1='05' then 5
	 when sl1.REASON1='08' then 8
	 when sl1.REASON1='09' then 9
	 else sl.REASON1 end), sl.cnt - 1, sl1.DUPLICATE_FLAG, sl.Open_in_other_LPU,
	(case when sl1.Closed_in_other_LPU = 1 then 1 else sl.Closed_in_other_LPU end) as Closed_in_other_LPU, sl1.PRIMARY_FLAG,
	(case when sl1.LN_EMPLOYER = '' then sl.LN_EMPLOYER else sl1.LN_EMPLOYER end) as LN_EMPLOYER,
	(case when REPLACE(sl1.Ceh, CHAR(13), '') = '' then sl.Ceh else REPLACE(sl1.Ceh, CHAR(13), '') end) as Ceh
	from sicklist as sl1
	inner join #sl101cc sl on sl1.next_ln_code = sl.ln_code
	inner join patform pf on pf.id=sl1.id
	where sl1.next_ln_code <> '' and Canceled = 0 and sl1.id not in (select id from #sl101cc)
	set @rcnt = @rcnt + @@rowcount

	-- дополнить набор листками с дубликатной связью
	if (@rcnt > 0)
	begin
		insert into #sl101cc (id, ln_code, prev_ln_code, next_ln_code, TREAT1_DT1, RETURN_DATE_LPU, serie, DiagCode, Vozrast, patid, REASON1, cnt, DUPLICATE_FLAG, Open_in_other_LPU, Closed_in_other_LPU, PRIMARY_FLAG, LN_EMPLOYER, Ceh)
		select sl1.id, sl1.ln_code, sl1.prev_ln_code, sl1.next_ln_code, sl1.TREAT1_DT1,
		case when sl1.Closed_in_other_LPU=0 then sl1.RETURN_DATE_LPU
		else
			case
				when sl1.RETURN_DATE_LPU is not null then sl1.RETURN_DATE_LPU
				when sl1.TREAT3_DT2 is not null then sl1.TREAT3_DT2
				when sl1.TREAT2_DT2 is not null then sl1.TREAT2_DT2
				else sl1.TREAT1_DT2
			end
		end, -- sl1.RETURN_DATE_LPU,
		sl.serie,
		(case when sl.DiagCode='' then sl1.DiagCode else sl.DiagCode end), isnull(sl.Vozrast, sl1.Vozrast), sl1.patid,
		(case when sl1.REASON1='01' then 1
		when sl1.REASON1='02' then 2
		when sl1.REASON1='03' then 3
		when sl1.REASON1='05' then 5
		when sl1.REASON1='08' then 8
		when sl1.REASON1='09' then 9
		else sl.REASON1 end) as REASON1, sl.cnt - 1, sl1.DUPLICATE_FLAG, sl.Open_in_other_LPU,
		(case when sl1.Closed_in_other_LPU = 1 then 1 else sl.Closed_in_other_LPU end) as Closed_in_other_LPU, sl1.PRIMARY_FLAG,
		(case when sl1.LN_EMPLOYER = '' then sl.LN_EMPLOYER else sl1.LN_EMPLOYER end) as LN_EMPLOYER,
		(case when REPLACE(sl1.Ceh, CHAR(13), '') = '' then sl.Ceh else REPLACE(sl1.Ceh, CHAR(13), '') end) as Ceh
		from sicklist as sl1
		inner join #sl101cc sl on sl.patid = sl1.patid and sl.TREAT1_DT1 = sl1.TREAT1_DT1 and sl.DiagCode=sl1.DiagCode -- листки дубликаты связываются с листком оригиналом по дате выдачи
		inner join patform pf on pf.id=sl1.id
		where Canceled = 0 -- листки которые дубликаты связаны с листками оригиналами
		and sl1.id not in (select id from #sl101cc)
	end
	-- все конечные из периода и их предки собраны
end

insert into #sl100cc select * from #sl101cc

insert into #Form16cc
select * 
from
(
select sl100.serie as Seriya, sl100.DateFrom,
(select top 1 dateadd(dd, @dateoffset, RETURN_DATE_LPU) from #sl100cc where serie = sl100.serie and cnt=sl100.LastLeaf) as DateTo, -- DateTo с максимального не дубликата
sl100.Age, p.Sex, sl100.LastDiagCode as DiagCode,
1 as Num, -- единичный случай нетрудоспособности
sl100.LastVid as Vid, -- поле для заполнения подвала отчета. строк уход за больным, беременность, санаторий ...
Open_in_other_LPU,
Closed_in_other_LPU,
(case when sl100.LN_EMPLOYER = '' then MestoRaboti else sl100.LN_EMPLOYER end) as MestoRaboti,
(case when sl100.Ceh = '' then REPLACE(p.Ceh, CHAR(13), '') else sl100.Ceh end) as Ceh,
(select top 1 id from #sl100cc where serie=sl100.serie and PRIMARY_FLAG=1 and TREAT1_DT1=(select MIN(TREAT1_DT1) from #sl100cc where serie=sl100.serie and PRIMARY_FLAG=1)) as FirstLn,
(select top 1 id from #sl100cc where serie = sl100.serie and cnt=sl100.LastLeaf) as LastLn
from (
select serie,
	(select top 1 cnt from #sl100cc ss where DUPLICATE_FLAG = 0 and ss.serie = sl00.serie order by cnt desc) as LastLeaf, -- последний листок серии, из него смотреть дату
	Min(TREAT1_DT1) as DateFrom,
	isnull((select top 1 Vozrast from #sl100cc ss where ss.Vozrast > 0 and ss.serie = sl00.serie order by Vozrast),0) as Age, -- первый наименьший возраст больше нуля
	isnull((select top 1 DiagCode from #sl100cc ss where DUPLICATE_FLAG = 0 and ss.DiagCode <> '' and ss.serie = sl00.serie order by cnt desc),'') as LastDiagCode, -- нужен последний не пустой диагноз, по не дубликатам (если в оригинале диагноза не было, то при техническом действии создания дубликата заниматься вопросами уточнения диагноза не будут)
	isnull((select top 1 REASON1 from #sl100cc ss where DUPLICATE_FLAG = 0 and ss.REASON1 <> 0 and ss.serie = sl00.serie order by cnt desc),0) as LastVid, -- последняя ненулевая причина нетрудоспособности
	Max(Open_in_other_LPU) as Open_in_other_LPU,
	Max(Closed_in_other_LPU) as Closed_in_other_LPU,
	isnull((select top 1 LN_EMPLOYER from #sl100cc ss where DUPLICATE_FLAG = 0 and ss.LN_EMPLOYER <> '' and ss.serie = sl00.serie order by cnt), '') as LN_EMPLOYER, -- первое не пустое место работы
	isnull((select top 1 Ceh from #sl100cc ss where DUPLICATE_FLAG = 0 and ss.Ceh <> '' and ss.serie = sl00.serie order by cnt), '') as Ceh, -- первый не пустой цех
	patid
from #sl100cc as sl00 group by serie, patid -- группировка по сериям - единичные случаи временной нетрудоспособности
) sl100 left join patient p on p.id=sl100.patid
--where sl100.LastDiagCode <> ''
) as tttt
where DateTo is not null and DateTo <= @d2 and (MestoRaboti=@CompanyForBrief or @CompanyForBrief='-1' or @PatId>0) and (Ceh=@Ceh or @Ceh='-1' or @PatId>0)
-- не нужны серии закончившиеся за периодом, или еще не закончившиеся
-- не нужны серии с пустым диагнозом  - диагноз у беременных может быть пустым (question)
-- условия на цех и место работы не должны "работать", если указан конкретный пациент

if OBJECT_ID('tempdb..#sl100cc') is not null
	drop table #sl100cc;

if OBJECT_ID('tempdb..#sl101cc') is not null
	drop table #sl101cc;
	
--select * from #Form16cc
end


