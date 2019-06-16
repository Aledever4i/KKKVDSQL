
create view view_users
as
select 
  u.ID as [Код],
  u.Name as [ФИО],
  d.Name as [Отдел],
  ug.Name as [Группа],
  Job as [Должность],
  (SELECT TOP 1 d.Name From Raspisanie r, Dept d
   WHERE 
     r.DeptID=d.ID and r.MasterID=u.ID) as [Кабинет],
  u.GroupID as [GroupID],
  u.DeptID as [DeptID]
  
from
  Usr u LEFT JOIN Dept d ON u.DeptID=d.ID 
        LEFT JOIN UsrGroup ug ON u.GroupID=ug.GroupID
         
