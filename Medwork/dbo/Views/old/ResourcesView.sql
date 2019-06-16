CREATE VIEW [dbo].[ResourcesView]
AS
SELECT     ID, NULL AS MasterID, LinkedResource, 1 AS Type, ID AS UsrID, NULL AS RoomID, Name, NULL AS Color, NULL AS AppointmentForm,
	Specialitie as UsrJob, DeptID as UsrDept, Attendance as CanSchedule
FROM         Usr WHERE IsMedPersonnel = 1
UNION
SELECT     - ID, NULL AS MasterID, NULL AS LinkedResource, 2 AS Type, NULL AS UsrID, ID AS RoomID, Name, NULL AS Color, NULL AS AppointmentForm,
	NULL as UsrJob, parentid as UsrDept, 0
FROM         dept
WHERE     DeptTypeId = 2
union
SELECT     - ID, -ParentID AS MasterID, NULL AS LinkedResource, 3 AS Type, NULL AS UsrID, ID AS RoomID, Name, NULL AS Color, NULL AS AppointmentForm,
	NULL as UsrJob, NULL as UsrDept, 0
FROM         dept d1
WHERE     DeptTypeId = 4 and (select top 1 d2.DeptTypeId from dept d2 where d2.ID=d1.ParentID)=2