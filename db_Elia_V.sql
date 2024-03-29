USE [master]
GO
/****** Object:  Database [FlappyBird]    Script Date: 25/03/2014 09.15.49 ******/
CREATE DATABASE [FlappyBird]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FlappyBird', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.ELIA_SQL\MSSQL\DATA\FlappyBird.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'FlappyBird_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.ELIA_SQL\MSSQL\DATA\FlappyBird_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [FlappyBird] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FlappyBird].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FlappyBird] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FlappyBird] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FlappyBird] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FlappyBird] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FlappyBird] SET ARITHABORT OFF 
GO
ALTER DATABASE [FlappyBird] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FlappyBird] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [FlappyBird] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FlappyBird] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FlappyBird] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FlappyBird] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FlappyBird] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FlappyBird] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FlappyBird] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FlappyBird] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FlappyBird] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FlappyBird] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FlappyBird] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FlappyBird] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FlappyBird] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FlappyBird] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FlappyBird] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FlappyBird] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FlappyBird] SET RECOVERY FULL 
GO
ALTER DATABASE [FlappyBird] SET  MULTI_USER 
GO
ALTER DATABASE [FlappyBird] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FlappyBird] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FlappyBird] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FlappyBird] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'FlappyBird', N'ON'
GO
USE [FlappyBird]
GO
/****** Object:  User [flappybird]    Script Date: 25/03/2014 09.15.49 ******/
CREATE USER [flappybird] FOR LOGIN [flappybird] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [flappybird]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [flappybird]
GO
/****** Object:  Table [dbo].[Scores]    Script Date: 25/03/2014 09.15.49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Scores](
	[ScoreId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](16) NOT NULL,
	[Score] [int] NOT NULL,
	[Timestamp] [datetime] NOT NULL,
 CONSTRAINT [PK_Scores] PRIMARY KEY CLUSTERED 
(
	[ScoreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[topFive]    Script Date: 25/03/2014 09.15.50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[topFive]
AS
SELECT        TOP (5) Username, Score, Timestamp
FROM            dbo.Scores
ORDER BY Score DESC

GO
ALTER TABLE [dbo].[Scores] ADD  CONSTRAINT [DF_Scores_Timestamp]  DEFAULT (getdate()) FOR [Timestamp]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[11] 3) )"
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
         Begin Table = "Scores"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
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
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'topFive'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'topFive'
GO
USE [master]
GO
ALTER DATABASE [FlappyBird] SET  READ_WRITE 
GO
