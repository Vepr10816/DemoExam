/*    ==Параметры сценариев==

    Версия исходного сервера : SQL Server 2017 (14.0.1000)
    Выпуск исходного ядра СУБД : Выпуск Microsoft SQL Server Enterprise Edition
    Тип исходного ядра СУБД : Изолированный SQL Server

    Версия целевого сервера : SQL Server 2017
    Выпуск целевого ядра СУБД : Выпуск Microsoft SQL Server Standard Edition
    Тип целевого ядра СУБД : Изолированный SQL Server
*/
USE [master]
GO
/****** Object:  Database [Piter_Retail_DB]    Script Date: 19.05.2023 3:51:54 ******/
CREATE DATABASE [Piter_Retail_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Piter_Retail_DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Piter_Retail_DB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Piter_Retail_DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Piter_Retail_DB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Piter_Retail_DB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Piter_Retail_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Piter_Retail_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Piter_Retail_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Piter_Retail_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Piter_Retail_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Piter_Retail_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [Piter_Retail_DB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Piter_Retail_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Piter_Retail_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Piter_Retail_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Piter_Retail_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Piter_Retail_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Piter_Retail_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Piter_Retail_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Piter_Retail_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Piter_Retail_DB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Piter_Retail_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Piter_Retail_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Piter_Retail_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Piter_Retail_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Piter_Retail_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Piter_Retail_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Piter_Retail_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Piter_Retail_DB] SET RECOVERY FULL 
GO
ALTER DATABASE [Piter_Retail_DB] SET  MULTI_USER 
GO
ALTER DATABASE [Piter_Retail_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Piter_Retail_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Piter_Retail_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Piter_Retail_DB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Piter_Retail_DB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Piter_Retail_DB', N'ON'
GO
ALTER DATABASE [Piter_Retail_DB] SET QUERY_STORE = OFF
GO
USE [Piter_Retail_DB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Piter_Retail_DB]
GO
/****** Object:  Table [dbo].[Data]    Script Date: 19.05.2023 3:51:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Data](
	[ID_Data] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Price] [money] NOT NULL,
	[AmountOfFuel] [bigint] NOT NULL,
	[Station_ID] [int] NOT NULL,
 CONSTRAINT [PK_Data] PRIMARY KEY CLUSTERED 
(
	[ID_Data] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Station]    Script Date: 19.05.2023 3:51:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Station](
	[ID_Station] [int] IDENTITY(1,1) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Station] PRIMARY KEY CLUSTERED 
(
	[ID_Station] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Data] ON 

INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (1, N'92', 44.0900, 43360, 1)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (2, N'95', 47.6700, 50149, 1)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (3, N'98', 56.2000, 17943, 1)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (4, N'Disel Fuel', 48.5000, 30075, 1)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (5, N'92', 44.4500, 56531, 2)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (6, N'95', 47.8500, 81209, 2)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (7, N'98', 56.0900, 49249, 2)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (8, N'Disel Fuel', 49.6900, 82789, 2)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (9, N'92', 42.4000, 79325, 3)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (10, N'95', 44.8500, 83131, 3)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (11, N'98', 51.6000, 30789, 3)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (12, N'Disel Fuel', 51.8000, 88761, 3)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (13, N'92', 43.2000, 56700, 4)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (14, N'95', 46.7000, 32636, 4)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (15, N'98', 54.6100, 10652, 4)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (16, N'Disel Fuel', 49.9000, 60992, 4)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (17, N'92', 43.8300, 29172, 5)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (18, N'95', 47.7000, 47850, 5)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (19, N'98', 53.1500, 8886, 5)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (20, N'Disel Fuel', 47.4000, 28755, 5)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (21, N'92', 43.5000, 17449, 6)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (22, N'95', 47.9400, 48202, 6)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (23, N'98', 54.0900, 21610, 6)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (24, N'Disel Fuel', 47.6000, 17762, 6)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (25, N'92', 41.5000, 9900, 7)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (26, N'95', 44.3000, 91094, 7)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (27, N'98', 54.8600, 98166, 7)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (28, N'Disel Fuel', 49.0000, 11188, 7)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (29, N'92', 43.2000, 76823, 8)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (30, N'95', 46.7000, 96618, 8)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (31, N'98', 54.6100, 61735, 8)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (32, N'Disel Fuel', 49.9000, 14212, 8)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (33, N'92', 42.5500, 65759, 9)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (34, N'95', 45.1000, 14877, 9)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (35, N'98', 53.1700, 90600, 9)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (36, N'Disel Fuel', 50.0500, 27447, 9)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (37, N'92', 43.0500, 83814, 10)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (38, N'95', 46.8700, 54379, 10)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (39, N'98', 54.2800, 85304, 10)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (40, N'Disel Fuel', 48.3900, 90719, 10)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (41, N'92', 45.3400, 71635, 11)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (42, N'95', 48.9400, 3964, 11)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (43, N'98', 56.1600, 14830, 11)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (44, N'Disel Fuel', 47.7500, 12456, 11)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (45, N'92', 43.3500, 36193, 12)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (46, N'95', 44.8500, 39307, 12)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (47, N'98', 54.9800, 95846, 12)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (48, N'Disel Fuel', 48.6000, 69859, 12)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (49, N'92', 45.0700, 3898, 13)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (50, N'95', 47.9200, 3637, 13)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (51, N'98', 54.6100, 77828, 13)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (52, N'Disel Fuel', 51.4100, 70496, 13)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (53, N'92', 44.8000, 3782, 14)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (54, N'95', 48.4500, 54395, 14)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (55, N'98', 54.2100, 21082, 14)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (56, N'Disel Fuel', 48.0000, 96594, 14)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (57, N'92', 45.0900, 27700, 15)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (58, N'95', 48.5500, 93404, 15)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (59, N'98', 54.2200, 36796, 15)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (60, N'Disel Fuel', 48.7600, 79144, 15)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (61, N'92', 43.9800, 33954, 16)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (62, N'95', 48.3000, 30117, 16)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (63, N'98', 53.5100, 84952, 16)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (64, N'Disel Fuel', 48.3900, 32538, 16)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (65, N'92', 44.0900, 60327, 17)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (66, N'95', 47.6700, 17685, 17)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (67, N'98', 56.2000, 39562, 17)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (68, N'Disel Fuel', 48.5000, 8925, 17)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (69, N'92', 44.4900, 72769, 18)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (70, N'95', 47.8500, 63241, 18)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (71, N'98', 56.0900, 59468, 18)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (72, N'Disel Fuel', 49.6900, 82861, 18)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (73, N'92', 42.4000, 53178, 19)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (74, N'95', 44.8500, 87751, 19)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (75, N'98', 51.6000, 86745, 19)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (76, N'Disel Fuel', 51.8000, 26554, 19)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (77, N'92', 43.2000, 88314, 20)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (78, N'95', 46.7000, 45723, 20)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (79, N'98', 54.6100, 81765, 20)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (80, N'Disel Fuel', 49.9000, 92130, 20)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (81, N'92', 43.8300, 61919, 21)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (82, N'95', 47.7000, 50845, 21)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (83, N'98', 53.1500, 32344, 21)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (84, N'Disel Fuel', 47.4000, 3480, 21)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (85, N'92', 43.5000, 16383, 22)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (86, N'95', 47.9400, 41286, 22)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (87, N'98', 54.0900, 75068, 22)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (88, N'Disel Fuel', 47.6000, 41868, 22)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (89, N'92', 41.5000, 97689, 23)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (90, N'95', 44.3000, 60473, 23)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (91, N'98', 54.8600, 11558, 23)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (92, N'Disel Fuel', 49.0000, 4643, 23)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (93, N'92', 43.2000, 17468, 24)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (94, N'95', 46.7000, 71227, 24)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (95, N'98', 54.6100, 50941, 24)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (96, N'Disel Fuel', 49.9000, 28775, 24)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (97, N'92', 42.5500, 79721, 25)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (98, N'95', 45.1000, 3666, 25)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (99, N'98', 53.1700, 52222, 25)
GO
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (100, N'Disel Fuel', 50.0500, 68280, 25)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (101, N'92', 43.0500, 90955, 26)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (102, N'95', 46.8700, 83789, 26)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (103, N'98', 54.2800, 50723, 26)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (104, N'Disel Fuel', 48.3900, 74784, 26)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (105, N'92', 45.3400, 26404, 27)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (106, N'95', 48.9400, 50604, 27)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (107, N'98', 56.1600, 15978, 27)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (108, N'Disel Fuel', 47.7500, 6626, 27)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (109, N'92', 43.3500, 55875, 28)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (110, N'95', 44.8500, 13526, 28)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (111, N'98', 54.9800, 39670, 28)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (112, N'Disel Fuel', 48.6000, 24615, 28)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (113, N'92', 45.0700, 73637, 29)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (114, N'95', 47.9200, 52445, 29)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (115, N'98', 54.6100, 17268, 29)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (116, N'Disel Fuel', 51.4100, 57977, 29)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (117, N'92', 44.8000, 7799, 30)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (118, N'95', 48.4500, 20706, 30)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (119, N'98', 54.2100, 94241, 30)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (120, N'Disel Fuel', 48.0000, 68943, 30)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (121, N'92', 45.0900, 76260, 31)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (122, N'95', 48.5500, 5384, 31)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (123, N'98', 54.2200, 49159, 31)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (124, N'Disel Fuel', 48.7600, 41856, 31)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (125, N'92', 43.9800, 16997, 32)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (126, N'95', 48.3000, 99594, 32)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (127, N'98', 53.5100, 32211, 32)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (128, N'Disel Fuel', 48.3900, 85052, 32)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (129, N'92', 44.0900, 61330, 33)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (130, N'95', 47.6700, 98916, 33)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (131, N'98', 56.2000, 43490, 33)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (132, N'Disel Fuel', 48.5000, 51732, 33)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (133, N'92', 44.4900, 55584, 34)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (134, N'95', 47.8500, 85515, 34)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (135, N'98', 56.0900, 76949, 34)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (136, N'Disel Fuel', 49.6900, 30617, 34)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (137, N'92', 42.4000, 70698, 35)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (138, N'95', 44.8500, 32230, 35)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (139, N'98', 51.6000, 39864, 35)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (140, N'Disel Fuel', 51.8000, 46044, 35)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (141, N'92', 43.2000, 87502, 36)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (142, N'95', 46.7000, 46765, 36)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (143, N'98', 54.6100, 49376, 36)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (144, N'Disel Fuel', 49.9000, 77488, 36)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (145, N'92', 43.8300, 70034, 37)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (146, N'95', 47.7000, 33717, 37)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (147, N'98', 53.1500, 95560, 37)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (148, N'Disel Fuel', 47.4000, 45379, 37)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (149, N'92', 43.5000, 77598, 38)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (150, N'95', 47.9400, 23323, 38)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (151, N'98', 54.0900, 38030, 38)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (152, N'Disel Fuel', 47.6000, 54232, 38)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (153, N'92', 41.5000, 64324, 39)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (154, N'95', 44.3000, 43383, 39)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (155, N'98', 54.8600, 11111, 39)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (156, N'Disel Fuel', 49.0000, 88701, 39)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (157, N'92', 43.2000, 35792, 40)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (158, N'95', 46.7000, 45594, 40)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (159, N'98', 54.6100, 86159, 40)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (160, N'Disel Fuel', 49.9000, 69827, 40)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (161, N'92', 42.5500, 61411, 41)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (162, N'95', 45.1000, 74703, 41)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (163, N'98', 53.1700, 23333, 41)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (164, N'Disel Fuel', 50.0500, 44951, 41)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (165, N'92', 43.0500, 35959, 42)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (166, N'95', 46.8700, 44347, 42)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (167, N'98', 54.2800, 22941, 42)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (168, N'Disel Fuel', 48.3900, 98157, 42)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (169, N'92', 45.3400, 68985, 43)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (170, N'95', 48.9400, 81901, 43)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (171, N'98', 56.1600, 82004, 43)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (172, N'Disel Fuel', 47.7500, 39685, 43)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (173, N'92', 43.3500, 62310, 44)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (174, N'95', 44.8500, 75340, 44)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (175, N'98', 54.9800, 98162, 44)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (176, N'Disel Fuel', 48.6000, 15447, 44)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (177, N'92', 45.0700, 36741, 45)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (178, N'95', 47.9200, 95742, 45)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (179, N'98', 54.6100, 41024, 45)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (180, N'Disel Fuel', 51.4100, 94751, 45)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (181, N'92', 44.8000, 93686, 46)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (182, N'95', 48.4500, 75305, 46)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (183, N'98', 54.2100, 18799, 46)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (184, N'Disel Fuel', 48.0000, 18829, 46)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (185, N'92', 45.0900, 93265, 47)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (186, N'95', 48.5500, 5457, 47)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (187, N'98', 54.2200, 83114, 47)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (188, N'Disel Fuel', 48.7600, 44985, 47)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (189, N'92', 127.0000, 1234, 48)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (190, N'95', 125.0000, 1235, 48)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (191, N'92', 92.0000, 92, 49)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (192, N'95', 95.0000, 95, 49)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (193, N'98', 98.0000, 98, 49)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (194, N'Disel Fuel', 90.0000, 90, 49)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (195, N'92', 44.0800, 43360, 50)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (196, N'95', 47.6700, 50149, 50)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (197, N'98', 56.2000, 17943, 50)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (198, N'Disel Fuel', 48.5000, 30075, 50)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (199, N'92', 44.0800, 43360, 51)
GO
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (200, N'95', 47.6700, 50149, 51)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (201, N'98', 56.2000, 17943, 51)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (202, N'Disel Fuel', 48.5000, 30075, 51)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (203, N'92', 44.0800, 43360, 52)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (204, N'95', 47.6700, 50149, 52)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (205, N'98', 56.2000, 17943, 52)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (206, N'Disel Fuel', 48.5000, 30075, 52)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (207, N'92', 44.0800, 43360, 1)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (208, N'95', 47.6700, 50149, 1)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (209, N'98', 56.2000, 17943, 1)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (210, N'Disel Fuel', 48.5000, 30075, 1)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (211, N'92', 44.0800, 43360, 1)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (212, N'95', 47.6700, 50149, 1)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (213, N'98', 56.2000, 17943, 1)
INSERT [dbo].[Data] ([ID_Data], [Name], [Price], [AmountOfFuel], [Station_ID]) VALUES (214, N'Disel Fuel', 48.5000, 30075, 1)
SET IDENTITY_INSERT [dbo].[Data] OFF
SET IDENTITY_INSERT [dbo].[Station] ON 

INSERT [dbo].[Station] ([ID_Station], [Address]) VALUES (1, N'г. Санкт-Петербург, Богатырский проспект, 23
')
INSERT [dbo].[Station] ([ID_Station], [Address]) VALUES (2, N'г. Санкт-Петербург, Витебский проспект, 9к2 литера А
')
INSERT [dbo].[Station] ([ID_Station], [Address]) VALUES (3, N'г. Санкт-Петербург, Витебский проспект, 153')
INSERT [dbo].[Station] ([ID_Station], [Address]) VALUES (4, N'г. Санкт-Петербург, Витебский проспект, 157')
INSERT [dbo].[Station] ([ID_Station], [Address]) VALUES (5, N'г. Санкт-Петербург, Выборгская набережная, 57')
INSERT [dbo].[Station] ([ID_Station], [Address]) VALUES (6, N'г. Санкт-Петербург, Выборгское шоссе, 6 Б,лит А')
INSERT [dbo].[Station] ([ID_Station], [Address]) VALUES (7, N'г. Санкт-Петербург, Дальневосточный проспект, 20')
INSERT [dbo].[Station] ([ID_Station], [Address]) VALUES (8, N'г. Санкт-Петербург, ул. Десантников, 13')
INSERT [dbo].[Station] ([ID_Station], [Address]) VALUES (9, N'г. Санкт-Петербург, Ириновский проспект, 16')
INSERT [dbo].[Station] ([ID_Station], [Address]) VALUES (10, N'г. Санкт-Петербург, ул. Коллонтай, 8')
INSERT [dbo].[Station] ([ID_Station], [Address]) VALUES (11, N'г. Санкт-Петербург, Коломяжский проспект, 19')
INSERT [dbo].[Station] ([ID_Station], [Address]) VALUES (12, N'г. Санкт-Петербург, ул. Коммуны, 14 литер А')
INSERT [dbo].[Station] ([ID_Station], [Address]) VALUES (13, N'г. Санкт-Петербург, Лапинский проспект, 10')
INSERT [dbo].[Station] ([ID_Station], [Address]) VALUES (14, N'г. Санкт-Петербург, Лахтинский проспект, 2к4')
INSERT [dbo].[Station] ([ID_Station], [Address]) VALUES (15, N'г. Санкт-Петербург, Лахтинский проспект, 114')
INSERT [dbo].[Station] ([ID_Station], [Address]) VALUES (16, N'г. Санкт-Петербург, Ленинский проспект, 61')
INSERT [dbo].[Station] ([ID_Station], [Address]) VALUES (17, N'г. Санкт-Петербург, Малый проспект, 79')
INSERT [dbo].[Station] ([ID_Station], [Address]) VALUES (18, N'г. Санкт-Петербург, Московское шоссе, М10, слева')
INSERT [dbo].[Station] ([ID_Station], [Address]) VALUES (19, N'г. Санкт-Петербург, Московское шоссе, 11, лит.А, М10, справа')
INSERT [dbo].[Station] ([ID_Station], [Address]) VALUES (20, N'г. Санкт-Петербург, Московское шоссе, 50, М10, 687-й км, слева')
INSERT [dbo].[Station] ([ID_Station], [Address]) VALUES (21, N'г. Санкт-Петербург, Московское шоссе, М10, слева')
INSERT [dbo].[Station] ([ID_Station], [Address]) VALUES (22, N'г. Санкт-Петербург, Московское шоссе, 156 А, М10, слева')
INSERT [dbo].[Station] ([ID_Station], [Address]) VALUES (23, N'г. Санкт-Петербург, Октябрьская набережная, 38, корп.3')
INSERT [dbo].[Station] ([ID_Station], [Address]) VALUES (24, N'г. Санкт-Петербург, Песочная набережная, 30')
INSERT [dbo].[Station] ([ID_Station], [Address]) VALUES (25, N'г. Санкт-Петербург, Пискарёвский проспект, 135')
INSERT [dbo].[Station] ([ID_Station], [Address]) VALUES (26, N'г. Санкт-Петербург, Приморское шоссе, 142')
INSERT [dbo].[Station] ([ID_Station], [Address]) VALUES (27, N'г. Санкт-Петербург, Приморское шоссе, 251')
INSERT [dbo].[Station] ([ID_Station], [Address]) VALUES (28, N'г. Санкт-Петербург, промзона «Парнас», 1-й верхний переулок, 3А')
INSERT [dbo].[Station] ([ID_Station], [Address]) VALUES (29, N'г. Санкт-Петербург, проспект Маршала Жукова, 23 литер А')
INSERT [dbo].[Station] ([ID_Station], [Address]) VALUES (30, N'г. Санкт-Петербург, проспект Обуховской обороны, 138')
INSERT [dbo].[Station] ([ID_Station], [Address]) VALUES (31, N'г. Санкт-Петербург, проспект Энгельса, 179')
INSERT [dbo].[Station] ([ID_Station], [Address]) VALUES (32, N'г. Санкт-Петербург, Пулковское шоссе, 71, Р23, справа')
INSERT [dbo].[Station] ([ID_Station], [Address]) VALUES (33, N'г. Санкт-Петербург, ул. Руставели, 48А')
INSERT [dbo].[Station] ([ID_Station], [Address]) VALUES (34, N'г. Санкт-Петербург, ул. Руставели, 54')
INSERT [dbo].[Station] ([ID_Station], [Address]) VALUES (35, N'г. Санкт-Петербург, Рябовское шоссе, 115 к. 3, лит. А, а/д «Санкт-Петербург - станция Морье» (А128), справа')
INSERT [dbo].[Station] ([ID_Station], [Address]) VALUES (36, N'г. Санкт-Петербург, ул. Салова, 82')
INSERT [dbo].[Station] ([ID_Station], [Address]) VALUES (37, N'г. Санкт-Петербург, ул. Седова, 1')
INSERT [dbo].[Station] ([ID_Station], [Address]) VALUES (38, N'г. Санкт-Петербург, ул. Софийская')
INSERT [dbo].[Station] ([ID_Station], [Address]) VALUES (39, N'г. Санкт-Петербург, Софийская ул., 17А')
INSERT [dbo].[Station] ([ID_Station], [Address]) VALUES (40, N'г. Санкт-Петербург, Софийская ул., 60')
INSERT [dbo].[Station] ([ID_Station], [Address]) VALUES (41, N'г. Санкт-Петербург, Софийская ул., 77')
INSERT [dbo].[Station] ([ID_Station], [Address]) VALUES (42, N'г. Санкт-Петербург, Торфяная дорога, 10 литер А')
INSERT [dbo].[Station] ([ID_Station], [Address]) VALUES (43, N'г. Санкт-Петербург, ул. Демьяна Бедного, 15')
INSERT [dbo].[Station] ([ID_Station], [Address]) VALUES (44, N'г. Санкт-Петербург, ул. Планерная, 22')
INSERT [dbo].[Station] ([ID_Station], [Address]) VALUES (45, N'г. Санкт-Петербург, ул. Студенческая, 15')
INSERT [dbo].[Station] ([ID_Station], [Address]) VALUES (46, N'г. Санкт-Петербург, Шафировский проспект, 24А')
INSERT [dbo].[Station] ([ID_Station], [Address]) VALUES (47, N'пос. Шушары, Пулковское шоссе, д. 110, лит. А, Р23, слева')
INSERT [dbo].[Station] ([ID_Station], [Address]) VALUES (48, N'Новый адрес')
INSERT [dbo].[Station] ([ID_Station], [Address]) VALUES (49, N'Новый адрес 2
')
INSERT [dbo].[Station] ([ID_Station], [Address]) VALUES (50, N'г. Санкт-Петербург, Богатырский проспект, 23г. Санкт-Петербург, Богатырский проспект, 23
')
INSERT [dbo].[Station] ([ID_Station], [Address]) VALUES (51, N'г. Санкт-Петербург, Богатырский проспект, 23
')
INSERT [dbo].[Station] ([ID_Station], [Address]) VALUES (52, N'г. Санкт-Петербург, Богатырский проспект, 23
')
SET IDENTITY_INSERT [dbo].[Station] OFF
ALTER TABLE [dbo].[Data]  WITH CHECK ADD  CONSTRAINT [FK_Data_Station] FOREIGN KEY([Station_ID])
REFERENCES [dbo].[Station] ([ID_Station])
GO
ALTER TABLE [dbo].[Data] CHECK CONSTRAINT [FK_Data_Station]
GO
USE [master]
GO
ALTER DATABASE [Piter_Retail_DB] SET  READ_WRITE 
GO
