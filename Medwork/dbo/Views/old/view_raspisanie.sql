
create view view_raspisanie
as
select distinct name from raspisanie
where actual=1
