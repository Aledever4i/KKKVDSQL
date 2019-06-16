
create procedure [dbo].[spCreateBillonServAll]
  @patid int,
  @usrid int,
  @paytype int = -1
as
begin
  declare @dt datetime
  set @dt=DATEADD(DAY, DATEDIFF(day, 0, GETDATE()), 0) --получаем текущую даты, чтобы работало и в mssql2005
  declare @t table(id int, gid nvarchar(32));
  insert into @t (id, gid)
  select n.id, aps.guid
  from appointmentservice aps with(nolock)
  inner join napravlenie n on n.id=aps.masterid
  where n.patid=@patid and
        n.datapriema=@dt and (aps.guid not in (select bs.guid from billservice bs with(nolock) inner join bill b on b.id=bs.masterid))
        and (aps.PaymentType<>@paytype)

  declare @gid varchar(32)
  set @gid = (select isnull((select top(1) gid from @t where id=(select top(1) id from @t group by id order by id)),'-1'))
  
  if @gid<>'-1' begin
    declare @id int, @blid int
    set @blid = -1
    declare id_cursor cursor for select id from @t group by id order by id
  
    open id_cursor
  
    fetch next from id_cursor
    into @id

    while @@fetch_status = 0
    begin
      if @blid=-1 set @blid=(select isnull((select b.id from bill b inner join billservice bs with(nolock) on bs.masterid=b.id where bs.guid=@gid),-1))
      exec convertservicesdata 'appointment', @id, 'bill', @blid, 0, @patid, @usrid, @dt, null, null, null,null
  
      fetch next from id_cursor 
      into @id
    end
    close id_cursor
    deallocate id_cursor
    exec spSetVariable 'CrtBlServAll', 1
  end
  else
    exec spSetVariable 'CrtBlServAll', 0
end
