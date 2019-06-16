
CREATE PROCEDURE [dbo].[CopyDiagnoses]
@NewDocID INT, @PatID INT
AS
declare @t table(
	[ID] [int] NOT NULL,
	[PatID] [int] NULL,
	[MasterID] [int] NULL,
	[Text] [ntext] NULL,
	[CodeMkb10] [nvarchar](8) NULL,
	[DiagType] [int] NULL,
	[SetDate] [datetime] NULL,
	[UnsetDate] [datetime] NULL,
	[SetDoctor] [int] NULL,
	[UnsetDoctor] [int] NULL,
	[Unset] [nvarchar](1) NULL,
	[DiagKind] [int] NULL
)

insert @t
select 
	[ID],
	[PatID],
	[MasterID],
	[Text],
	[CodeMkb10],
	[DiagType],
	[SetDate],
	[UnsetDate],
	[SetDoctor],
	[UnsetDoctor],
	[Unset],
	[DiagKind]
from Diagnosis 
where MasterID=(
select top 1 id from(
select id from OsmotrSpecialistaPer where PatID=@PatID and ID<@NewDocID
union all select id from OsmotrSpetsialistaPovtorniy where PatID=@PatID and ID<@NewDocID
) a
order by ID desc) and (Unset is null or Unset<>'+')

update @t set MasterID=@NewDocID

declare c cursor for select id from @t
declare @oid int
declare @nid int
set @nid=(select isnull(MAX(id),0)+1 from Diagnosis)
open c
fetch next from c into @oid
while(@@FETCH_STATUS=0)
begin
	--insert DocumentID default values
	--set @nid=scope_identity()
	--delete DocumentID where id=@nid
	--нельзя, пересекается с тем что exe вставляет через "select max id + 1"
	update @t set ID=@nid where ID=@oid	
	fetch next from c into @oid
	set @nid=@nid+1
end
close c
deallocate c

insert Diagnosis
(
	[ID],
	[PatID],
	[MasterID],
	[Text],
	[CodeMkb10],
	[DiagType],
	[SetDate],
	[UnsetDate],
	[SetDoctor],
	[UnsetDoctor],
	[Unset],
	[DiagKind]
)
 select 
	[ID],
	[PatID],
	[MasterID],
	[Text],
	[CodeMkb10],
	[DiagType],
	[SetDate],
	[UnsetDate],
	[SetDoctor],
	[UnsetDoctor],
	[Unset],
	[DiagKind]
from @t

