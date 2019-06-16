create view kablist as
select * from dept
where 
  (NODETYPE<>'FOLDER') and
  (parentid=0 or  parentid in (select ID from deptlist))
