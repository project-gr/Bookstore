USE [master]
GO
/****** Object:  Database [Group5_BookStore]    Script Date: 12-May-20 8:26:35 PM ******/
CREATE DATABASE [Group5_BookStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Group5_BookStore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Group5_BookStore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Group5_BookStore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Group5_BookStore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Group5_BookStore] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Group5_BookStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Group5_BookStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Group5_BookStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Group5_BookStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Group5_BookStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Group5_BookStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [Group5_BookStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Group5_BookStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Group5_BookStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Group5_BookStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Group5_BookStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Group5_BookStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Group5_BookStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Group5_BookStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Group5_BookStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Group5_BookStore] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Group5_BookStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Group5_BookStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Group5_BookStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Group5_BookStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Group5_BookStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Group5_BookStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Group5_BookStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Group5_BookStore] SET RECOVERY FULL 
GO
ALTER DATABASE [Group5_BookStore] SET  MULTI_USER 
GO
ALTER DATABASE [Group5_BookStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Group5_BookStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Group5_BookStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Group5_BookStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Group5_BookStore] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Group5_BookStore', N'ON'
GO
ALTER DATABASE [Group5_BookStore] SET QUERY_STORE = OFF
GO
USE [Group5_BookStore]
GO
/****** Object:  Table [dbo].[Add_Drop]    Script Date: 12-May-20 8:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Add_Drop](
	[Book_ID] [varchar](10) NULL,
	[Staff_ID] [varchar](20) NULL,
	[Date] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 12-May-20 8:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[Book_ID] [varchar](10) NOT NULL,
	[Book_Name] [varchar](30) NULL,
	[Author] [varchar](30) NULL,
	[Price] [float] NULL,
	[Amount] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Book_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book_Review]    Script Date: 12-May-20 8:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book_Review](
	[Reviewer] [varchar](10) NOT NULL,
	[Book] [varchar](10) NOT NULL,
	[Review] [text] NULL,
	[Rating] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Reviewer] ASC,
	[Book] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 12-May-20 8:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Category_ID] [int] IDENTITY(1,1) NOT NULL,
	[Category_Name] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[Category_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer_Review]    Script Date: 12-May-20 8:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_Review](
	[Reviewer] [varchar](10) NOT NULL,
	[Reviewee] [varchar](20) NOT NULL,
	[Review] [text] NULL,
	[Rating] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Reviewer] ASC,
	[Reviewee] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 12-May-20 8:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Customer_ID] [varchar](10) NOT NULL,
	[Customer_Name] [varchar](30) NULL,
	[Address] [varchar](50) NULL,
	[Phone] [varchar](10) NULL,
	[Email] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[Customer_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Has]    Script Date: 12-May-20 8:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Has](
	[Category_ID] [int] NULL,
	[Book_ID] [varchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Book]    Script Date: 12-May-20 8:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Book](
	[Customer_ID] [varchar](10) NULL,
	[Book_ID] [varchar](10) NULL,
	[Date] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 12-May-20 8:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[Staff_ID] [varchar](20) NOT NULL,
	[Staff_Name] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[Staff_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Add_Drop]  WITH CHECK ADD FOREIGN KEY([Book_ID])
REFERENCES [dbo].[Book] ([Book_ID])
GO
ALTER TABLE [dbo].[Add_Drop]  WITH CHECK ADD FOREIGN KEY([Staff_ID])
REFERENCES [dbo].[Staff] ([Staff_ID])
GO
ALTER TABLE [dbo].[Book_Review]  WITH CHECK ADD FOREIGN KEY([Reviewer])
REFERENCES [dbo].[Customers] ([Customer_ID])
GO
ALTER TABLE [dbo].[Book_Review]  WITH CHECK ADD FOREIGN KEY([Book])
REFERENCES [dbo].[Book] ([Book_ID])
GO
ALTER TABLE [dbo].[Customer_Review]  WITH CHECK ADD FOREIGN KEY([Reviewer])
REFERENCES [dbo].[Customers] ([Customer_ID])
GO
ALTER TABLE [dbo].[Customer_Review]  WITH CHECK ADD FOREIGN KEY([Reviewee])
REFERENCES [dbo].[Staff] ([Staff_ID])
GO
ALTER TABLE [dbo].[Has]  WITH CHECK ADD FOREIGN KEY([Book_ID])
REFERENCES [dbo].[Book] ([Book_ID])
GO
ALTER TABLE [dbo].[Has]  WITH CHECK ADD FOREIGN KEY([Category_ID])
REFERENCES [dbo].[Category] ([Category_ID])
GO
ALTER TABLE [dbo].[Order_Book]  WITH CHECK ADD FOREIGN KEY([Book_ID])
REFERENCES [dbo].[Book] ([Book_ID])
GO
ALTER TABLE [dbo].[Order_Book]  WITH CHECK ADD FOREIGN KEY([Customer_ID])
REFERENCES [dbo].[Customers] ([Customer_ID])
GO
ALTER TABLE [dbo].[Book_Review]  WITH CHECK ADD CHECK  (([Rating]>=(1) OR [Rating]<=(5)))
GO
ALTER TABLE [dbo].[Customer_Review]  WITH CHECK ADD CHECK  (([Rating]>=(1) OR [Rating]<=(5)))
GO
USE [master]
GO
ALTER DATABASE [Group5_BookStore] SET  READ_WRITE 
GO
