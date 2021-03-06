USE [master]
GO
/****** Object:  Database [Ogrod_zoo]    Script Date: 02.12.2018 22:50:52 ******/
CREATE DATABASE [Ogrod_zoo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Ogrod_zoo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.PIOTREKSQL\MSSQL\DATA\Ogrod_zoo.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Ogrod_zoo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.PIOTREKSQL\MSSQL\DATA\Ogrod_zoo_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Ogrod_zoo] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Ogrod_zoo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Ogrod_zoo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Ogrod_zoo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Ogrod_zoo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Ogrod_zoo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Ogrod_zoo] SET ARITHABORT OFF 
GO
ALTER DATABASE [Ogrod_zoo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Ogrod_zoo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Ogrod_zoo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Ogrod_zoo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Ogrod_zoo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Ogrod_zoo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Ogrod_zoo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Ogrod_zoo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Ogrod_zoo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Ogrod_zoo] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Ogrod_zoo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Ogrod_zoo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Ogrod_zoo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Ogrod_zoo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Ogrod_zoo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Ogrod_zoo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Ogrod_zoo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Ogrod_zoo] SET RECOVERY FULL 
GO
ALTER DATABASE [Ogrod_zoo] SET  MULTI_USER 
GO
ALTER DATABASE [Ogrod_zoo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Ogrod_zoo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Ogrod_zoo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Ogrod_zoo] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Ogrod_zoo] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Ogrod_zoo', N'ON'
GO
ALTER DATABASE [Ogrod_zoo] SET QUERY_STORE = OFF
GO
USE [Ogrod_zoo]
GO
/****** Object:  Table [dbo].[harmonogramy]    Script Date: 02.12.2018 22:50:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[harmonogramy](
	[harmonogram_id] [numeric](5, 0) IDENTITY(1,1) NOT NULL,
	[start_pracy] [date] NOT NULL,
	[koniec_pracy] [date] NOT NULL,
	[klatka_id] [numeric](5, 0) NOT NULL,
	[opiekun_id] [numeric](5, 0) NOT NULL,
 CONSTRAINT [PK_harmonogramy] PRIMARY KEY CLUSTERED 
(
	[harmonogram_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[klatki]    Script Date: 02.12.2018 22:50:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[klatki](
	[klatka_id] [numeric](5, 0) IDENTITY(1,1) NOT NULL,
	[strefa_id] [numeric](5, 0) NOT NULL,
	[zwierze_id] [numeric](5, 0) NOT NULL,
 CONSTRAINT [PK_klatki] PRIMARY KEY CLUSTERED 
(
	[klatka_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[opiekunowie]    Script Date: 02.12.2018 22:50:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[opiekunowie](
	[opiekun_id] [numeric](5, 0) IDENTITY(1,1) NOT NULL,
	[imie] [varchar](50) NOT NULL,
	[nazwisko] [varchar](50) NOT NULL,
	[adres] [varchar](50) NULL,
	[nr_tel] [varchar](50) NULL,
	[przelozony_id] [numeric](5, 0) NOT NULL,
 CONSTRAINT [PK_opiekunowie] PRIMARY KEY CLUSTERED 
(
	[opiekun_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[widok_harmonogram_opiekuna]    Script Date: 02.12.2018 22:50:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[widok_harmonogram_opiekuna]
AS
SELECT        dbo.opiekunowie.imie, dbo.opiekunowie.nazwisko, dbo.opiekunowie.adres, dbo.opiekunowie.nr_tel AS nr_telefonu, dbo.harmonogramy.start_pracy, dbo.harmonogramy.koniec_pracy, dbo.klatki.strefa_id AS id_strefy, 
                         dbo.harmonogramy.klatka_id
FROM            dbo.harmonogramy INNER JOIN
                         dbo.opiekunowie ON dbo.harmonogramy.opiekun_id = dbo.opiekunowie.opiekun_id INNER JOIN
                         dbo.klatki ON dbo.harmonogramy.klatka_id = dbo.klatki.klatka_id
GO
/****** Object:  Table [dbo].[strefy]    Script Date: 02.12.2018 22:50:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[strefy](
	[strefa_id] [numeric](5, 0) IDENTITY(1,1) NOT NULL,
	[nazwa] [varchar](50) NOT NULL,
 CONSTRAINT [PK_strefy] PRIMARY KEY CLUSTERED 
(
	[strefa_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[zwierzeta]    Script Date: 02.12.2018 22:50:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zwierzeta](
	[zwierze_id] [numeric](5, 0) IDENTITY(1,1) NOT NULL,
	[gatunek] [varchar](50) NOT NULL,
	[waga] [numeric](5, 0) NULL,
	[wiek] [numeric](5, 0) NULL,
 CONSTRAINT [PK_zwierzeta] PRIMARY KEY CLUSTERED 
(
	[zwierze_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[widok_zwierzat]    Script Date: 02.12.2018 22:50:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[widok_zwierzat]
AS
SELECT        dbo.zwierzeta.gatunek, dbo.zwierzeta.waga, dbo.zwierzeta.wiek, dbo.strefy.nazwa
FROM            dbo.klatki INNER JOIN
                         dbo.strefy ON dbo.klatki.strefa_id = dbo.strefy.strefa_id INNER JOIN
                         dbo.zwierzeta ON dbo.klatki.zwierze_id = dbo.zwierzeta.zwierze_id
GO
/****** Object:  Table [dbo].[status]    Script Date: 02.12.2018 22:50:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[status](
	[status_id] [numeric](5, 0) IDENTITY(1,1) NOT NULL,
	[przebyte_choroby] [varchar](255) NULL,
	[aktualna_choroba] [varchar](255) NULL,
	[data_przebytej_choroby] [date] NULL,
	[data_kontroli_wet] [date] NULL,
	[zwierze_id] [numeric](5, 0) NOT NULL,
	[weterynarz_id] [numeric](5, 0) NOT NULL,
 CONSTRAINT [PK_status] PRIMARY KEY CLUSTERED 
(
	[status_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[weterynarze]    Script Date: 02.12.2018 22:50:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[weterynarze](
	[weterynarz_id] [numeric](5, 0) IDENTITY(1,1) NOT NULL,
	[imie] [varchar](50) NOT NULL,
	[nazwisko] [varchar](50) NOT NULL,
	[adres] [varchar](50) NULL,
	[nr_tel] [varchar](50) NULL,
	[dyzury] [varchar](50) NULL,
 CONSTRAINT [PK_weterynarze] PRIMARY KEY CLUSTERED 
(
	[weterynarz_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[widok_historii_zwierząt]    Script Date: 02.12.2018 22:50:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[widok_historii_zwierząt]
AS
SELECT        dbo.zwierzeta.gatunek, dbo.status.przebyte_choroby, dbo.status.aktualna_choroba, dbo.status.data_przebytej_choroby, dbo.status.data_kontroli_wet, dbo.weterynarze.imie AS imie_weterynarza, 
                         dbo.weterynarze.nazwisko AS nazwisko_weterynarza, dbo.weterynarze.adres, dbo.weterynarze.nr_tel
FROM            dbo.status INNER JOIN
                         dbo.weterynarze ON dbo.status.weterynarz_id = dbo.weterynarze.weterynarz_id INNER JOIN
                         dbo.zwierzeta ON dbo.status.zwierze_id = dbo.zwierzeta.zwierze_id
GO
/****** Object:  View [dbo].[widok_stref]    Script Date: 02.12.2018 22:50:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[widok_stref]
AS
SELECT        nazwa
FROM            dbo.strefy
GO
SET IDENTITY_INSERT [dbo].[harmonogramy] ON 

INSERT [dbo].[harmonogramy] ([harmonogram_id], [start_pracy], [koniec_pracy], [klatka_id], [opiekun_id]) VALUES (CAST(16 AS Numeric(5, 0)), CAST(N'2018-06-20' AS Date), CAST(N'2018-06-22' AS Date), CAST(8 AS Numeric(5, 0)), CAST(1 AS Numeric(5, 0)))
INSERT [dbo].[harmonogramy] ([harmonogram_id], [start_pracy], [koniec_pracy], [klatka_id], [opiekun_id]) VALUES (CAST(17 AS Numeric(5, 0)), CAST(N'2018-06-20' AS Date), CAST(N'2018-06-21' AS Date), CAST(9 AS Numeric(5, 0)), CAST(2 AS Numeric(5, 0)))
INSERT [dbo].[harmonogramy] ([harmonogram_id], [start_pracy], [koniec_pracy], [klatka_id], [opiekun_id]) VALUES (CAST(18 AS Numeric(5, 0)), CAST(N'2018-06-20' AS Date), CAST(N'2018-06-25' AS Date), CAST(10 AS Numeric(5, 0)), CAST(3 AS Numeric(5, 0)))
INSERT [dbo].[harmonogramy] ([harmonogram_id], [start_pracy], [koniec_pracy], [klatka_id], [opiekun_id]) VALUES (CAST(19 AS Numeric(5, 0)), CAST(N'2018-06-20' AS Date), CAST(N'2018-06-26' AS Date), CAST(11 AS Numeric(5, 0)), CAST(4 AS Numeric(5, 0)))
INSERT [dbo].[harmonogramy] ([harmonogram_id], [start_pracy], [koniec_pracy], [klatka_id], [opiekun_id]) VALUES (CAST(20 AS Numeric(5, 0)), CAST(N'2018-06-20' AS Date), CAST(N'2018-06-30' AS Date), CAST(12 AS Numeric(5, 0)), CAST(5 AS Numeric(5, 0)))
INSERT [dbo].[harmonogramy] ([harmonogram_id], [start_pracy], [koniec_pracy], [klatka_id], [opiekun_id]) VALUES (CAST(21 AS Numeric(5, 0)), CAST(N'2018-06-20' AS Date), CAST(N'2018-07-01' AS Date), CAST(13 AS Numeric(5, 0)), CAST(2 AS Numeric(5, 0)))
SET IDENTITY_INSERT [dbo].[harmonogramy] OFF
SET IDENTITY_INSERT [dbo].[klatki] ON 

INSERT [dbo].[klatki] ([klatka_id], [strefa_id], [zwierze_id]) VALUES (CAST(8 AS Numeric(5, 0)), CAST(1 AS Numeric(5, 0)), CAST(1 AS Numeric(5, 0)))
INSERT [dbo].[klatki] ([klatka_id], [strefa_id], [zwierze_id]) VALUES (CAST(9 AS Numeric(5, 0)), CAST(2 AS Numeric(5, 0)), CAST(2 AS Numeric(5, 0)))
INSERT [dbo].[klatki] ([klatka_id], [strefa_id], [zwierze_id]) VALUES (CAST(10 AS Numeric(5, 0)), CAST(3 AS Numeric(5, 0)), CAST(3 AS Numeric(5, 0)))
INSERT [dbo].[klatki] ([klatka_id], [strefa_id], [zwierze_id]) VALUES (CAST(11 AS Numeric(5, 0)), CAST(4 AS Numeric(5, 0)), CAST(4 AS Numeric(5, 0)))
INSERT [dbo].[klatki] ([klatka_id], [strefa_id], [zwierze_id]) VALUES (CAST(12 AS Numeric(5, 0)), CAST(5 AS Numeric(5, 0)), CAST(5 AS Numeric(5, 0)))
INSERT [dbo].[klatki] ([klatka_id], [strefa_id], [zwierze_id]) VALUES (CAST(13 AS Numeric(5, 0)), CAST(6 AS Numeric(5, 0)), CAST(6 AS Numeric(5, 0)))
INSERT [dbo].[klatki] ([klatka_id], [strefa_id], [zwierze_id]) VALUES (CAST(14 AS Numeric(5, 0)), CAST(7 AS Numeric(5, 0)), CAST(7 AS Numeric(5, 0)))
SET IDENTITY_INSERT [dbo].[klatki] OFF
SET IDENTITY_INSERT [dbo].[opiekunowie] ON 

INSERT [dbo].[opiekunowie] ([opiekun_id], [imie], [nazwisko], [adres], [nr_tel], [przelozony_id]) VALUES (CAST(1 AS Numeric(5, 0)), N'Arkadiusz', N'Nowak', N'Strzegomska 12, Wrocław', N'543743654', CAST(3 AS Numeric(5, 0)))
INSERT [dbo].[opiekunowie] ([opiekun_id], [imie], [nazwisko], [adres], [nr_tel], [przelozony_id]) VALUES (CAST(2 AS Numeric(5, 0)), N'Szymon', N'Radkiewicz', N'Poznańska 57C, Wołów', N'353985345', CAST(3 AS Numeric(5, 0)))
INSERT [dbo].[opiekunowie] ([opiekun_id], [imie], [nazwisko], [adres], [nr_tel], [przelozony_id]) VALUES (CAST(3 AS Numeric(5, 0)), N'Paweł', N'Janiak', N'Stachocińska 27D, Wrocław', N'876246543', CAST(5 AS Numeric(5, 0)))
INSERT [dbo].[opiekunowie] ([opiekun_id], [imie], [nazwisko], [adres], [nr_tel], [przelozony_id]) VALUES (CAST(4 AS Numeric(5, 0)), N'Jacek', N'Radzynicz', N'Zielona 5, Wrocław', NULL, CAST(1 AS Numeric(5, 0)))
INSERT [dbo].[opiekunowie] ([opiekun_id], [imie], [nazwisko], [adres], [nr_tel], [przelozony_id]) VALUES (CAST(5 AS Numeric(5, 0)), N'Witold', N'Urbanowicz', N'Radosna 4/11, Lubin', N'987654321', CAST(2 AS Numeric(5, 0)))
INSERT [dbo].[opiekunowie] ([opiekun_id], [imie], [nazwisko], [adres], [nr_tel], [przelozony_id]) VALUES (CAST(6 AS Numeric(5, 0)), N'Arkadiusz', N'Nowak', N'Strzegomska 12, Wrocław', N'543743654', CAST(3 AS Numeric(5, 0)))
INSERT [dbo].[opiekunowie] ([opiekun_id], [imie], [nazwisko], [adres], [nr_tel], [przelozony_id]) VALUES (CAST(7 AS Numeric(5, 0)), N'Szymon', N'Radkiewicz', N'Poznańska 57C, Wołów', N'353985345', CAST(3 AS Numeric(5, 0)))
INSERT [dbo].[opiekunowie] ([opiekun_id], [imie], [nazwisko], [adres], [nr_tel], [przelozony_id]) VALUES (CAST(8 AS Numeric(5, 0)), N'Paweł', N'Janiak', N'Stachocińska 27D, Wrocław', N'876246543', CAST(5 AS Numeric(5, 0)))
INSERT [dbo].[opiekunowie] ([opiekun_id], [imie], [nazwisko], [adres], [nr_tel], [przelozony_id]) VALUES (CAST(9 AS Numeric(5, 0)), N'Jacek', N'Radzynicz', N'Zielona 5, Wrocław', NULL, CAST(1 AS Numeric(5, 0)))
INSERT [dbo].[opiekunowie] ([opiekun_id], [imie], [nazwisko], [adres], [nr_tel], [przelozony_id]) VALUES (CAST(10 AS Numeric(5, 0)), N'Witold', N'Urbanowicz', N'Radosna 4/11, Lubin', N'987654321', CAST(2 AS Numeric(5, 0)))
SET IDENTITY_INSERT [dbo].[opiekunowie] OFF
SET IDENTITY_INSERT [dbo].[status] ON 

INSERT [dbo].[status] ([status_id], [przebyte_choroby], [aktualna_choroba], [data_przebytej_choroby], [data_kontroli_wet], [zwierze_id], [weterynarz_id]) VALUES (CAST(17 AS Numeric(5, 0)), NULL, NULL, NULL, NULL, CAST(1 AS Numeric(5, 0)), CAST(1 AS Numeric(5, 0)))
INSERT [dbo].[status] ([status_id], [przebyte_choroby], [aktualna_choroba], [data_przebytej_choroby], [data_kontroli_wet], [zwierze_id], [weterynarz_id]) VALUES (CAST(18 AS Numeric(5, 0)), N'Nowotwór nerki', NULL, CAST(N'2015-04-18' AS Date), NULL, CAST(2 AS Numeric(5, 0)), CAST(3 AS Numeric(5, 0)))
INSERT [dbo].[status] ([status_id], [przebyte_choroby], [aktualna_choroba], [data_przebytej_choroby], [data_kontroli_wet], [zwierze_id], [weterynarz_id]) VALUES (CAST(19 AS Numeric(5, 0)), NULL, N'Zapalenie płuc', NULL, CAST(N'2014-03-03' AS Date), CAST(3 AS Numeric(5, 0)), CAST(2 AS Numeric(5, 0)))
INSERT [dbo].[status] ([status_id], [przebyte_choroby], [aktualna_choroba], [data_przebytej_choroby], [data_kontroli_wet], [zwierze_id], [weterynarz_id]) VALUES (CAST(20 AS Numeric(5, 0)), N'Toksoplazmoza', NULL, CAST(N'2016-01-15' AS Date), CAST(N'2016-02-22' AS Date), CAST(5 AS Numeric(5, 0)), CAST(1 AS Numeric(5, 0)))
INSERT [dbo].[status] ([status_id], [przebyte_choroby], [aktualna_choroba], [data_przebytej_choroby], [data_kontroli_wet], [zwierze_id], [weterynarz_id]) VALUES (CAST(21 AS Numeric(5, 0)), NULL, NULL, NULL, NULL, CAST(4 AS Numeric(5, 0)), CAST(2 AS Numeric(5, 0)))
INSERT [dbo].[status] ([status_id], [przebyte_choroby], [aktualna_choroba], [data_przebytej_choroby], [data_kontroli_wet], [zwierze_id], [weterynarz_id]) VALUES (CAST(22 AS Numeric(5, 0)), N'Grypa żołądkowa', NULL, CAST(N'2013-12-12' AS Date), CAST(N'2015-08-18' AS Date), CAST(6 AS Numeric(5, 0)), CAST(3 AS Numeric(5, 0)))
INSERT [dbo].[status] ([status_id], [przebyte_choroby], [aktualna_choroba], [data_przebytej_choroby], [data_kontroli_wet], [zwierze_id], [weterynarz_id]) VALUES (CAST(23 AS Numeric(5, 0)), NULL, N'Tężec', NULL, CAST(N'2016-06-01' AS Date), CAST(7 AS Numeric(5, 0)), CAST(2 AS Numeric(5, 0)))
INSERT [dbo].[status] ([status_id], [przebyte_choroby], [aktualna_choroba], [data_przebytej_choroby], [data_kontroli_wet], [zwierze_id], [weterynarz_id]) VALUES (CAST(24 AS Numeric(5, 0)), NULL, NULL, NULL, NULL, CAST(8 AS Numeric(5, 0)), CAST(1 AS Numeric(5, 0)))
SET IDENTITY_INSERT [dbo].[status] OFF
SET IDENTITY_INSERT [dbo].[strefy] ON 

INSERT [dbo].[strefy] ([strefa_id], [nazwa]) VALUES (CAST(1 AS Numeric(5, 0)), N'Europa')
INSERT [dbo].[strefy] ([strefa_id], [nazwa]) VALUES (CAST(2 AS Numeric(5, 0)), N'Afryka')
INSERT [dbo].[strefy] ([strefa_id], [nazwa]) VALUES (CAST(3 AS Numeric(5, 0)), N'Azja')
INSERT [dbo].[strefy] ([strefa_id], [nazwa]) VALUES (CAST(4 AS Numeric(5, 0)), N'Ameryka Północna')
INSERT [dbo].[strefy] ([strefa_id], [nazwa]) VALUES (CAST(5 AS Numeric(5, 0)), N'Ameryka Południowa')
INSERT [dbo].[strefy] ([strefa_id], [nazwa]) VALUES (CAST(6 AS Numeric(5, 0)), N'Australia')
INSERT [dbo].[strefy] ([strefa_id], [nazwa]) VALUES (CAST(7 AS Numeric(5, 0)), N'Antarktyda')
INSERT [dbo].[strefy] ([strefa_id], [nazwa]) VALUES (CAST(8 AS Numeric(5, 0)), N'Europa')
INSERT [dbo].[strefy] ([strefa_id], [nazwa]) VALUES (CAST(9 AS Numeric(5, 0)), N'Afryka')
INSERT [dbo].[strefy] ([strefa_id], [nazwa]) VALUES (CAST(10 AS Numeric(5, 0)), N'Azja')
INSERT [dbo].[strefy] ([strefa_id], [nazwa]) VALUES (CAST(11 AS Numeric(5, 0)), N'Ameryka Północna')
INSERT [dbo].[strefy] ([strefa_id], [nazwa]) VALUES (CAST(12 AS Numeric(5, 0)), N'Ameryka Południowa')
INSERT [dbo].[strefy] ([strefa_id], [nazwa]) VALUES (CAST(13 AS Numeric(5, 0)), N'Australia')
INSERT [dbo].[strefy] ([strefa_id], [nazwa]) VALUES (CAST(14 AS Numeric(5, 0)), N'Antarktyda')
SET IDENTITY_INSERT [dbo].[strefy] OFF
SET IDENTITY_INSERT [dbo].[weterynarze] ON 

INSERT [dbo].[weterynarze] ([weterynarz_id], [imie], [nazwisko], [adres], [nr_tel], [dyzury]) VALUES (CAST(1 AS Numeric(5, 0)), N'Adrian', N'Śliwa', N'Zagrodnicza 21F, Wrocław', N'654623865', N'Poniedziałek, Wtorek')
INSERT [dbo].[weterynarze] ([weterynarz_id], [imie], [nazwisko], [adres], [nr_tel], [dyzury]) VALUES (CAST(2 AS Numeric(5, 0)), N'Zbigniew', N'Wasiński', N'Prusa 5, Legnica', N'632852668', N'Środa, Sobota, Niedziela')
INSERT [dbo].[weterynarze] ([weterynarz_id], [imie], [nazwisko], [adres], [nr_tel], [dyzury]) VALUES (CAST(3 AS Numeric(5, 0)), N'Kamil', N'Włodarczyk', N'Niedziałkoweskiego 50, Wrocław', N'433687467', N'Czwartek, Piątek')
INSERT [dbo].[weterynarze] ([weterynarz_id], [imie], [nazwisko], [adres], [nr_tel], [dyzury]) VALUES (CAST(4 AS Numeric(5, 0)), N'Adrian', N'Śliwa', N'Zagrodnicza 21F, Wrocław', N'654623865', N'Poniedziałek, Wtorek')
INSERT [dbo].[weterynarze] ([weterynarz_id], [imie], [nazwisko], [adres], [nr_tel], [dyzury]) VALUES (CAST(5 AS Numeric(5, 0)), N'Zbigniew', N'Wasiński', N'Prusa 5, Legnica', N'632852668', N'Środa, Sobota, Niedziela')
INSERT [dbo].[weterynarze] ([weterynarz_id], [imie], [nazwisko], [adres], [nr_tel], [dyzury]) VALUES (CAST(6 AS Numeric(5, 0)), N'Kamil', N'Włodarczyk', N'Niedziałkoweskiego 50, Wrocław', N'433687467', N'Czwartek, Piątek')
SET IDENTITY_INSERT [dbo].[weterynarze] OFF
SET IDENTITY_INSERT [dbo].[zwierzeta] ON 

INSERT [dbo].[zwierzeta] ([zwierze_id], [gatunek], [waga], [wiek]) VALUES (CAST(1 AS Numeric(5, 0)), N'Lew Syberyjski', CAST(78 AS Numeric(5, 0)), CAST(12 AS Numeric(5, 0)))
INSERT [dbo].[zwierzeta] ([zwierze_id], [gatunek], [waga], [wiek]) VALUES (CAST(2 AS Numeric(5, 0)), N'Goryl', CAST(120 AS Numeric(5, 0)), CAST(19 AS Numeric(5, 0)))
INSERT [dbo].[zwierzeta] ([zwierze_id], [gatunek], [waga], [wiek]) VALUES (CAST(3 AS Numeric(5, 0)), N'Tygrys Szablozębny', NULL, NULL)
INSERT [dbo].[zwierzeta] ([zwierze_id], [gatunek], [waga], [wiek]) VALUES (CAST(4 AS Numeric(5, 0)), N'Aguti', CAST(4 AS Numeric(5, 0)), CAST(3 AS Numeric(5, 0)))
INSERT [dbo].[zwierzeta] ([zwierze_id], [gatunek], [waga], [wiek]) VALUES (CAST(5 AS Numeric(5, 0)), N'Fenek', CAST(9 AS Numeric(5, 0)), CAST(9 AS Numeric(5, 0)))
INSERT [dbo].[zwierzeta] ([zwierze_id], [gatunek], [waga], [wiek]) VALUES (CAST(6 AS Numeric(5, 0)), N'Aligator', CAST(80 AS Numeric(5, 0)), NULL)
INSERT [dbo].[zwierzeta] ([zwierze_id], [gatunek], [waga], [wiek]) VALUES (CAST(7 AS Numeric(5, 0)), N'Kapibara', NULL, CAST(12 AS Numeric(5, 0)))
INSERT [dbo].[zwierzeta] ([zwierze_id], [gatunek], [waga], [wiek]) VALUES (CAST(8 AS Numeric(5, 0)), N'Muflon', CAST(134 AS Numeric(5, 0)), NULL)
INSERT [dbo].[zwierzeta] ([zwierze_id], [gatunek], [waga], [wiek]) VALUES (CAST(9 AS Numeric(5, 0)), N'Lew Syberyjski', CAST(78 AS Numeric(5, 0)), CAST(12 AS Numeric(5, 0)))
INSERT [dbo].[zwierzeta] ([zwierze_id], [gatunek], [waga], [wiek]) VALUES (CAST(10 AS Numeric(5, 0)), N'Goryl', CAST(120 AS Numeric(5, 0)), CAST(19 AS Numeric(5, 0)))
INSERT [dbo].[zwierzeta] ([zwierze_id], [gatunek], [waga], [wiek]) VALUES (CAST(11 AS Numeric(5, 0)), N'Tygrys Szablozębny', NULL, NULL)
INSERT [dbo].[zwierzeta] ([zwierze_id], [gatunek], [waga], [wiek]) VALUES (CAST(12 AS Numeric(5, 0)), N'Aguti', CAST(4 AS Numeric(5, 0)), CAST(3 AS Numeric(5, 0)))
INSERT [dbo].[zwierzeta] ([zwierze_id], [gatunek], [waga], [wiek]) VALUES (CAST(13 AS Numeric(5, 0)), N'Fenek', CAST(9 AS Numeric(5, 0)), CAST(9 AS Numeric(5, 0)))
INSERT [dbo].[zwierzeta] ([zwierze_id], [gatunek], [waga], [wiek]) VALUES (CAST(14 AS Numeric(5, 0)), N'Aligator', CAST(80 AS Numeric(5, 0)), NULL)
INSERT [dbo].[zwierzeta] ([zwierze_id], [gatunek], [waga], [wiek]) VALUES (CAST(15 AS Numeric(5, 0)), N'Kapibara', NULL, CAST(12 AS Numeric(5, 0)))
INSERT [dbo].[zwierzeta] ([zwierze_id], [gatunek], [waga], [wiek]) VALUES (CAST(16 AS Numeric(5, 0)), N'Muflon', CAST(134 AS Numeric(5, 0)), NULL)
SET IDENTITY_INSERT [dbo].[zwierzeta] OFF
ALTER TABLE [dbo].[harmonogramy]  WITH CHECK ADD  CONSTRAINT [FK_harmonogramy_klatki] FOREIGN KEY([klatka_id])
REFERENCES [dbo].[klatki] ([klatka_id])
GO
ALTER TABLE [dbo].[harmonogramy] CHECK CONSTRAINT [FK_harmonogramy_klatki]
GO
ALTER TABLE [dbo].[harmonogramy]  WITH CHECK ADD  CONSTRAINT [FK_harmonogramy_opiekunowie] FOREIGN KEY([opiekun_id])
REFERENCES [dbo].[opiekunowie] ([opiekun_id])
GO
ALTER TABLE [dbo].[harmonogramy] CHECK CONSTRAINT [FK_harmonogramy_opiekunowie]
GO
ALTER TABLE [dbo].[klatki]  WITH CHECK ADD  CONSTRAINT [FK_klatki_strefy] FOREIGN KEY([strefa_id])
REFERENCES [dbo].[strefy] ([strefa_id])
GO
ALTER TABLE [dbo].[klatki] CHECK CONSTRAINT [FK_klatki_strefy]
GO
ALTER TABLE [dbo].[klatki]  WITH CHECK ADD  CONSTRAINT [FK_klatki_zwierzeta] FOREIGN KEY([zwierze_id])
REFERENCES [dbo].[zwierzeta] ([zwierze_id])
GO
ALTER TABLE [dbo].[klatki] CHECK CONSTRAINT [FK_klatki_zwierzeta]
GO
ALTER TABLE [dbo].[status]  WITH CHECK ADD  CONSTRAINT [FK_status_weterynarze] FOREIGN KEY([weterynarz_id])
REFERENCES [dbo].[weterynarze] ([weterynarz_id])
GO
ALTER TABLE [dbo].[status] CHECK CONSTRAINT [FK_status_weterynarze]
GO
ALTER TABLE [dbo].[status]  WITH CHECK ADD  CONSTRAINT [FK_status_zwierzeta] FOREIGN KEY([zwierze_id])
REFERENCES [dbo].[zwierzeta] ([zwierze_id])
GO
ALTER TABLE [dbo].[status] CHECK CONSTRAINT [FK_status_zwierzeta]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
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
         Begin Table = "harmonogramy"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 219
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "opiekunowie"
            Begin Extent = 
               Top = 195
               Left = 239
               Bottom = 325
               Right = 409
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "klatki"
            Begin Extent = 
               Top = 34
               Left = 534
               Bottom = 147
               Right = 704
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
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 1065
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'widok_harmonogram_opiekuna'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'widok_harmonogram_opiekuna'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
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
         Begin Table = "status"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 185
               Right = 252
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "weterynarze"
            Begin Extent = 
               Top = 169
               Left = 270
               Bottom = 332
               Right = 440
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "zwierzeta"
            Begin Extent = 
               Top = 41
               Left = 456
               Bottom = 178
               Right = 626
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'widok_historii_zwierząt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'widok_historii_zwierząt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
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
         Begin Table = "strefy"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 102
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'widok_stref'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'widok_stref'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
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
         Begin Table = "klatki"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 153
               Right = 221
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "strefy"
            Begin Extent = 
               Top = 22
               Left = 457
               Bottom = 161
               Right = 662
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "zwierzeta"
            Begin Extent = 
               Top = 181
               Left = 250
               Bottom = 311
               Right = 420
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'widok_zwierzat'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'widok_zwierzat'
GO
USE [master]
GO
ALTER DATABASE [Ogrod_zoo] SET  READ_WRITE 
GO
