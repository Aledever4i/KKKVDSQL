CREATE VIEW dbo.CrossPatForm
AS
SELECT     ParentID, ID AS ChildID
FROM         dbo.PatForm
WHERE     (ParentID IS NOT NULL)
