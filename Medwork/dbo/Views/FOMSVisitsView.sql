CREATE VIEW dbo.FOMSVisitsView
AS
SELECT     TOP (100) PERCENT pf.ID, pf.StatTalon, ISNULL(perv.Vrach, pov.Vrach) AS VrachId, COALESCE (napPerv.DataPriema, povPerv.DataPriema) AS DataPriema, 
                      COALESCE (perv.MestoObrasheniya, pov.MestoObrasheniya) AS TreatmentPlaceTypeId, COALESCE (CASE WHEN perv.DiagCode = '' THEN NULL 
                      ELSE perv.DiagCode END, CASE WHEN pov.DiagCode = '' THEN NULL ELSE pov.DiagCode END) AS DiagCode, 
                      COALESCE (CASE WHEN perv.SopDiagCode = '' THEN NULL ELSE perv.SopDiagCode END, CASE WHEN pov.SopDiagCode = '' THEN NULL 
                      ELSE pov.SopDiagCode END) AS SopDiagCode, COALESCE (CASE WHEN perv.NomGospit IS NOT NULL AND perv.NomGospit <> '' THEN perv.NomGospit ELSE NULL 
                      END, CASE WHEN pov.NomGospit IS NOT NULL AND pov.NomGospit <> '' THEN pov.NomGospit ELSE NULL END) AS NomGospit, 
                      CASE WHEN LEFT(COALESCE (perv.DiagCode, pov.DiagCode), 1) = 'Z' THEN 2 ELSE 1 END AS DiagCodeTypeId, pov.DinamikaZabolev, 
                      COALESCE (napPerv.VremyaPriema, povPerv.VremyaPriema) AS VremyaPriema
FROM         dbo.PatForm AS pf LEFT OUTER JOIN
                      dbo.PervichniyPriemDermatologa AS perv ON perv.ID = pf.ID AND pf.FormID = 31084 LEFT OUTER JOIN
                      dbo.Napravlenie AS napPerv ON napPerv.OsmotrFormID = perv.ID LEFT OUTER JOIN
                      dbo.PovtorniyPriemDermatologa AS pov ON pov.ID = pf.ID AND pf.FormID = 31177 LEFT OUTER JOIN
                      dbo.Napravlenie AS povPerv ON povPerv.OsmotrFormID = perv.ID
WHERE     (NULLIF (pf.StatTalon, - 1) IS NOT NULL)
ORDER BY ISNULL(perv.Data, pov.Data)

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[26] 4[34] 2[21] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "pf"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "perv"
            Begin Extent = 
               Top = 6
               Left = 236
               Bottom = 114
               Right = 534
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "napPerv"
            Begin Extent = 
               Top = 6
               Left = 572
               Bottom = 114
               Right = 740
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "pov"
            Begin Extent = 
               Top = 6
               Left = 778
               Bottom = 114
               Right = 990
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "povPerv"
            Begin Extent = 
               Top = 6
               Left = 1028
               Bottom = 114
               Right = 1196
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 7650
         Alias = 2355
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1905
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'FOMSVisitsView';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'   End
End
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'FOMSVisitsView';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'FOMSVisitsView';

