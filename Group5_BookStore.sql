USE [master]
GO
/****** Object:  Database [Group5_BookStore]    Script Date: 22-May-20 10:01:54 PM ******/
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
/****** Object:  Table [dbo].[Orders]    Script Date: 22-May-20 10:01:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Order_ID] [varchar](30) NOT NULL,
	[Book_ID] [varchar](30) NOT NULL,
	[Customer_ID] [varchar](30) NOT NULL,
	[Cus_username] [varchar](30) NOT NULL,
	[Order_Date] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[Bill]    Script Date: 22-May-20 10:01:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[Bill](@Order_ID varchar(30))
returns table return 
select *
from Orders
where Orders.Order_ID = @Order_ID
GO
/****** Object:  Table [dbo].[Book_Review]    Script Date: 22-May-20 10:01:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book_Review](
	[Reviewer] [varchar](30) NOT NULL,
	[Reviewer_username] [varchar](30) NOT NULL,
	[Book] [varchar](30) NOT NULL,
	[Review] [text] NULL,
	[Rating] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Reviewer] ASC,
	[Book] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 22-May-20 10:01:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[Book_ID] [varchar](30) NOT NULL,
	[Book_Name] [varchar](30) NOT NULL,
	[Author] [varchar](30) NOT NULL,
	[Category] [varchar](30) NULL,
	[Price] [float] NOT NULL,
	[Discount] [float] NULL,
	[Quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Book_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 22-May-20 10:01:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Customer_ID] [varchar](30) NOT NULL,
	[Customer_Name] [varchar](30) NOT NULL,
	[Cus_username] [varchar](30) NOT NULL,
	[Cus_password] [varchar](30) NOT NULL,
	[Address] [varchar](30) NULL,
	[Street] [varchar](30) NULL,
	[District] [varchar](30) NULL,
	[City] [varchar](30) NULL,
	[Country] [varchar](30) NULL,
	[Phone] [varchar](14) NULL,
	[Email] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[Customer_ID] ASC,
	[Cus_username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Review]    Script Date: 22-May-20 10:01:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Review](
	[Order_ID] [varchar](30) NOT NULL,
	[Reviewer] [varchar](30) NOT NULL,
	[Reviewer_username] [varchar](30) NOT NULL,
	[Book] [varchar](30) NOT NULL,
	[Review] [text] NULL,
	[Rating] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Reviewer] ASC,
	[Book] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 22-May-20 10:01:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[Staff_ID] [varchar](30) NOT NULL,
	[Staff_Name] [varchar](30) NOT NULL,
	[Staff_username] [varchar](30) NOT NULL,
	[Staff_password] [varchar](30) NOT NULL,
	[Phone] [varchar](14) NULL,
	[Email] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[Staff_ID] ASC,
	[Staff_username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Book_Review]  WITH CHECK ADD FOREIGN KEY([Book])
REFERENCES [dbo].[Books] ([Book_ID])
GO
ALTER TABLE [dbo].[Book_Review]  WITH CHECK ADD FOREIGN KEY([Reviewer], [Reviewer_username])
REFERENCES [dbo].[Customers] ([Customer_ID], [Cus_username])
GO
ALTER TABLE [dbo].[Order_Review]  WITH CHECK ADD FOREIGN KEY([Book])
REFERENCES [dbo].[Books] ([Book_ID])
GO
ALTER TABLE [dbo].[Order_Review]  WITH CHECK ADD FOREIGN KEY([Reviewer], [Reviewer_username])
REFERENCES [dbo].[Customers] ([Customer_ID], [Cus_username])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([Customer_ID], [Cus_username])
REFERENCES [dbo].[Customers] ([Customer_ID], [Cus_username])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([Book_ID])
REFERENCES [dbo].[Books] ([Book_ID])
GO
ALTER TABLE [dbo].[Book_Review]  WITH CHECK ADD CHECK  (([Rating]>=(1) OR [Rating]<=(5)))
GO
ALTER TABLE [dbo].[Order_Review]  WITH CHECK ADD CHECK  (([Rating]>=(1) OR [Rating]<=(5)))
GO
USE [master]
GO
ALTER DATABASE [Group5_BookStore] SET  READ_WRITE 
GO
