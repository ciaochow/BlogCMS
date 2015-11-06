USE [master]
GO
/****** Object:  Database [BlogCMS]    Script Date: 11/6/2015 10:55:32 AM ******/
CREATE DATABASE [BlogCMS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BlogCMS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQL2014\MSSQL\DATA\BlogCMS.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BlogCMS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQL2014\MSSQL\DATA\BlogCMS_log.ldf' , SIZE = 1024KB , MAXSIZE = 10240KB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BlogCMS] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BlogCMS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BlogCMS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BlogCMS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BlogCMS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BlogCMS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BlogCMS] SET ARITHABORT OFF 
GO
ALTER DATABASE [BlogCMS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BlogCMS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BlogCMS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BlogCMS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BlogCMS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BlogCMS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BlogCMS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BlogCMS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BlogCMS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BlogCMS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BlogCMS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BlogCMS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BlogCMS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BlogCMS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BlogCMS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BlogCMS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BlogCMS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BlogCMS] SET RECOVERY FULL 
GO
ALTER DATABASE [BlogCMS] SET  MULTI_USER 
GO
ALTER DATABASE [BlogCMS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BlogCMS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BlogCMS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BlogCMS] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [BlogCMS] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BlogCMS', N'ON'
GO
USE [BlogCMS]
GO
/****** Object:  Table [dbo].[Action]    Script Date: 11/6/2015 10:55:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Action](
	[ActionID] [int] IDENTITY(1,1) NOT NULL,
	[ActionName] [varchar](15) NOT NULL,
 CONSTRAINT [PK_Action] PRIMARY KEY CLUSTERED 
(
	[ActionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 11/6/2015 10:55:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Blog](
	[BlogID] [int] IDENTITY(1,1) NOT NULL,
	[WriterID] [int] NULL,
	[ContentID] [int] NULL,
	[DatePosted] [datetime] NULL,
	[DateExpired] [datetime] NULL,
	[StatusID] [int] NULL,
	[CategoryID] [int] NULL,
	[HistoryID] [int] NULL,
	[CommentID] [int] NULL,
	[TagDetailsID] [int] NULL,
	[Title] [varchar](100) NULL,
	[ImageURL] [varchar](300) NULL,
 CONSTRAINT [PK_Blog] PRIMARY KEY CLUSTERED 
(
	[BlogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Category]    Script Date: 11/6/2015 10:55:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](15) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 11/6/2015 10:55:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Comment](
	[CommentID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](15) NULL,
	[DatePosted] [datetime] NULL,
	[TheComment] [text] NULL,
	[ReplyToID] [int] NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Content]    Script Date: 11/6/2015 10:55:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Content](
	[ContentID] [int] IDENTITY(1,1) NOT NULL,
	[TheContent] [text] NOT NULL,
 CONSTRAINT [PK_Content] PRIMARY KEY CLUSTERED 
(
	[ContentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[History]    Script Date: 11/6/2015 10:55:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[History](
	[HistoryID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[Date] [datetime] NULL,
	[ActionID] [int] NULL,
	[Note] [text] NULL,
 CONSTRAINT [PK_History] PRIMARY KEY CLUSTERED 
(
	[HistoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HTML]    Script Date: 11/6/2015 10:55:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HTML](
	[HTMLID] [int] IDENTITY(1,1) NOT NULL,
	[BlockName] [varchar](15) NULL,
	[CodeBlock] [text] NULL,
 CONSTRAINT [PK_HTML] PRIMARY KEY CLUSTERED 
(
	[HTMLID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Role]    Script Date: 11/6/2015 10:55:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](15) NULL,
	[CanWrite] [bit] NULL,
	[CanEdit] [bit] NULL,
	[CanApprove] [bit] NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Status]    Script Date: 11/6/2015 10:55:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Status](
	[StatusID] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [varchar](15) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 11/6/2015 10:55:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tag](
	[TagID] [int] IDENTITY(1,1) NOT NULL,
	[TagName] [varchar](15) NOT NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TagDetails]    Script Date: 11/6/2015 10:55:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagDetails](
	[TagDetailsID] [int] IDENTITY(1,1) NOT NULL,
	[BlogID] [int] NULL,
	[TagID] [int] NULL,
 CONSTRAINT [PK_TagDetails] PRIMARY KEY CLUSTERED 
(
	[TagDetailsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 11/6/2015 10:55:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](15) NULL,
	[LastName] [varchar](15) NULL,
	[RoleID] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Blog] ON 

INSERT [dbo].[Blog] ([BlogID], [WriterID], [ContentID], [DatePosted], [DateExpired], [StatusID], [CategoryID], [HistoryID], [CommentID], [TagDetailsID], [Title], [ImageURL]) VALUES (1, 1, 1, CAST(N'2015-11-04 00:00:00.000' AS DateTime), NULL, 2, NULL, NULL, NULL, NULL, N'8675309 this is a much longer title lets see what happens to it', NULL)
INSERT [dbo].[Blog] ([BlogID], [WriterID], [ContentID], [DatePosted], [DateExpired], [StatusID], [CategoryID], [HistoryID], [CommentID], [TagDetailsID], [Title], [ImageURL]) VALUES (2, 1, 2, CAST(N'2015-11-04 00:00:00.000' AS DateTime), NULL, 2, NULL, NULL, NULL, NULL, N'"A test post"', N'http://jeffgernert.com/wp-content/uploads/2011/02/elephant-900x300.jpg')
INSERT [dbo].[Blog] ([BlogID], [WriterID], [ContentID], [DatePosted], [DateExpired], [StatusID], [CategoryID], [HistoryID], [CommentID], [TagDetailsID], [Title], [ImageURL]) VALUES (3, 1, 3, CAST(N'2013-01-01 00:00:00.000' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, N'Some Title', NULL)
INSERT [dbo].[Blog] ([BlogID], [WriterID], [ContentID], [DatePosted], [DateExpired], [StatusID], [CategoryID], [HistoryID], [CommentID], [TagDetailsID], [Title], [ImageURL]) VALUES (4, 1, 4, CAST(N'2013-01-01 00:00:00.000' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, N'Some Title', NULL)
INSERT [dbo].[Blog] ([BlogID], [WriterID], [ContentID], [DatePosted], [DateExpired], [StatusID], [CategoryID], [HistoryID], [CommentID], [TagDetailsID], [Title], [ImageURL]) VALUES (5, 1, 5, CAST(N'2015-11-05 00:00:00.000' AS DateTime), NULL, 4, NULL, NULL, NULL, NULL, N'gsfgsfdg', NULL)
INSERT [dbo].[Blog] ([BlogID], [WriterID], [ContentID], [DatePosted], [DateExpired], [StatusID], [CategoryID], [HistoryID], [CommentID], [TagDetailsID], [Title], [ImageURL]) VALUES (6, 1, 6, CAST(N'2015-11-05 00:00:00.000' AS DateTime), NULL, 5, NULL, NULL, NULL, NULL, N'Example ', N'http://jeffgernert.com/wp-content/uploads/2011/02/chiangmai-900x300-01.jpg')
INSERT [dbo].[Blog] ([BlogID], [WriterID], [ContentID], [DatePosted], [DateExpired], [StatusID], [CategoryID], [HistoryID], [CommentID], [TagDetailsID], [Title], [ImageURL]) VALUES (7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Blog] OFF
SET IDENTITY_INSERT [dbo].[Content] ON 

INSERT [dbo].[Content] ([ContentID], [TheContent]) VALUES (1, N'<p>897987987897987897987987987987987</p>')
INSERT [dbo].[Content] ([ContentID], [TheContent]) VALUES (2, N'"Same thing here"')
INSERT [dbo].[Content] ([ContentID], [TheContent]) VALUES (3, N'Some Value')
INSERT [dbo].[Content] ([ContentID], [TheContent]) VALUES (4, N'Some Value')
INSERT [dbo].[Content] ([ContentID], [TheContent]) VALUES (5, N'<p>sdfgsdfgsfb sfdg sfg sdf</p>')
INSERT [dbo].[Content] ([ContentID], [TheContent]) VALUES (6, N'<p>This is a test</p>')
SET IDENTITY_INSERT [dbo].[Content] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName], [CanWrite], [CanEdit], [CanApprove]) VALUES (1, N'Admin', 1, 1, 1)
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([StatusID], [StatusName]) VALUES (1, N'Pending')
INSERT [dbo].[Status] ([StatusID], [StatusName]) VALUES (2, N'Published')
INSERT [dbo].[Status] ([StatusID], [StatusName]) VALUES (3, N'Unpublished')
INSERT [dbo].[Status] ([StatusID], [StatusName]) VALUES (4, N'Expired')
INSERT [dbo].[Status] ([StatusID], [StatusName]) VALUES (5, N'Deleted')
SET IDENTITY_INSERT [dbo].[Status] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [FirstName], [LastName], [RoleID]) VALUES (1, N'Matt', N'Schley', 1)
SET IDENTITY_INSERT [dbo].[User] OFF
ALTER TABLE [dbo].[Blog]  WITH CHECK ADD  CONSTRAINT [FK_Blog_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Blog] CHECK CONSTRAINT [FK_Blog_Category]
GO
ALTER TABLE [dbo].[Blog]  WITH CHECK ADD  CONSTRAINT [FK_Blog_Comment] FOREIGN KEY([CommentID])
REFERENCES [dbo].[Comment] ([CommentID])
GO
ALTER TABLE [dbo].[Blog] CHECK CONSTRAINT [FK_Blog_Comment]
GO
ALTER TABLE [dbo].[Blog]  WITH CHECK ADD  CONSTRAINT [FK_Blog_Content] FOREIGN KEY([ContentID])
REFERENCES [dbo].[Content] ([ContentID])
GO
ALTER TABLE [dbo].[Blog] CHECK CONSTRAINT [FK_Blog_Content]
GO
ALTER TABLE [dbo].[Blog]  WITH CHECK ADD  CONSTRAINT [FK_Blog_History] FOREIGN KEY([HistoryID])
REFERENCES [dbo].[History] ([HistoryID])
GO
ALTER TABLE [dbo].[Blog] CHECK CONSTRAINT [FK_Blog_History]
GO
ALTER TABLE [dbo].[Blog]  WITH CHECK ADD  CONSTRAINT [FK_Blog_Status] FOREIGN KEY([StatusID])
REFERENCES [dbo].[Status] ([StatusID])
GO
ALTER TABLE [dbo].[Blog] CHECK CONSTRAINT [FK_Blog_Status]
GO
ALTER TABLE [dbo].[Blog]  WITH CHECK ADD  CONSTRAINT [FK_Blog_TagDetails] FOREIGN KEY([TagDetailsID])
REFERENCES [dbo].[TagDetails] ([TagDetailsID])
GO
ALTER TABLE [dbo].[Blog] CHECK CONSTRAINT [FK_Blog_TagDetails]
GO
ALTER TABLE [dbo].[Blog]  WITH CHECK ADD  CONSTRAINT [FK_Blog_User] FOREIGN KEY([WriterID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Blog] CHECK CONSTRAINT [FK_Blog_User]
GO
ALTER TABLE [dbo].[History]  WITH CHECK ADD  CONSTRAINT [FK_History_Action] FOREIGN KEY([ActionID])
REFERENCES [dbo].[Action] ([ActionID])
GO
ALTER TABLE [dbo].[History] CHECK CONSTRAINT [FK_History_Action]
GO
ALTER TABLE [dbo].[History]  WITH CHECK ADD  CONSTRAINT [FK_History_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[History] CHECK CONSTRAINT [FK_History_User]
GO
ALTER TABLE [dbo].[TagDetails]  WITH CHECK ADD  CONSTRAINT [FK_TagDetails_Tag] FOREIGN KEY([TagID])
REFERENCES [dbo].[Tag] ([TagID])
GO
ALTER TABLE [dbo].[TagDetails] CHECK CONSTRAINT [FK_TagDetails_Tag]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
USE [master]
GO
ALTER DATABASE [BlogCMS] SET  READ_WRITE 
GO
