USE [master]
GO
/****** Object:  Database [myBookshelf]    Script Date: 2/29/2020 1:28:35 PM ******/
CREATE DATABASE [myBookshelf]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'myBookshelf', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\myBookshelf.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'myBookshelf_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\myBookshelf_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [myBookshelf] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [myBookshelf].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [myBookshelf] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [myBookshelf] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [myBookshelf] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [myBookshelf] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [myBookshelf] SET ARITHABORT OFF 
GO
ALTER DATABASE [myBookshelf] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [myBookshelf] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [myBookshelf] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [myBookshelf] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [myBookshelf] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [myBookshelf] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [myBookshelf] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [myBookshelf] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [myBookshelf] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [myBookshelf] SET  ENABLE_BROKER 
GO
ALTER DATABASE [myBookshelf] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [myBookshelf] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [myBookshelf] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [myBookshelf] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [myBookshelf] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [myBookshelf] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [myBookshelf] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [myBookshelf] SET RECOVERY FULL 
GO
ALTER DATABASE [myBookshelf] SET  MULTI_USER 
GO
ALTER DATABASE [myBookshelf] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [myBookshelf] SET DB_CHAINING OFF 
GO
ALTER DATABASE [myBookshelf] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [myBookshelf] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [myBookshelf] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'myBookshelf', N'ON'
GO
ALTER DATABASE [myBookshelf] SET QUERY_STORE = OFF
GO
USE [myBookshelf]
GO
/****** Object:  Table [dbo].[authors]    Script Date: 2/29/2020 1:28:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[authors](
	[AuthorID] [varchar](20) NOT NULL,
	[AuthorFirstName] [varchar](30) NOT NULL,
	[AuthorLastName] [varchar](30) NOT NULL,
	[AuthorAddress] [varchar](50) NOT NULL,
	[Zipcode] [varchar](10) NOT NULL,
	[AuthorPhone] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[AuthorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bookauthor]    Script Date: 2/29/2020 1:28:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bookauthor](
	[Isbn] [int] NOT NULL,
	[AuthorID] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Isbn] ASC,
	[AuthorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[books]    Script Date: 2/29/2020 1:28:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[books](
	[Isbn] [int] NOT NULL,
	[BookTitle] [varchar](50) NOT NULL,
	[PublisherID] [varchar](20) NOT NULL,
	[FirstPublished] [date] NULL,
	[Genre] [varchar](30) NULL,
	[SeriesID] [varchar](20) NOT NULL,
	[PositionInSeries] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Isbn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[distributors]    Script Date: 2/29/2020 1:28:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[distributors](
	[DistributerID] [varchar](20) NOT NULL,
	[DistributerName] [varchar](30) NOT NULL,
	[Zipcode] [varchar](10) NOT NULL,
	[DistributerPhone] [varchar](15) NOT NULL,
	[MethodOfDistribution] [varchar](30) NULL,
	[DistributerWebsite] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[DistributerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[publishers]    Script Date: 2/29/2020 1:28:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[publishers](
	[PublisherID] [varchar](20) NOT NULL,
	[PublisherName] [varchar](30) NOT NULL,
	[CompanyAddress] [varchar](30) NOT NULL,
	[Zipcode] [varchar](10) NOT NULL,
	[CompanyWebsite] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[PublisherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[series]    Script Date: 2/29/2020 1:28:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[series](
	[SeriesID] [varchar](20) NOT NULL,
	[SeriesTitle] [varchar](30) NOT NULL,
	[TotalInSeries] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[SeriesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[zipcode]    Script Date: 2/29/2020 1:28:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zipcode](
	[Zipcode] [varchar](10) NOT NULL,
	[City] [varchar](30) NOT NULL,
	[State] [varchar](2) NULL,
	[Country] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Zipcode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_Zipcode3]    Script Date: 2/29/2020 1:28:35 PM ******/
CREATE NONCLUSTERED INDEX [idx_Zipcode3] ON [dbo].[authors]
(
	[Zipcode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_AuthorID]    Script Date: 2/29/2020 1:28:35 PM ******/
CREATE NONCLUSTERED INDEX [idx_AuthorID] ON [dbo].[bookauthor]
(
	[AuthorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_Isbn]    Script Date: 2/29/2020 1:28:35 PM ******/
CREATE NONCLUSTERED INDEX [idx_Isbn] ON [dbo].[bookauthor]
(
	[Isbn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_PublisherID]    Script Date: 2/29/2020 1:28:35 PM ******/
CREATE NONCLUSTERED INDEX [idx_PublisherID] ON [dbo].[books]
(
	[PublisherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_SeriesID]    Script Date: 2/29/2020 1:28:35 PM ******/
CREATE NONCLUSTERED INDEX [idx_SeriesID] ON [dbo].[books]
(
	[SeriesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_Zipcode2]    Script Date: 2/29/2020 1:28:35 PM ******/
CREATE NONCLUSTERED INDEX [idx_Zipcode2] ON [dbo].[distributors]
(
	[Zipcode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_Zipcode]    Script Date: 2/29/2020 1:28:35 PM ******/
CREATE NONCLUSTERED INDEX [idx_Zipcode] ON [dbo].[publishers]
(
	[Zipcode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[authors]  WITH CHECK ADD  CONSTRAINT [FK_Zipcode3] FOREIGN KEY([Zipcode])
REFERENCES [dbo].[zipcode] ([Zipcode])
GO
ALTER TABLE [dbo].[authors] CHECK CONSTRAINT [FK_Zipcode3]
GO
ALTER TABLE [dbo].[bookauthor]  WITH CHECK ADD  CONSTRAINT [FK_AuthorID] FOREIGN KEY([AuthorID])
REFERENCES [dbo].[authors] ([AuthorID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[bookauthor] CHECK CONSTRAINT [FK_AuthorID]
GO
ALTER TABLE [dbo].[bookauthor]  WITH CHECK ADD  CONSTRAINT [FK_Isbn] FOREIGN KEY([Isbn])
REFERENCES [dbo].[books] ([Isbn])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[bookauthor] CHECK CONSTRAINT [FK_Isbn]
GO
ALTER TABLE [dbo].[books]  WITH CHECK ADD  CONSTRAINT [FK_PublisherID] FOREIGN KEY([PublisherID])
REFERENCES [dbo].[publishers] ([PublisherID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[books] CHECK CONSTRAINT [FK_PublisherID]
GO
ALTER TABLE [dbo].[books]  WITH CHECK ADD  CONSTRAINT [FK_SeriesID] FOREIGN KEY([SeriesID])
REFERENCES [dbo].[series] ([SeriesID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[books] CHECK CONSTRAINT [FK_SeriesID]
GO
ALTER TABLE [dbo].[distributors]  WITH CHECK ADD  CONSTRAINT [FK_Zipcode2] FOREIGN KEY([Zipcode])
REFERENCES [dbo].[zipcode] ([Zipcode])
GO
ALTER TABLE [dbo].[distributors] CHECK CONSTRAINT [FK_Zipcode2]
GO
ALTER TABLE [dbo].[publishers]  WITH CHECK ADD  CONSTRAINT [FK_Zipcode] FOREIGN KEY([Zipcode])
REFERENCES [dbo].[zipcode] ([Zipcode])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[publishers] CHECK CONSTRAINT [FK_Zipcode]
GO
USE [master]
GO
ALTER DATABASE [myBookshelf] SET  READ_WRITE 
GO
