USE [master]
GO
/****** Object:  Database [BlogCMS]    Script Date: 11/12/2015 11:52:50 AM ******/
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
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 11/12/2015 11:52:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Action]    Script Date: 11/12/2015 11:52:50 AM ******/
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
/****** Object:  Table [dbo].[Archieve]    Script Date: 11/12/2015 11:52:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Archieve](
	[ArchieveID] [int] IDENTITY(1,1) NOT NULL,
	[Month] [varchar](15) NULL,
	[Year] [int] NULL,
 CONSTRAINT [PK_Archieve] PRIMARY KEY CLUSTERED 
(
	[ArchieveID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArchieveBlogs]    Script Date: 11/12/2015 11:52:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArchieveBlogs](
	[ArchieveBlogsID] [int] IDENTITY(1,1) NOT NULL,
	[ArchieveID] [int] NULL,
	[BlogID] [int] NULL,
 CONSTRAINT [PK_ArchieveBlogs] PRIMARY KEY CLUSTERED 
(
	[ArchieveBlogsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 11/12/2015 11:52:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 11/12/2015 11:52:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 11/12/2015 11:52:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 11/12/2015 11:52:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 11/12/2015 11:52:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Blog]    Script Date: 11/12/2015 11:52:50 AM ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 11/12/2015 11:52:50 AM ******/
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
/****** Object:  Table [dbo].[Comment]    Script Date: 11/12/2015 11:52:50 AM ******/
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
/****** Object:  Table [dbo].[Content]    Script Date: 11/12/2015 11:52:50 AM ******/
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
/****** Object:  Table [dbo].[History]    Script Date: 11/12/2015 11:52:50 AM ******/
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
/****** Object:  Table [dbo].[HTML]    Script Date: 11/12/2015 11:52:50 AM ******/
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
/****** Object:  Table [dbo].[Role]    Script Date: 11/12/2015 11:52:50 AM ******/
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
/****** Object:  Table [dbo].[Static]    Script Date: 11/12/2015 11:52:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Static](
	[StaticPageID] [int] IDENTITY(1,1) NOT NULL,
	[TheContent] [varchar](max) NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[LinkText] [varchar](20) NOT NULL,
	[ImageURL] [varchar](1000) NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Static] PRIMARY KEY CLUSTERED 
(
	[StaticPageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Status]    Script Date: 11/12/2015 11:52:50 AM ******/
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
/****** Object:  Table [dbo].[Tag]    Script Date: 11/12/2015 11:52:50 AM ******/
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
/****** Object:  Table [dbo].[TagDetails]    Script Date: 11/12/2015 11:52:50 AM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 11/12/2015 11:52:50 AM ******/
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
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201511091848488_InitialCreate', N'BlogCMS.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5C5B6FE3B6127E3F40FF83A0A7D383D4CAE5EC624F606F9175929EA09B0BD6D9C5795BD012ED082B51AA44A5098AFEB23EF427F52F9CA144C9E24D175BB19D628145440EBF190E87E47038F45F7FFC39FEF1290CAC479CA47E4426F6D1E8D0B6307123CF27CB899DD1C50FEFEC1FDF7FF78FF185173E595F4ABA1346072D493AB11F288D4F1D27751F7088D251E8BB4994460B3A72A3D0415EE41C1F1EFEC7393A723040D8806559E34F19A17E88F30FF89C46C4C531CD50701D7938487939D4CC7254EB0685388D918B27F687205A4EAF67A382D2B6CE021F8114331C2C6C0B1112514441C6D3CF299ED12422CB590C0528B87F8E31D02D5090622EFBE98ABC6B370E8F59379C55C312CACD521A853D018F4EB85E1CB9F95ADAB52BBD81E62E40C3F499F53AD7DEC4BEF2705EF4290A400132C3D3699030E2897D5DB1384BE31B4C4765C35101799900DCAF51F26D54473CB03AB73BA8ECE87874C8FE1D58D32CA059822704673441C1817597CD03DFFD193FDF47DF30999C1CCD1727EFDEBC45DEC9DB7FE39337F59E425F814E2880A2BB248A7102B2E145D57FDB72C4768EDCB06A566B5368056C09A6846D5DA3A78F982CE9034C96E377B675E93F61AF2CE1C6F599F83083A0114D32F8BCC98200CD035CD53B8D3CD9FF0D5C8FDFBC1D84EB0D7AF497F9D04BFC61E22430AF3EE120AF4D1FFCB8985EC2787FE564974914B26FD1BE8ADAAFB3284B5CD699C848728F9225A6A274636765BC9D4C9A410D6FD625EAFE9B369354356F2D29EBD03A33A164B1EDD950CAFBB27C3B5BDC591CC3E0E5A6C534D26470E24635925A1E58BC7E6532475D4D864057FECE2BE04588FC608025B00317F03C167E12E2AA971F223038447ACB7C87D2145600EFBF287D68101DFE1C40F41976B3040C73465118BF38B7BB8788E09B2C9C337BDF1EAFC186E6FED7E812B9344A2E086BB531DEC7C8FD1665F48278E788E2CFD42D01D9E7BD1F760718449C33D7C5697A09C68CBD69048E75097845E8C9716F38B638EDDA059906C80FF53E88B48C7E2D49577E889E42F1450C643A7FA449D48FD1D227DD442D49CDA21614ADA272B2BEA232B06E92724AB3A03941AB9C05D5601E5E3E42C3BB7839ECFEFB789B6DDEA6B5A0A6C619AC90F8274C7002CB98778728C509598D4097756317CE423E7C8CE98BEF4D39A72F28C88666B5D66CC81781E167430EBBFFB32117138A1F7D8F79251D0E3E2531C077A2D79FA9DAE79C24D9B6A783D0CD6D33DFCE1A609A2E67691AB97E3E0B34212F1EB010E5071FCE6A8F5E14BD912320D03130749F6D7950027DB365A3BA25E738C0145B676E11129CA2D4459EAA46E890D743B07247D508B68A8488C2FD4BE109968E13D608B143500A33D527549D163E71FD1805AD5A925A76DCC258DF2B1E72CD398E31610C5B35D185B93EF0C104A8F84883D2A6A1B153B3B866433478ADA6316F736157E3AEC423B662932DBEB3C12EB9FFF62286D9ACB12D1867B34ABA08600CE2EDC240F959A5AB01C807977D3350E9C4643050EE526DC540458DEDC0404595BC3A032D8EA85DC75F3AAFEE9B798A07E5ED6FEB8DEADA816D0AFAD833D32C7C4F6843A1054E54F33C9FB34AFC4435873390939FCF52EEEACA26C2C067988A219B95BFABF5439D6610D9889A005786D602CAAFFF14206542F510AE8CE5354AC7BD881EB065DCAD1196AFFD126CCD0654ECFA35688DD07C592A1B67A7D347D5B3CA1A1423EF7458A8E1680C425EBCC48E77508A292EAB2AA68B2FDCC71BAE758C0F4683825A3C578392CACE0CAEA5D234DBB5A473C8FAB8641B6949729F0C5A2A3B33B896B88DB62B49E314F4700B365291B8850F34D9CA4847B5DB547563A7C88CE20563C7904235BE4671EC93652DA58A9758B3229F6AFAC3AC7FB2515860386EAAC939AAA4AD38D128414B2CD5026B90F4D24F527A8E289A2316E7997AA142A6DD5B0DCB7FC9B2BE7DAA8358EE032535FBBB68215DDA0BFBACEA88F0F697D0BB90793379085D33F6FAE6164B6F43014A3451FB69146421313B57E6D6C5DD5DBD7D51A2228C1D497EC5795234A5B8B8A2DA3B0D8A3A210618A0CA6F597F90CC102655975E675DD9264FD48C5206A6EA28A660D5CE06CDE4C0741E28D92FEC3F4EAD082F339F78324A1D8017F5C4A8E5332860B5BAEEA862CA491D53ACE98E28E595D421A5AA1E52D6B3470421EB156BE11934AAA7E8CE41CD17A9A3ABB5DD9135992375684DF51AD81A99E5BAEEA89AE4923AB0A6BA3BF62AD3445E40F778C7329E56D6DAB28AC3EC667B9601E36556C361B6BCDA9D7D1DA856DC138BDFCA2B60BC7C2F2DC978A25BCB928AF8C5669664C030AF38C24DB7B8E0345ECF9B3185EB6B61516FBABE37E3F5B3D717B50AE530279354DCAB439D74781BF38354FB2319E5645590D856A946D8D09F538AC3112318CD7E09A6818FD9F25D125C23E22F704A8B940DFBF8F0E8587A6BB33FEF5E9C34F502CD41D4F4F8451CB32D645F914794B80F2851732136781BB20255C2CC57C4C34F13FBB7BCD5691EB1607FE5C507D655FA99F8BF6450719F64D8FA5DCDED1C2657BEF960B5A72F1BBA6BF5EA7F5F8BA607D66D0233E6D43A9474B9CE088BEF1D7A495334DD409AB55F41BCDE09253C35D0A24A1362FD9705739F0EF2AAA094F29F217AFABEAF68DA97031B216A5E070C8537880A4DD9FFEB601933FF3DF8A479E67FBFCEEA5F02AC239AF115804FFA83C96F00BA2F4365CB1D6E359AF3D03696A45CCFAD39D41B2554EE7A6F5252AD379AE86A3A750FB80D52A6D7B08C57966D3CD8EEA849261E0C7B97A6FDE219C4FB9234BC4AE7D86DAEF036D3831BAE82FE5659C17B90C7A6C9CBD97DEEEFB66DCD14C3DDF304CA7E19BE7B666C3C5B6BF779BCDB3636539877CF8DAD57B6EE9ED9DAAEF6CF1D5B5AE72D74E7B9B76A1A91E12E46170B6ECBAD2D02E770C29F4760048547593C89D427733525A2B6305C9198999AB3C864C6CAC451F82A14CD6CFBF5956FF88D9DE534CD6C0DB9974DBCF9FADFC89BD334F3366434EE222B589B53A8CBD46E59C79A129F5E5316B0D09396A4F3369FB5F162FD3525FD0EA21461F618EE885F4F8EEF202A1972EAF4C8E955AF7B61EFACFD7222ECDFA9BF5C41B0DF5124D81576CD8AE68A2CA272F396242A49A408CD35A6C8832DF52CA1FE02B914AA598C397FD39DC7EDD84DC71C7B57E436A37146A1CB389C0742C08B39014DFCF3C46551E6F16D9CFF3CC9105D00317D169BBF251F323FF02AB92F3531210304F32E7844978D256591DDE573857413918E405C7D9553748FC33800B0F496CCD0235E473630BF8F7889DCE75504D004D23E10A2DAC7E73E5A26284C39C6AA3D7C820D7BE1D3FBFF032A902FE640540000, N'6.1.3-40302')
SET IDENTITY_INSERT [dbo].[Archieve] ON 

INSERT [dbo].[Archieve] ([ArchieveID], [Month], [Year]) VALUES (1, N'September', 2015)
INSERT [dbo].[Archieve] ([ArchieveID], [Month], [Year]) VALUES (2, N'October', 2015)
INSERT [dbo].[Archieve] ([ArchieveID], [Month], [Year]) VALUES (3, N'November', 2015)
INSERT [dbo].[Archieve] ([ArchieveID], [Month], [Year]) VALUES (4, N'December', 2015)
SET IDENTITY_INSERT [dbo].[Archieve] OFF
SET IDENTITY_INSERT [dbo].[ArchieveBlogs] ON 

INSERT [dbo].[ArchieveBlogs] ([ArchieveBlogsID], [ArchieveID], [BlogID]) VALUES (1, 1, 7)
INSERT [dbo].[ArchieveBlogs] ([ArchieveBlogsID], [ArchieveID], [BlogID]) VALUES (2, 1, 8)
INSERT [dbo].[ArchieveBlogs] ([ArchieveBlogsID], [ArchieveID], [BlogID]) VALUES (3, 2, 3)
INSERT [dbo].[ArchieveBlogs] ([ArchieveBlogsID], [ArchieveID], [BlogID]) VALUES (4, 2, 4)
INSERT [dbo].[ArchieveBlogs] ([ArchieveBlogsID], [ArchieveID], [BlogID]) VALUES (5, 2, 2)
INSERT [dbo].[ArchieveBlogs] ([ArchieveBlogsID], [ArchieveID], [BlogID]) VALUES (6, 3, 1)
INSERT [dbo].[ArchieveBlogs] ([ArchieveBlogsID], [ArchieveID], [BlogID]) VALUES (7, 3, 5)
INSERT [dbo].[ArchieveBlogs] ([ArchieveBlogsID], [ArchieveID], [BlogID]) VALUES (8, 3, 6)
INSERT [dbo].[ArchieveBlogs] ([ArchieveBlogsID], [ArchieveID], [BlogID]) VALUES (9, 3, 9)
INSERT [dbo].[ArchieveBlogs] ([ArchieveBlogsID], [ArchieveID], [BlogID]) VALUES (10, 3, 10)
INSERT [dbo].[ArchieveBlogs] ([ArchieveBlogsID], [ArchieveID], [BlogID]) VALUES (11, 3, 11)
INSERT [dbo].[ArchieveBlogs] ([ArchieveBlogsID], [ArchieveID], [BlogID]) VALUES (12, 3, 12)
INSERT [dbo].[ArchieveBlogs] ([ArchieveBlogsID], [ArchieveID], [BlogID]) VALUES (13, 3, 13)
INSERT [dbo].[ArchieveBlogs] ([ArchieveBlogsID], [ArchieveID], [BlogID]) VALUES (14, 3, 13)
INSERT [dbo].[ArchieveBlogs] ([ArchieveBlogsID], [ArchieveID], [BlogID]) VALUES (15, 3, 14)
INSERT [dbo].[ArchieveBlogs] ([ArchieveBlogsID], [ArchieveID], [BlogID]) VALUES (16, 3, 15)
INSERT [dbo].[ArchieveBlogs] ([ArchieveBlogsID], [ArchieveID], [BlogID]) VALUES (17, 3, 16)
INSERT [dbo].[ArchieveBlogs] ([ArchieveBlogsID], [ArchieveID], [BlogID]) VALUES (18, 3, 17)
INSERT [dbo].[ArchieveBlogs] ([ArchieveBlogsID], [ArchieveID], [BlogID]) VALUES (19, 3, 3)
INSERT [dbo].[ArchieveBlogs] ([ArchieveBlogsID], [ArchieveID], [BlogID]) VALUES (20, 3, 4)
INSERT [dbo].[ArchieveBlogs] ([ArchieveBlogsID], [ArchieveID], [BlogID]) VALUES (21, 3, 6)
SET IDENTITY_INSERT [dbo].[ArchieveBlogs] OFF
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'1', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'2', N'Contributor')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'549f769d-7d96-4a22-a926-2d0fcfc89ae2', N'2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'd7705640-b1ed-49ab-b623-e42d0006ed58', N'1')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'549f769d-7d96-4a22-a926-2d0fcfc89ae2', N'nonadmin@example.com', 0, N'AFWoi0+ufDajdzoR5+FYblgU/AFRiC1SXJuWPvpA1PxzOspUMTqerQKxs1l8Cb7R8g==', N'08a5a4bc-129b-422d-9421-51d5e3e54da0', NULL, 0, 0, NULL, 1, 0, N'nonadmin@example.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'd7705640-b1ed-49ab-b623-e42d0006ed58', N'test@example.com', 0, N'AMnjrHpXTvrwDvP+lW7kmTX9VQTxJbvt3b5dzV8MQF2bfRuXaIcS4I/qTe5h++5rJw==', N'f93d72d7-00f3-47a4-af43-8c051ddad634', NULL, 0, 0, NULL, 1, 0, N'test@example.com')
SET IDENTITY_INSERT [dbo].[Blog] ON 

INSERT [dbo].[Blog] ([BlogID], [WriterID], [ContentID], [DatePosted], [DateExpired], [StatusID], [CategoryID], [HistoryID], [CommentID], [TagDetailsID], [Title], [ImageURL]) VALUES (1, 1, 1, CAST(N'2015-11-04 00:00:00.000' AS DateTime), NULL, 2, 2, NULL, NULL, NULL, N'8675309 this is a much longer title lets see what happens to itUnitTest', NULL)
INSERT [dbo].[Blog] ([BlogID], [WriterID], [ContentID], [DatePosted], [DateExpired], [StatusID], [CategoryID], [HistoryID], [CommentID], [TagDetailsID], [Title], [ImageURL]) VALUES (2, 1, 2, CAST(N'2015-10-04 00:00:00.000' AS DateTime), NULL, 2, 3, NULL, NULL, NULL, N'"A test post"', N'http://jeffgernert.com/wp-content/uploads/2011/02/elephant-900x300.jpg')
INSERT [dbo].[Blog] ([BlogID], [WriterID], [ContentID], [DatePosted], [DateExpired], [StatusID], [CategoryID], [HistoryID], [CommentID], [TagDetailsID], [Title], [ImageURL]) VALUES (3, 1, 3, CAST(N'2015-10-01 00:00:00.000' AS DateTime), NULL, 2, 1, NULL, NULL, NULL, N'Some Title', N'https://upload.wikimedia.org/wikipedia/commons/c/c5/Panthera_leo_5.JPG')
INSERT [dbo].[Blog] ([BlogID], [WriterID], [ContentID], [DatePosted], [DateExpired], [StatusID], [CategoryID], [HistoryID], [CommentID], [TagDetailsID], [Title], [ImageURL]) VALUES (4, 1, 4, CAST(N'2015-10-01 00:00:00.000' AS DateTime), NULL, 2, 1, NULL, NULL, NULL, N'Some Title', N'https://animalcorner.co.uk/wp/wp-content/uploads/2015/02/giraffe.jpg')
INSERT [dbo].[Blog] ([BlogID], [WriterID], [ContentID], [DatePosted], [DateExpired], [StatusID], [CategoryID], [HistoryID], [CommentID], [TagDetailsID], [Title], [ImageURL]) VALUES (5, 1, 5, CAST(N'2015-11-05 00:00:00.000' AS DateTime), NULL, 4, 1, NULL, NULL, NULL, N'gsfgsfdg', N'http://i.huffpost.com/gen/1570715/images/o-ELEPHANT-facebook.jpg')
INSERT [dbo].[Blog] ([BlogID], [WriterID], [ContentID], [DatePosted], [DateExpired], [StatusID], [CategoryID], [HistoryID], [CommentID], [TagDetailsID], [Title], [ImageURL]) VALUES (6, 1, 6, CAST(N'2015-11-05 00:00:00.000' AS DateTime), NULL, 2, 1, NULL, NULL, NULL, N'Example ', N'http://jeffgernert.com/wp-content/uploads/2011/02/chiangmai-900x300-01.jpg')
INSERT [dbo].[Blog] ([BlogID], [WriterID], [ContentID], [DatePosted], [DateExpired], [StatusID], [CategoryID], [HistoryID], [CommentID], [TagDetailsID], [Title], [ImageURL]) VALUES (7, 1, 15, CAST(N'2015-09-12 00:00:00.000' AS DateTime), NULL, 1, 3, NULL, NULL, NULL, N'Unit Testing', NULL)
INSERT [dbo].[Blog] ([BlogID], [WriterID], [ContentID], [DatePosted], [DateExpired], [StatusID], [CategoryID], [HistoryID], [CommentID], [TagDetailsID], [Title], [ImageURL]) VALUES (8, 1, 7, CAST(N'2015-09-07 00:00:00.000' AS DateTime), NULL, 5, 1, NULL, NULL, NULL, N'rdtfcvgybhn', N'http://jeffgernert.com/wp-content/uploads/2011/02/chiangmai-900x300-01.jpg')
INSERT [dbo].[Blog] ([BlogID], [WriterID], [ContentID], [DatePosted], [DateExpired], [StatusID], [CategoryID], [HistoryID], [CommentID], [TagDetailsID], [Title], [ImageURL]) VALUES (9, 1, 8, CAST(N'2015-11-08 00:00:00.000' AS DateTime), NULL, 1, 6, NULL, NULL, NULL, N'Testing Archieve', N'https://i.ytimg.com/vi/s9dbAfjlrks/maxresdefault.jpg')
INSERT [dbo].[Blog] ([BlogID], [WriterID], [ContentID], [DatePosted], [DateExpired], [StatusID], [CategoryID], [HistoryID], [CommentID], [TagDetailsID], [Title], [ImageURL]) VALUES (10, 1, 9, CAST(N'2015-11-08 00:00:00.000' AS DateTime), NULL, 1, 1, NULL, NULL, NULL, N'Achieve Test', N'Achieve Test')
INSERT [dbo].[Blog] ([BlogID], [WriterID], [ContentID], [DatePosted], [DateExpired], [StatusID], [CategoryID], [HistoryID], [CommentID], [TagDetailsID], [Title], [ImageURL]) VALUES (11, 1, 10, CAST(N'2015-11-08 00:00:00.000' AS DateTime), NULL, 1, 2, NULL, NULL, NULL, N'Achieve Test 11', N'Achieve Test 11')
INSERT [dbo].[Blog] ([BlogID], [WriterID], [ContentID], [DatePosted], [DateExpired], [StatusID], [CategoryID], [HistoryID], [CommentID], [TagDetailsID], [Title], [ImageURL]) VALUES (12, 1, 11, CAST(N'2015-11-08 00:00:00.000' AS DateTime), NULL, 1, 3, NULL, NULL, NULL, N'Archive Test 12', N'Archive Test 12Archive Test 12Archive Test 12')
INSERT [dbo].[Blog] ([BlogID], [WriterID], [ContentID], [DatePosted], [DateExpired], [StatusID], [CategoryID], [HistoryID], [CommentID], [TagDetailsID], [Title], [ImageURL]) VALUES (13, 1, 12, CAST(N'2015-11-09 00:00:00.000' AS DateTime), NULL, 2, NULL, NULL, NULL, NULL, N'test monday', NULL)
INSERT [dbo].[Blog] ([BlogID], [WriterID], [ContentID], [DatePosted], [DateExpired], [StatusID], [CategoryID], [HistoryID], [CommentID], [TagDetailsID], [Title], [ImageURL]) VALUES (14, 1, 13, CAST(N'2015-11-09 00:00:00.000' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, N'Test with HTML Decode', NULL)
INSERT [dbo].[Blog] ([BlogID], [WriterID], [ContentID], [DatePosted], [DateExpired], [StatusID], [CategoryID], [HistoryID], [CommentID], [TagDetailsID], [Title], [ImageURL]) VALUES (15, 1, 14, CAST(N'2015-11-09 00:00:00.000' AS DateTime), NULL, 1, 5, NULL, NULL, NULL, N'Contributor Monday post', NULL)
INSERT [dbo].[Blog] ([BlogID], [WriterID], [ContentID], [DatePosted], [DateExpired], [StatusID], [CategoryID], [HistoryID], [CommentID], [TagDetailsID], [Title], [ImageURL]) VALUES (16, 1, 15, CAST(N'2015-11-09 00:00:00.000' AS DateTime), NULL, 1, 5, NULL, NULL, NULL, N'Test Post on Monday with viewbag message', NULL)
INSERT [dbo].[Blog] ([BlogID], [WriterID], [ContentID], [DatePosted], [DateExpired], [StatusID], [CategoryID], [HistoryID], [CommentID], [TagDetailsID], [Title], [ImageURL]) VALUES (17, 1, 16, CAST(N'2015-11-09 00:00:00.000' AS DateTime), NULL, 1, 5, NULL, NULL, NULL, N'Test 3 with viewbag msg', NULL)
INSERT [dbo].[Blog] ([BlogID], [WriterID], [ContentID], [DatePosted], [DateExpired], [StatusID], [CategoryID], [HistoryID], [CommentID], [TagDetailsID], [Title], [ImageURL]) VALUES (18, 1, NULL, CAST(N'2015-11-12 11:05:24.103' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, N'Unit Test', NULL)
INSERT [dbo].[Blog] ([BlogID], [WriterID], [ContentID], [DatePosted], [DateExpired], [StatusID], [CategoryID], [HistoryID], [CommentID], [TagDetailsID], [Title], [ImageURL]) VALUES (19, 1, 18, CAST(N'2015-11-12 11:06:11.073' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, N'Unit Test', NULL)
SET IDENTITY_INSERT [dbo].[Blog] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (1, N'Finance')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (2, N'Business')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (3, N'Economics')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (4, N'Life Style')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (5, N'Politics')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (6, N'stereo')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (9, N'Programming')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (10, N'Farming')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (11, N'Testing')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (12, N'Unit Test')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Content] ON 

INSERT [dbo].[Content] ([ContentID], [TheContent]) VALUES (1, N'<p>897987987897987897987987987987987</p>')
INSERT [dbo].[Content] ([ContentID], [TheContent]) VALUES (2, N'"Same thing here"')
INSERT [dbo].[Content] ([ContentID], [TheContent]) VALUES (3, N'Some Value')
INSERT [dbo].[Content] ([ContentID], [TheContent]) VALUES (4, N'Some Value')
INSERT [dbo].[Content] ([ContentID], [TheContent]) VALUES (5, N'<p>sdfgsdfgsfb sfdg sfg sdf</p>')
INSERT [dbo].[Content] ([ContentID], [TheContent]) VALUES (6, N'<p>This is a test</p>')
INSERT [dbo].[Content] ([ContentID], [TheContent]) VALUES (7, N'<p>test test 1</p>')
INSERT [dbo].[Content] ([ContentID], [TheContent]) VALUES (8, N'<p style="box-sizing: border-box; margin: 0px 0px 1.9rem; padding: 0px; color: #333333; font-family: ''Segoe UI'', ''Segoe WP'', Arial, sans-serif; font-size: 18px; line-height: 25.992px;">At the airport in the Russian Arctic city of Murmansk, passengers file out from the morning flight from Moscow &mdash; many seemingly dazed by the surroundings and clearly underdressed for the coming polar winter.</p>
<p style="box-sizing: border-box; margin: 0px 0px 1.9rem; padding: 0px; color: #333333; font-family: ''Segoe UI'', ''Segoe WP'', Arial, sans-serif; font-size: 18px; line-height: 25.992px;">&ldquo;We are all from hell,&rdquo; says a passenger named Tomasi, an Iranian from Tehran, when asked where he and others had arrived from.</p>
<p style="box-sizing: border-box; margin: 0px 0px 1.9rem; padding: 0px; color: #333333; font-family: ''Segoe UI'', ''Segoe WP'', Arial, sans-serif; font-size: 18px; line-height: 25.992px;">Some are fleeing the violence of Syria, Afghanistan&nbsp;and Iraq. Others &mdash; joblessness and oppression elsewhere. Yet all are part a growing wave of refugees from the Middle East who have obtained Russian visas as a transit path to Norway.</p>
<p style="box-sizing: border-box; margin: 0px 0px 1.9rem; padding: 0px; color: #333333; font-family: ''Segoe UI'', ''Segoe WP'', Arial, sans-serif; font-size: 18px; line-height: 25.992px;">As word of the Arctic Route to Europe&nbsp;has spread on social media, Norwegian officials are increasingly expressing alarm over the influx of migrants who see Russia''s remote border with Norway as a safer and cheaper alternative to leaky boats on the Mediterranean.&nbsp;</p>
<p style="box-sizing: border-box; margin: 0px 0px 1.9rem; padding: 0px; color: #333333; font-family: ''Segoe UI'', ''Segoe WP'', Arial, sans-serif; font-size: 18px; line-height: 25.992px;">But the Russian journey, too, has its unique quirks along the way.</p>
<p style="box-sizing: border-box; margin: 0px 0px 1.9rem; padding: 0px; color: #333333; font-family: ''Segoe UI'', ''Segoe WP'', Arial, sans-serif; font-size: 18px; line-height: 25.992px;">From Murmansk, migrants must first make their way some 136 miles north &mdash; past barren tundra, Russian military bases and heavily armed checkpoints &mdash; to the small mining town of Nickel.</p>
<p style="box-sizing: border-box; margin: 0px 0px 1.9rem; padding: 0px; color: #333333; font-family: ''Segoe UI'', ''Segoe WP'', Arial, sans-serif; font-size: 18px; line-height: 25.992px;">There, refugees face a new twist: Russian law bans foot traffic at the border and Norway fines drivers for carrying migrants across &mdash; meaning the only way to cross is by bicycle.</p>
<p style="box-sizing: border-box; margin: 0px 0px 1.9rem; padding: 0px; color: #333333; font-family: ''Segoe UI'', ''Segoe WP'', Arial, sans-serif; font-size: 18px; line-height: 25.992px;">Yes, bicycle. &nbsp;</p>')
INSERT [dbo].[Content] ([ContentID], [TheContent]) VALUES (9, N'<p>Achieve TestAchieve TestAchieve TestAchieve Test</p>')
INSERT [dbo].[Content] ([ContentID], [TheContent]) VALUES (10, N'<p>Achieve Test 11Achieve Test 11Achieve Test 11Achieve Test 11</p>')
INSERT [dbo].[Content] ([ContentID], [TheContent]) VALUES (11, N'<p>Archive Test 12Archive Test 12Archive Test 12Archive Test 12Archive Test 12Archive Test 12</p>')
INSERT [dbo].[Content] ([ContentID], [TheContent]) VALUES (12, N'<p><strong>sdlfs;ldkfsd sdlfksjd;lf sldf;sdfjsd s;dlkfs;ldfj s;dlfkjsd;lfjksd.</strong></p>
<p><strong>sldkfjs;ldkfjsldkfs;l sdlkfjsdlkfjsldkfjsldjkf sldkfsldkjflsdkjflsdkjf sdlkfsldfjksldkfjsldk lskdjflskdjflskdjf ls dfklsjdlfksjdlfks jdflskdfj.</strong></p>
<p><strong>slkdfjsldkfjsdlkfjsdfsd.</strong></p>')
INSERT [dbo].[Content] ([ContentID], [TheContent]) VALUES (13, N'<p>Decoding decoding decoding decoding Decoding decoding decoding decoding Decoding decoding decoding decoding Decoding decoding decoding decoding Decoding decoding decoding decoding Decoding decoding decoding decoding Decoding decoding decoding decoding Decoding decoding decoding decoding Decoding decoding decoding decoding Decoding decoding decoding decoding Decoding decoding decoding decoding Decoding decoding decoding decodingDecoding decoding decoding decoding .</p>')
INSERT [dbo].[Content] ([ContentID], [TheContent]) VALUES (14, N'<p>Add an item on Monday. Let''s talk about politics. Blah blah. Blah blah blah</p>')
INSERT [dbo].[Content] ([ContentID], [TheContent]) VALUES (15, N'<p>Politics. Blah blah blah, complain complain about......</p>')
INSERT [dbo].[Content] ([ContentID], [TheContent]) VALUES (16, N'<p>politics blah blah blah complain bitch......</p>')
INSERT [dbo].[Content] ([ContentID], [TheContent]) VALUES (18, N'Unit Test - CanAddBlogPost')
SET IDENTITY_INSERT [dbo].[Content] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName], [CanWrite], [CanEdit], [CanApprove]) VALUES (1, N'Admin', 1, 1, 1)
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[Static] ON 

INSERT [dbo].[Static] ([StaticPageID], [TheContent], [Title], [LinkText], [ImageURL], [Active]) VALUES (2, N'<p>fasjhdfjkas;lkdj;fajks;ldkfj;las jd;fl</p>
<p>asldfj;alskjd;flkajs;djf;lasldjfa;lkjsdf</p>
<p>aklsdj;flajks;dlfkja;lskdjf;alksjd;flakjsd</p>
<p>askdjf;laksjd;fjkasdlfj;laksd;fkja;sldkjf;la4aklsdjf;lajksd;flk</p>
<p>aksdfasd</p>', N'Come to our Farm', N'Why', NULL, 1)
INSERT [dbo].[Static] ([StaticPageID], [TheContent], [Title], [LinkText], [ImageURL], [Active]) VALUES (3, N'<p>asjd;flakjsdfkj&nbsp;</p>
<p>askldjf;laks</p>', N'Hi there come to our village', N'Village', NULL, 1)
SET IDENTITY_INSERT [dbo].[Static] OFF
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([StatusID], [StatusName]) VALUES (1, N'Pending')
INSERT [dbo].[Status] ([StatusID], [StatusName]) VALUES (2, N'Published')
INSERT [dbo].[Status] ([StatusID], [StatusName]) VALUES (3, N'Unpublished')
INSERT [dbo].[Status] ([StatusID], [StatusName]) VALUES (4, N'Expired')
INSERT [dbo].[Status] ([StatusID], [StatusName]) VALUES (5, N'Deleted')
SET IDENTITY_INSERT [dbo].[Status] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [FirstName], [LastName], [RoleID]) VALUES (1, N'Matt', N'Schley', 1)
INSERT [dbo].[User] ([UserID], [FirstName], [LastName], [RoleID]) VALUES (2, N'Eric', N'Wise', 1)
INSERT [dbo].[User] ([UserID], [FirstName], [LastName], [RoleID]) VALUES (3, N'Dave', N'Balzer', NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 11/12/2015 11:52:50 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 11/12/2015 11:52:50 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 11/12/2015 11:52:50 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_RoleId]    Script Date: 11/12/2015 11:52:50 AM ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 11/12/2015 11:52:50 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 11/12/2015 11:52:50 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ArchieveBlogs]  WITH CHECK ADD  CONSTRAINT [FK_ArchieveBlogs_Archieve] FOREIGN KEY([ArchieveID])
REFERENCES [dbo].[Archieve] ([ArchieveID])
GO
ALTER TABLE [dbo].[ArchieveBlogs] CHECK CONSTRAINT [FK_ArchieveBlogs_Archieve]
GO
ALTER TABLE [dbo].[ArchieveBlogs]  WITH CHECK ADD  CONSTRAINT [FK_ArchieveBlogs_Blog] FOREIGN KEY([BlogID])
REFERENCES [dbo].[Blog] ([BlogID])
GO
ALTER TABLE [dbo].[ArchieveBlogs] CHECK CONSTRAINT [FK_ArchieveBlogs_Blog]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
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
