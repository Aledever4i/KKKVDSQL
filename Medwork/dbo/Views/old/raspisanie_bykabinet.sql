
create view raspisanie_bykabinet
as
select distinct d.name+' - '+r.name as name, r.name+' - '+d.name as raspisanie from raspisanie r, kablist d
where 
  r.deptid=d.id and r.actual=1
  

