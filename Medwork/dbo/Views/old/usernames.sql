create view usernames
as
select ID, Name from usr
union 
select 0, ''
