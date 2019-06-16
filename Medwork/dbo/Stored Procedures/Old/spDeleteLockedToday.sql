
create procedure spDeleteLockedToday
as
delete from napravlenie
where
  patid is null
and masterid is null
and DataPriema=dbo.fnDate(GetDate())
