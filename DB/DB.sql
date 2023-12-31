USE [master]
GO
/****** Object:  Database [Prac_16]    Script Date: 18.06.2023 20:27:51 ******/
CREATE DATABASE [Prac_16]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Prac_16', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS1\MSSQL\DATA\Prac_16.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Prac_16_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS1\MSSQL\DATA\Prac_16_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Prac_16] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Prac_16].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Prac_16] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Prac_16] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Prac_16] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Prac_16] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Prac_16] SET ARITHABORT OFF 
GO
ALTER DATABASE [Prac_16] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Prac_16] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Prac_16] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Prac_16] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Prac_16] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Prac_16] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Prac_16] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Prac_16] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Prac_16] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Prac_16] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Prac_16] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Prac_16] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Prac_16] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Prac_16] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Prac_16] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Prac_16] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Prac_16] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Prac_16] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Prac_16] SET  MULTI_USER 
GO
ALTER DATABASE [Prac_16] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Prac_16] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Prac_16] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Prac_16] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Prac_16] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Prac_16] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Prac_16] SET QUERY_STORE = ON
GO
ALTER DATABASE [Prac_16] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Prac_16]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 18.06.2023 20:27:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[id] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[img] [nvarchar](50) NOT NULL,
	[description] [nvarchar](300) NOT NULL,
	[price] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Books] ([id], [name], [img], [description], [price]) VALUES (N'Castle', N'Ходячий замок', N'Castle.jpg', N'Книги английской писательницы Дианы У. Джонс настолько ярки, что так и просятся на экран. По ее бестселлеру «Ходячий замок» знаменитый мультипликатор Хаяо Миядзаки («Унесенные призраками»).', N'629')
INSERT [dbo].[Books] ([id], [name], [img], [description], [price]) VALUES (N'Color', N'Молчание цвета', N'Color.jpg', N'Новый сборник теплых и душевных историй от известной писательницы Наринэ Абгарян.', N'375')
INSERT [dbo].[Books] ([id], [name], [img], [description], [price]) VALUES (N'Eyes', N'Серебряные глаза', N'Eyes.jpg', N'Чарли, дочь владельца пиццерии "У Фредди Фазбера" и создателя аниматроников, после многих лет возвращается в родной городок. Встреча со старыми друзьями, веселые (а иногда и очень страшные) воспоминания, давние позабытые тайны…', N'819')
INSERT [dbo].[Books] ([id], [name], [img], [description], [price]) VALUES (N'Legend', N'Я - легенда', N'Legend.jpg', N'Книга поистине легендарная, как легендарно имя ее создателя. Роман породил целое направление в литературе, из него выросли такие мощные фигуры современного литературного мира, как Рэй Брэдбери, Стивен Кинг… - двух этих имен достаточно для оценки силы влияния.', N'375')
INSERT [dbo].[Books] ([id], [name], [img], [description], [price]) VALUES (N'Magnits', N'Магниты', N'Magnits.jpg', N'Продолжение бестселлера "Многогранники". Для всех, кто любит трогательные молодежные романы.', N'1406')
INSERT [dbo].[Books] ([id], [name], [img], [description], [price]) VALUES (N'Sword', N'Стеклянный меч', N'Sword.jpg', N'Культовый мировой бестселлер
Кровь Мэры Бэрроу красная, как у простых людей, но девушка обладает могущественной силой Серебряных.', N'692')
INSERT [dbo].[Books] ([id], [name], [img], [description], [price]) VALUES (N'Witcher', N'Ведьмак', N'Witcher.jpg', N'«Эта книга — самая полная история создания игрового "Ведьмака". История взлетов и падений, проб и ошибок, хитрого расчета и слепой удачи, тяжелых провалов и героических побед.', N'899')
GO
USE [master]
GO
ALTER DATABASE [Prac_16] SET  READ_WRITE 
GO
