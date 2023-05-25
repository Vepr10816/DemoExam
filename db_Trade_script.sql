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
/****** Object:  Database [Trade]    Script Date: 25.05.2023 18:55:21 ******/
CREATE DATABASE [Trade]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Trade', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Trade.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Trade_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Trade_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Trade] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Trade].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Trade] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Trade] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Trade] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Trade] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Trade] SET ARITHABORT OFF 
GO
ALTER DATABASE [Trade] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Trade] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Trade] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Trade] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Trade] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Trade] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Trade] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Trade] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Trade] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Trade] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Trade] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Trade] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Trade] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Trade] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Trade] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Trade] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Trade] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Trade] SET RECOVERY FULL 
GO
ALTER DATABASE [Trade] SET  MULTI_USER 
GO
ALTER DATABASE [Trade] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Trade] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Trade] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Trade] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Trade] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Trade', N'ON'
GO
ALTER DATABASE [Trade] SET QUERY_STORE = OFF
GO
USE [Trade]
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
USE [Trade]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 25.05.2023 18:55:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderStatus] [nvarchar](max) NOT NULL,
	[OrderDeliveryDate] [datetime] NOT NULL,
	[UserID] [int] NULL,
	[OrderPickupPoint] [int] NOT NULL,
 CONSTRAINT [PK__Order__C3905BAFBC4E5ED9] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 25.05.2023 18:57:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProduct](
	[OrderID] [int] NOT NULL,
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PickupPoint]    Script Date: 25.05.2023 18:57:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PickupPoint](
	[PickupPointID] [int] NOT NULL,
	[IndexMail] [nvarchar](max) NOT NULL,
	[City] [nvarchar](max) NOT NULL,
	[Street] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_PickupPoint] PRIMARY KEY CLUSTERED 
(
	[PickupPointID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 25.05.2023 18:57:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
	[ProductName] [nvarchar](max) NOT NULL,
	[ProductDescription] [nvarchar](max) NOT NULL,
	[ProductCategory] [nvarchar](max) NOT NULL,
	[ProductPhoto] [nvarchar](max) NULL,
	[ProductManufacturer] [nvarchar](max) NOT NULL,
	[ProductCost] [decimal](19, 4) NOT NULL,
	[ProductDiscountAmount] [int] NULL,
	[ProductQuantityInStock] [int] NOT NULL,
 CONSTRAINT [PK__Product__2EA7DCD5ABADDF78] PRIMARY KEY CLUSTERED 
(
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 25.05.2023 18:57:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 25.05.2023 18:57:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserSurname] [nvarchar](100) NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[UserPatronymic] [nvarchar](100) NOT NULL,
	[UserLogin] [nvarchar](max) NOT NULL,
	[UserPassword] [nvarchar](max) NOT NULL,
	[UserRole] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [UserID], [OrderPickupPoint]) VALUES (2, N'Новый 
', CAST(N'2022-05-16T00:00:00.000' AS DateTime), 7, 1)
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [UserID], [OrderPickupPoint]) VALUES (34, N'Новый ', CAST(N'2022-05-21T00:00:00.000' AS DateTime), NULL, 32)
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [UserID], [OrderPickupPoint]) VALUES (35, N'Новый ', CAST(N'2022-05-22T00:00:00.000' AS DateTime), NULL, 20)
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [UserID], [OrderPickupPoint]) VALUES (37, N'Новый ', CAST(N'2022-05-24T00:00:00.000' AS DateTime), 10, 35)
SET IDENTITY_INSERT [dbo].[Order] OFF
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (2, N'B111C5
')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (2, N'M112C8')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (2, N'N387I8')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (2, N'O947D8')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (2, N'X846D3')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (34, N'V378J3')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (34, N'W874J3')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (35, N'E112C6')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (35, N'H497J3')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (37, N'M294G9')
INSERT [dbo].[PickupPoint] ([PickupPointID], [IndexMail], [City], [Street]) VALUES (1, N'344288
', N' г. Кропоткин
', N' ул. Чехова
')
INSERT [dbo].[PickupPoint] ([PickupPointID], [IndexMail], [City], [Street]) VALUES (3, N'394782', N' г. Кропоткин', N' ул. Чехова')
INSERT [dbo].[PickupPoint] ([PickupPointID], [IndexMail], [City], [Street]) VALUES (4, N'603036', N' г. Кропоткин', N' ул. Садовая')
INSERT [dbo].[PickupPoint] ([PickupPointID], [IndexMail], [City], [Street]) VALUES (8, N'620839', N' г. Кропоткин', N' ул. Цветочная')
INSERT [dbo].[PickupPoint] ([PickupPointID], [IndexMail], [City], [Street]) VALUES (12, N'625560', N' г. Кропоткин', N' ул. Некрасова')
INSERT [dbo].[PickupPoint] ([PickupPointID], [IndexMail], [City], [Street]) VALUES (13, N'410172', N' г. Кропоткин', N' ул. Северная')
INSERT [dbo].[PickupPoint] ([PickupPointID], [IndexMail], [City], [Street]) VALUES (17, N'630201', N' г. Кропоткин', N' ул. Комсомольская')
INSERT [dbo].[PickupPoint] ([PickupPointID], [IndexMail], [City], [Street]) VALUES (19, N'454311', N' г.Кропоткин', N' ул. Новая')
INSERT [dbo].[PickupPoint] ([PickupPointID], [IndexMail], [City], [Street]) VALUES (20, N'625590', N' г. Кропоткин', N' ул. Коммунистическая')
INSERT [dbo].[PickupPoint] ([PickupPointID], [IndexMail], [City], [Street]) VALUES (24, N'630370', N' г. Кропоткин', N' ул. Шоссейная')
INSERT [dbo].[PickupPoint] ([PickupPointID], [IndexMail], [City], [Street]) VALUES (25, N'660540', N' г. Кропоткин', N' ул. Солнечная')
INSERT [dbo].[PickupPoint] ([PickupPointID], [IndexMail], [City], [Street]) VALUES (26, N'450983', N' г.Кропоткин', N' ул. Комсомольская')
INSERT [dbo].[PickupPoint] ([PickupPointID], [IndexMail], [City], [Street]) VALUES (28, N'603002', N' г. Кропоткин', N' ул. Дзержинского')
INSERT [dbo].[PickupPoint] ([PickupPointID], [IndexMail], [City], [Street]) VALUES (30, N'614164', N' г.Кропоткин', N'  ул. Степная')
INSERT [dbo].[PickupPoint] ([PickupPointID], [IndexMail], [City], [Street]) VALUES (32, N'400562', N' г. Кропоткин', N' ул. Зеленая')
INSERT [dbo].[PickupPoint] ([PickupPointID], [IndexMail], [City], [Street]) VALUES (35, N'614753', N' г. Кропоткин', N' ул. Полевая')
INSERT [dbo].[PickupPoint] ([PickupPointID], [IndexMail], [City], [Street]) VALUES (40, N'125837', N' г. Кропоткин', N' ул. Шоссейная')
INSERT [dbo].[PickupPoint] ([PickupPointID], [IndexMail], [City], [Street]) VALUES (41, N'603721', N' г. Кропоткин', N' ул. Гоголя')
INSERT [dbo].[PickupPoint] ([PickupPointID], [IndexMail], [City], [Street]) VALUES (43, N'394242', N' г. Кропоткин', N' ул. Коммунистическая')
INSERT [dbo].[PickupPoint] ([PickupPointID], [IndexMail], [City], [Street]) VALUES (44, N'426030', N' г. Кропоткин', N' ул. Маяковского')
INSERT [dbo].[PickupPoint] ([PickupPointID], [IndexMail], [City], [Street]) VALUES (46, N'625283', N' г. Кропоткин', N' ул. Победы')
INSERT [dbo].[PickupPoint] ([PickupPointID], [IndexMail], [City], [Street]) VALUES (47, N'614510', N' г. Кропоткин', N' ул. Маяковского')
INSERT [dbo].[PickupPoint] ([PickupPointID], [IndexMail], [City], [Street]) VALUES (49, N'125703', N' г. Кропоткин', N' ул. Партизанская')
INSERT [dbo].[PickupPoint] ([PickupPointID], [IndexMail], [City], [Street]) VALUES (50, N'614611', N' г. Кропоткин', N' ул. Молодежная')
INSERT [dbo].[PickupPoint] ([PickupPointID], [IndexMail], [City], [Street]) VALUES (51, N'625683', N' г. Кропоткин', N' ул. 8 Марта')
INSERT [dbo].[PickupPoint] ([PickupPointID], [IndexMail], [City], [Street]) VALUES (52, N'450375', N' г. Кропоткин ', N'ул. Клубная 44')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'B111C5
', N'Поплин «Розовый жемчуг»
', N'Поплин «Розовый жемчуг» шириной 220 см с изображением на ткани — крупные цветы, чайная роза; цветовая гамма: бледно-розовая.
', N'Постельные ткани
', N'B111C5.JPEG', N'БТК Текстиль', CAST(8500.0000 AS Decimal(19, 4)), 9, 6)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'C384D8', N'Сатин «Дымчатая роза» однотонный', N'Сатин «Дымчатая роза» однотонный шириной 250 см с изображением на ткани цветовая гамма: розовый зефир.', N'Постельные ткани', N'', N'Империя ткани', CAST(1133.0000 AS Decimal(19, 4)), 13, 4)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'D938K3', N'Фланель однотонная светлая', N'Фланель однотонная светлая оптом шириной 90 см с изображением на ткани — однотонное; цветовая гамма: голубая, желтая, розовая, сирень, фисташка.', N'Ткани для изделий', N'', N'Май Фабрик', CAST(1300.0000 AS Decimal(19, 4)), 14, 10)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'E112C6', N'Муслин «Bej»', N'Муслин «Bej» однотонный шириной 140+/-5 см с изображением на ткани — однотонный; цветовая гамма: кофе с молоком.', N'Детские ткани', N'E112C6.JPG', N'Империя ткани', CAST(10500.0000 AS Decimal(19, 4)), 18, 13)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'F374S8', N'Фланель рубашечная', N'Фланель рубашечная шириной 150 см с изображением на ткани — клетка; цветовая гамма: светло-коричневая, синий-королевский.', N'Ткани для изделий', N'', N'БТК Текстиль', CAST(2100.0000 AS Decimal(19, 4)), 7, 5)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'H483D9', N'Фланель детская H483D9', N'Фланель детская 21212-2 шириной 90 см с изображением на ткани — россыпь звездочек; цветовая гамма: баклажан, оранжевый, розовая.', N'Детские ткани', N'', N'Комильфо', CAST(318.0000 AS Decimal(19, 4)), 7, 18)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'H497J3', N'Ситец детский', N'Ситец детский шириной 95 см с изображением на ткани — котята, сердечки; цветовая гамма: белоземельная, оранжевый.', N'Детские ткани', N'', N'БТК Текстиль', CAST(523.0000 AS Decimal(19, 4)), 7, 8)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'I483H3', N'Ткань поплин «Вивьен»', N'Ткань поплин «Вивьен» шириной 220 см с изображением на ткани — горошек; цветовая гамма: синяя, фисташка.', N'Постельные ткани', N'', N'БТК Текстиль', CAST(11300.0000 AS Decimal(19, 4)), 12, 5)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'K284U8', N'Бязь детская «Самолеты»', N'Бязь детская «Самолеты» шириной 150 см с изображением на ткани — игрушки, самолетики; цветовая гамма: белая, зеленая, синяя. ', N'Детские ткани', N'', N'Империя ткани', CAST(5100.0000 AS Decimal(19, 4)), 28, 2)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'K839K3', N'Плюш белый в клетку', N'Плюш белый в клетку шириной 180 см с изображением на ткани — клетка, однотонный; цветовая гамма: белая, однотонная.', N'Детские ткани', N'K839K3.JPG ', N'Империя ткани', CAST(765.0000 AS Decimal(19, 4)), 7, 3)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'L293S9', N'Плюш розовый гладкий', N'Плюш розовый гладкий шириной 180 см с изображением на ткани — однотонный; цветовая гамма: однотонная, розовая.', N'Детские ткани', N'L293S9.JPG', N'Комильфо', CAST(30000.0000 AS Decimal(19, 4)), 43, 2)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'M112C8', N'Бязь детская «Совята»', N'Бязь детская «Совята» шириной 150 см с изображением на ткани — совы; цветовая гамма: бордо, желтая, салатовая.', N'Детские ткани', N'M112C8.JPG', N'Империя ткани', CAST(26000.0000 AS Decimal(19, 4)), 22, 14)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'M294G9', N'Полотно вафельное «8 марта»', N'Полотно вафельное «8 марта» шириной 50 см с изображением на ткани — белые розы; цветовая гамма: розовая.', N'Ткани для изделий', N'M294G9.JPG', N'Империя ткани', CAST(5130.0000 AS Decimal(19, 4)), 7, 1)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'M398S9', N'Поплин Мокко', N'Поплин Мокко 220 см шириной 220 см с изображением на ткани — однотонное; цветовая гамма: коричневая, кофе, шоколад.', N'Постельные ткани', N'M398S9.JPG', N'Май Фабрик', CAST(1800.0000 AS Decimal(19, 4)), 17, 6)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'N283K3', N'Сатин «Миндальный» однотонный', N'Сатин «Миндальный» однотонный шириной 250 см с изображением на ткани цветовая гамма: миндаль. ', N'Постельные ткани', N'N283K3.JPG', N'Комильфо', CAST(6500.0000 AS Decimal(19, 4)), 8, 7)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'N385L2', N'Сатин «Фисташковый» однотонный', N'Сатин «Фисташковый» однотонный шириной 250 см с изображением на ткани цветовая гамма: фисташка.', N'Постельные ткани', N'', N'БТК Текстиль', CAST(7000.0000 AS Decimal(19, 4)), 22, 2)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'N387I8', N'Полотно вафельное «Кухня»', N'Полотно вафельное «Кухня» шириной 50 см с изображением на ткани — кухня; цветовая гамма: желтая, малина. ', N'Ткани для изделий', N'', N'БТК Текстиль', CAST(1000.0000 AS Decimal(19, 4)), 18, 5)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'N394K2', N'Ткань поплин «Лакшери»', N'Ткань поплин «Лакшери» шириной 220 см с изображением на ткани — надписи, сердечки; цветовая гамма: белая, красная, черная. ', N'Постельные ткани', N'', N'Империя ткани', CAST(30660.0000 AS Decimal(19, 4)), 14, 15)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'O947D8', N'Ткань для скатертей под рогожку', N'Ткань для скатертей под рогожку «рис 18825» шириной 150 см с изображением на ткани — ромашки, россыпь цветов; цветовая гамма: красная, синяя.', N'Ткани для изделий', N'', N'Май Фабрик', CAST(3550.0000 AS Decimal(19, 4)), 13, 9)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'P495H8', N'Поплин «Густав»', N'Поплин «Густав» шириной 220 см с изображением на ткани — листья, папортник; цветовая гамма: зеленая, светло-серая.', N'Постельные ткани', N'', N'Комильфо', CAST(1000.0000 AS Decimal(19, 4)), 17, 14)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'Q836H4', N'Фланель рубашечная', N'Фланель арт 535 рубашечная шириной 150 см с изображением на ткани — клетка; цветовая гамма: светло-коричневая, синий-королевский.', N'Ткани для изделий', N'', N'Май Фабрик', CAST(1350.0000 AS Decimal(19, 4)), 9, 7)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'R748K3', N'Поплин Морская волна', N'Поплин Морская волна 220 см шириной 220 см с изображением на ткани — однотонное; цветовая гамма: аквамарин, бирюзовая.', N'Постельные ткани', N'', N'Май Фабрик', CAST(2300.0000 AS Decimal(19, 4)), 17, 6)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'R983K4', N'Сатин «Серо-бежевый» однотонный', N'Сатин «Серо-бежевый» однотонный шириной 250 см с изображением на ткани цветовая гамма: серо-бежевая.', N'Постельные ткани', N'', N'Империя ткани', CAST(1645.0000 AS Decimal(19, 4)), 17, 13)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'S384K2', N'Фланель черная', N'Фланель черная оптом шириной 90 см с изображением на ткани — однотонное; цветовая гамма: черная.', N'Ткани для изделий', N'S384K2.JPG', N'БТК Текстиль', CAST(69000.0000 AS Decimal(19, 4)), 44, 2)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'T238C7', N'Муслин «Gri»', N'Муслин «Gri» однотонный шириной 140+/-5 см с изображением на ткани — однотонный; цветовая гамма: серая.', N'Детские ткани', N'T238C7.JPG', N'БТК Текстиль', CAST(6500.0000 AS Decimal(19, 4)), 17, 12)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'U947E9', N'Муслин белый горошек на однотонном фоне', N'Муслин белый горошек на однотонном фоне шириной 150 см с изображением на ткани — мелкий горошек; цветовая гамма: желтая.', N'Детские ткани', N'', N'Империя ткани', CAST(3411.0000 AS Decimal(19, 4)), 13, 4)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'V378J3', N'Ситец детский', N'Ситец детский шириной 95 см с изображением на ткани — котенок, облака, полумесяц, радуга; цветовая гамма: бледно-розовая, голубая, салатовая, серо-бежевая.', N'Детские ткани', N'', N'Комильфо', CAST(2400.0000 AS Decimal(19, 4)), 18, 14)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'W874J3', N'Ткань поплин «Натурель»', N'Ткань поплин «Натурель» шириной 220 см с изображением на ткани — мелкие цветы; цветовая гамма: пепельная, розовая. ', N'Постельные ткани', N'', N'БТК Текстиль', CAST(1600.0000 AS Decimal(19, 4)), 8, 9)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'X846D3', N'Ситец детский', N'Ситец детский шириной 95 см с изображением на ткани — жираф, полумесяц, пчелки; цветовая гамма: темно-фиолетовая.', N'Детские ткани', N'', N'Империя ткани', CAST(9300.0000 AS Decimal(19, 4)), 28, 5)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'Z937S2', N'Поплин Голубой', N'Поплин Голубой 220 см шириной 220 см с изображением на ткани — однотонное; цветовая гамма: голубая.', N'Постельные ткани', N'', N'БТК Текстиль', CAST(9000.0000 AS Decimal(19, 4)), 12, 15)
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'Администратор')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'Администратор')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (3, N'Администратор')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (4, N'Менеджер')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (5, N'Менеджер')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (6, N'Менеджер')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (7, N'Клиент')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (8, N'Клиент')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (9, N'Клиент')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (10, N'Клиент')
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (1, N'Лавров', N'Богдан', N'Львович', N'8lf0g@yandex.ru', N'2L6KZG', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (2, N'Смирнова', N'Полина', N'Фёдоровна', N'1zx8@yandex.ru', N'uzWC67', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (3, N'Полякова', N'София', N'Данииловна', N'x@mail.ru', N'8ntwUp', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (4, N'Чеботарева', N'Марина', N'Данииловна', N'34d@gmail.com', N'YOyhfR', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (5, N'Ермолов', N'Адам', N'Иванович', N'pxacl@mail.ru', N'RSbvHv', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (6, N'Васильев', N'Андрей', N'Кириллович', N'7o1@gmail.com', N'rwVDh9', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (7, N'Маслов', N'Максим', N'Иванович', N'1@gmail.com', N'LdNyos', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (8, N'Симонов', N'Михаил', N'Тимурович', N'iut@gmail.com', N'gynQMT', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (9, N'Павлова', N'Ксения', N'Михайловна', N'e3t@outlook.com', N'AtnDjr', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (10, N'Трифонов', N'Григорий', N'Юрьевич', N'41clb6o2g@yandex.ru', N'JlFRCZ', 3)
SET IDENTITY_INSERT [dbo].[User] OFF
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_PickupPoint] FOREIGN KEY([OrderPickupPoint])
REFERENCES [dbo].[PickupPoint] ([PickupPointID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_PickupPoint]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK__OrderProd__Order__403A8C7D] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK__OrderProd__Order__403A8C7D]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK__OrderProd__Produ__412EB0B6] FOREIGN KEY([ProductArticleNumber])
REFERENCES [dbo].[Product] ([ProductArticleNumber])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK__OrderProd__Produ__412EB0B6]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([UserRole])
REFERENCES [dbo].[Role] ([RoleID])
GO
USE [master]
GO
ALTER DATABASE [Trade] SET  READ_WRITE 
GO
