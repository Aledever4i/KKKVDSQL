

create view raspisanie_byuser
as
select u.name, r.name+' - '+u.name as raspisanie from raspisanie r, usr u
where 
  r.masterid=u.id and r.actual=1
  

