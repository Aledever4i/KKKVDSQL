CREATE FUNCTION fnStimInfo(@DrugResearch nvarchar(50) = null) --(@StimID int)
RETURNS @ResultTable TABLE
(
 [ID] int
,[Вид протокола] nvarchar(10) --длинный/короткий
,[Препарат ГнРГ] nvarchar(20)
,[Препарат ГТ] nvarchar(20)
,[Триггер] nvarchar(255)
,[Суммарная доза ФСГ] float
,[Стартовая доза исследуемого препарата] float
,[Суммарная доза исследуемого препарата] float
)
BEGIN

	-- препараты и дозы
	declare @stimmode table (masterid int, name nvarchar(50), dose float, divider int, factor int, startdose float)
	insert @stimmode
	select
	 masterid
	,(select top 1 text from (select * from dbo.fnDict('_StimModeDescr') union select * from dbo.fnDict('_StimMode1Descr')) as d where d.ID = StimModeId)
	 [name]
	,isnull([_1],0)+isnull([_2],0)+isnull([_3],0)+isnull([_4],0)+isnull([_5],0)+isnull([_6],0)+isnull([_7],0)+isnull([_8],0)+isnull([_9],0)+isnull([_10],0)+isnull([_11],0)+isnull([_12],0)+isnull([_13],0)+isnull([_14],0)+isnull([_15],0)+isnull([_16],0)+isnull([_17],0)+isnull([_18],0)+isnull([_19],0)+isnull([_20],0)+isnull([_21],0)+isnull([_22],0)+isnull([_23],0)+isnull([_24],0)+isnull([_25],0)+isnull([_26],0)+isnull([_27],0)+isnull([_28],0)
	 [dose]
	-- если доза >20, то это единицы; сложить за все дни, разделить на 75 = число ампул 
	,case when isnull([_1],0)>20 or isnull([_2],0)>20 or isnull([_3],0)>20 or isnull([_4],0)>20 or isnull([_5],0)>20 or isnull([_6],0)>20 or isnull([_7],0)>20 or isnull([_8],0)>20 or isnull([_9],0)>20 or isnull([_10],0)>20 or isnull([_11],0)>20 or isnull([_12],0)>20 or isnull([_13],0)>20 or isnull([_14],0)>20 or isnull([_15],0)>20 or isnull([_16],0)>20 or isnull([_17],0)>20 or isnull([_18],0)>20 or isnull([_19],0)>20 or isnull([_20],0)>20 or isnull([_21],0)>20 or isnull([_22],0)>20 or isnull([_23],0)>20 or isnull([_24],0)>20 or isnull([_25],0)>20 or isnull([_26],0)>20 or isnull([_27],0)>20 or isnull([_28],0)>20
		then 75
		else 1 end [divider]
	,1 [factor]
	,Coalesce(nullif(_1,0),nullif(_2,0),nullif(_3,0),nullif(_4,0),nullif(_5,0),nullif(_6,0),nullif(_7,0),nullif(_8,0),nullif(_9,0),nullif(_10,0),nullif(_11,0),nullif(_12,0),nullif(_13,0),nullif(_14,0),nullif(_15,0),nullif(_16,0),nullif(_17,0),nullif(_18,0),nullif(_19,0),nullif(_20,0),nullif(_21,0),nullif(_22,0),nullif(_23,0),nullif(_24,0),nullif(_25,0),nullif(_26,0),nullif(_27,0),nullif(_28,0)) [startdose]
	from ECFStimProto --where MasterID=@StimID

	update @stimmode set [factor]=2 where name='перговерис'
	
	INSERT INTO @ResultTable
	select
	 id
	,case when ExecDate <> ExecDateProto then 'длинный' else 'короткий' end

	,(select top 1 [name] from @stimmode where masterid=id and [name] in ('декапептил','диферелин','оргалутран','цетротид'))
	
	,case when (select count(*) from @stimmode where masterid=id and [name] 
		in ('менопур','гонал-Ф','пурегон','хумог','меногон', 'перговерис','мерионал','альтерпур'))>1 then 'комб' 
	 else (select top 1 [name] from @stimmode where masterid=id and [name] 
		in ('менопур','гонал-Ф','пурегон','хумог','меногон', 'перговерис','мерионал','альтерпур'))
	 end
	,HGComment
	-- если доза >20, то это единицы; сложить за все дни, разделить на 75 = число ампул 
	-- upd 20121127 для перговериса - сложение всех доз за все дни и умножение на 2
	,(select round(sum([dose]/[divider]*[factor]),1) from @stimmode where masterid=id and [name] 
		in ('менопур','гонал-Ф','пурегон','хумог','меногон', 'перговерис','мерионал','альтерпур'))

	,(select top 1 [startdose] from @stimmode where @DrugResearch is not null and masterid=id and [name] = @DrugResearch)
	,(select round(sum([dose]),1) from @stimmode where @DrugResearch is not null and masterid=id and [name] = @DrugResearch)
	from ECFStim --where id=@StimID
	RETURN

END
