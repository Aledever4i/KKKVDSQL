
create view deptlist as
select * from dept
where 
  ((parentid=0) or (parentid is null)) and (nodetype='FOLDER') and
  ((dbo.fnGetProfileParam(1,'AllowedDepts')='') or 
  (','+dbo.fnGetProfileParam(1,'AllowedDepts')+',' like '%,'+LTRIM(STR(ID))+',%'))
