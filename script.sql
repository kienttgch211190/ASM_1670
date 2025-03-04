USE [master]
GO
/****** Object:  Database [ASM_1670]    Script Date: 17/04/2024 12:22:01 SA ******/
CREATE DATABASE [ASM_1670]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ASM_1670', FILENAME = N'D:\SQLsv\MSSQL15.SQLEXPRESS\MSSQL\DATA\ASM_1670.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ASM_1670_log', FILENAME = N'D:\SQLsv\MSSQL15.SQLEXPRESS\MSSQL\DATA\ASM_1670_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ASM_1670] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ASM_1670].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ASM_1670] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ASM_1670] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ASM_1670] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ASM_1670] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ASM_1670] SET ARITHABORT OFF 
GO
ALTER DATABASE [ASM_1670] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ASM_1670] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ASM_1670] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ASM_1670] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ASM_1670] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ASM_1670] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ASM_1670] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ASM_1670] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ASM_1670] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ASM_1670] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ASM_1670] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ASM_1670] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ASM_1670] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ASM_1670] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ASM_1670] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ASM_1670] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ASM_1670] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ASM_1670] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ASM_1670] SET  MULTI_USER 
GO
ALTER DATABASE [ASM_1670] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ASM_1670] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ASM_1670] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ASM_1670] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ASM_1670] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ASM_1670] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ASM_1670] SET QUERY_STORE = OFF
GO
USE [ASM_1670]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 17/04/2024 12:22:01 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 17/04/2024 12:22:01 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 17/04/2024 12:22:01 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 17/04/2024 12:22:01 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 17/04/2024 12:22:01 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 17/04/2024 12:22:01 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 17/04/2024 12:22:01 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 17/04/2024 12:22:01 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cv]    Script Date: 17/04/2024 12:22:01 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cv](
	[CvId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NULL,
	[Description] [nvarchar](max) NULL,
	[FullName] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Skill] [nvarchar](max) NOT NULL,
	[CvPicture] [nvarchar](max) NULL,
	[Experience] [nvarchar](max) NULL,
 CONSTRAINT [PK_Cv] PRIMARY KEY CLUSTERED 
(
	[CvId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Job]    Script Date: 17/04/2024 12:22:01 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Job](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NULL,
	[Title] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Qualifications] [nvarchar](max) NULL,
	[Salary] [decimal](18, 2) NULL,
	[Location] [nvarchar](max) NULL,
	[DeadLine] [datetime2](7) NULL,
	[JobPicture] [nvarchar](max) NULL,
	[Status] [nvarchar](max) NULL,
 CONSTRAINT [PK_Job] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobApplication]    Script Date: 17/04/2024 12:22:01 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobApplication](
	[JobApplicationId] [int] IDENTITY(1,1) NOT NULL,
	[CoverLetter] [nvarchar](max) NOT NULL,
	[JobId] [int] NULL,
	[UserId] [nvarchar](450) NULL,
 CONSTRAINT [PK_JobApplication] PRIMARY KEY CLUSTERED 
(
	[JobApplicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240410231826_initialCreate', N'8.0.3')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240411001051_abc', N'8.0.3')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'5cc84612-0c61-46b1-b690-097d9fec8ea1', N'Employers', N'EMPLOYERS', N'befb097b-b6a0-43b6-bfbd-ca5f263deacf')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'95f577a1-fef1-41b5-b0a7-df5a819b389f', N'Admin', N'ADMIN', NULL)
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'ea90d3e4-9e86-4d41-8725-2349a5ebc24e', N'Job Seekers', N'JOB SEEKERS', N'b0cedd31-ef85-41ba-a102-82f9d1c72166')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'bad121de-4de6-432c-8906-7b20316d3897', N'5cc84612-0c61-46b1-b690-097d9fec8ea1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'a9cb290a-d3bc-4aee-9caa-e8589ebe53e3', N'95f577a1-fef1-41b5-b0a7-df5a819b389f')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'5c2469c3-36f2-4c20-a431-cef62fbf4b0d', N'ea90d3e4-9e86-4d41-8725-2349a5ebc24e')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e46c3390-138a-4c2d-8907-48ce4859aef5', N'ea90d3e4-9e86-4d41-8725-2349a5ebc24e')
GO
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'5c2469c3-36f2-4c20-a431-cef62fbf4b0d', N'kien2', N'tran', N'test3@gmail.com', N'TEST3@GMAIL.COM', N'test3@gmail.com', N'TEST3@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAEE/5jcR7pCcMFUojIgIFcuFasIRc9aM83qfthhLHFokieKrzKkRuNzqF83MMvEn+ww==', N'AWTGMOR5T2K46PDAD37SBD6GALRBAAZ2', N'6a6cdb52-c402-42a4-8459-cf43320c11af', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'a9cb290a-d3bc-4aee-9caa-e8589ebe53e3', N'tran', N'kien', N'admin@gmail.com', N'ADMIN@GMAIL.COM', N'admin@gmail.com', N'ADMIN@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAEE1GEwsXgWVQDyVrcKAT0wkeuFqTzXDSkplhHn8eKvsNZ+qCWLMRy4fx8LsvNilr6A==', N'YXXPBZICRW6WVTVUFT7GNYQEEMCIDMDT', N'9851c66d-0a3a-4c16-8a7a-af61024d9385', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'bad121de-4de6-432c-8906-7b20316d3897', N'le', N'quan', N'test1@gmail.com', N'TEST1@GMAIL.COM', N'test1@gmail.com', N'TEST1@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAENL8FcKVsllgN05n2mnJo8j3jnnt5LgIoXw8/MoKfzth6N9sSMNhFtbhw7+cGsrSjA==', N'T6VAY7QUKKPCM2ZMOQR3S7AGEFJXXU2I', N'ad4d334d-5f3a-4b6e-9124-f57a40f635b4', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'e46c3390-138a-4c2d-8907-48ce4859aef5', N'kien1', N'tran', N'test2@gmail.com', N'TEST2@GMAIL.COM', N'test2@gmail.com', N'TEST2@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAEJ9BGcYa+VZbieq02OoHQvNc43X1drJhL+G9w/jViX4ymqAnYy9Yn/PCId9DQMxyvw==', N'E2GKSU45JJMG4LEKAVI67XI4DOPZY3DE', N'75f0c306-73a7-4718-9d09-f784ce2fcb86', NULL, 0, 0, NULL, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Cv] ON 

INSERT [dbo].[Cv] ([CvId], [UserId], [Description], [FullName], [Address], [Skill], [CvPicture], [Experience]) VALUES (3, N'5c2469c3-36f2-4c20-a431-cef62fbf4b0d', N'cxfasf', N'kienta', N'hanoi', N'sdfdsf', N'/images/d0ff1f74-4221-4692-86d2-aa9430cf99a7_python.png', N'sdfsdfd')
INSERT [dbo].[Cv] ([CvId], [UserId], [Description], [FullName], [Address], [Skill], [CvPicture], [Experience]) VALUES (1002, N'e46c3390-138a-4c2d-8907-48ce4859aef5', N'sdfsdf', N'kien1', N'cvxccxvc', N'master', N'/images/72deee39-f0bd-48be-b408-a2f9433dfd9d_c#.png', N'cxvvcxv')
INSERT [dbo].[Cv] ([CvId], [UserId], [Description], [FullName], [Address], [Skill], [CvPicture], [Experience]) VALUES (1004, N'bad121de-4de6-432c-8906-7b20316d3897', N'Em Tròn chào các cô các bác', N'Tròn', N'Vĩnh Tường', N'Ngủ', N'/images/07d35f6b-6a00-40a6-876d-727d80475d43_python.png', N'ádasdsa')
SET IDENTITY_INSERT [dbo].[Cv] OFF
GO
SET IDENTITY_INSERT [dbo].[Job] ON 

INSERT [dbo].[Job] ([Id], [UserId], [Title], [Description], [Qualifications], [Salary], [Location], [DeadLine], [JobPicture], [Status]) VALUES (5, N'5c2469c3-36f2-4c20-a431-cef62fbf4b0d', N'fsd', N'fds', N'fsd', CAST(6.00 AS Decimal(18, 2)), N'gdf', CAST(N'2024-04-11T21:39:00.0000000' AS DateTime2), N'/images/bb7d63c9-ac1d-4a47-a1b8-c6ff6c265b9d_python.png', N'Approved')
INSERT [dbo].[Job] ([Id], [UserId], [Title], [Description], [Qualifications], [Salary], [Location], [DeadLine], [JobPicture], [Status]) VALUES (7, N'5c2469c3-36f2-4c20-a431-cef62fbf4b0d', N'dcmsmdasmd', N'sdfsdf', N'sdfsdf', CAST(6456.00 AS Decimal(18, 2)), N'ádasds', CAST(N'2024-04-11T21:54:00.0000000' AS DateTime2), N'/images/36cb5167-a0ae-4333-819f-ddce6690daae_python.png', N'Approved')
INSERT [dbo].[Job] ([Id], [UserId], [Title], [Description], [Qualifications], [Salary], [Location], [DeadLine], [JobPicture], [Status]) VALUES (8, N'5c2469c3-36f2-4c20-a431-cef62fbf4b0d', N'fsd', N'fds', N'fsd', CAST(1.00 AS Decimal(18, 2)), N'gdf', CAST(N'2024-04-11T21:39:00.0000000' AS DateTime2), N'/images/55b4b4ae-e536-4244-b603-ab138ceb306b_python.png', N'Approved')
INSERT [dbo].[Job] ([Id], [UserId], [Title], [Description], [Qualifications], [Salary], [Location], [DeadLine], [JobPicture], [Status]) VALUES (2002, N'5c2469c3-36f2-4c20-a431-cef62fbf4b0d', N'Python', N'Python', N'Senior', CAST(2000.00 AS Decimal(18, 2)), N'Hanoi', CAST(N'2024-04-11T00:27:00.0000000' AS DateTime2), N'/images/8fcf5939-9636-42f2-a5f7-63c15df1687d_chu-ky-kien-removebg-preview.png', N'Approved')
INSERT [dbo].[Job] ([Id], [UserId], [Title], [Description], [Qualifications], [Salary], [Location], [DeadLine], [JobPicture], [Status]) VALUES (2003, N'bad121de-4de6-432c-8906-7b20316d3897', N'Python', N'Python', N'Senior', CAST(2000.00 AS Decimal(18, 2)), N'Hanoi, Vietnam', CAST(N'2024-04-16T23:42:00.0000000' AS DateTime2), N'/images/34d41afa-0e7d-4716-bc42-a725278316be_python.png', N'Approved')
SET IDENTITY_INSERT [dbo].[Job] OFF
GO
SET IDENTITY_INSERT [dbo].[JobApplication] ON 

INSERT [dbo].[JobApplication] ([JobApplicationId], [CoverLetter], [JobId], [UserId]) VALUES (1, N'werfsdfs', 5, N'e46c3390-138a-4c2d-8907-48ce4859aef5')
SET IDENTITY_INSERT [dbo].[JobApplication] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 17/04/2024 12:22:02 SA ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 17/04/2024 12:22:02 SA ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 17/04/2024 12:22:02 SA ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 17/04/2024 12:22:02 SA ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 17/04/2024 12:22:02 SA ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 17/04/2024 12:22:02 SA ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 17/04/2024 12:22:02 SA ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Cv_UserId]    Script Date: 17/04/2024 12:22:02 SA ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Cv_UserId] ON [dbo].[Cv]
(
	[UserId] ASC
)
WHERE ([UserId] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Job_UserId]    Script Date: 17/04/2024 12:22:02 SA ******/
CREATE NONCLUSTERED INDEX [IX_Job_UserId] ON [dbo].[Job]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_JobApplication_JobId]    Script Date: 17/04/2024 12:22:02 SA ******/
CREATE NONCLUSTERED INDEX [IX_JobApplication_JobId] ON [dbo].[JobApplication]
(
	[JobId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_JobApplication_UserId]    Script Date: 17/04/2024 12:22:02 SA ******/
CREATE NONCLUSTERED INDEX [IX_JobApplication_UserId] ON [dbo].[JobApplication]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Cv]  WITH CHECK ADD  CONSTRAINT [FK_Cv_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Cv] CHECK CONSTRAINT [FK_Cv_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Job]  WITH CHECK ADD  CONSTRAINT [FK_Job_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Job] CHECK CONSTRAINT [FK_Job_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[JobApplication]  WITH CHECK ADD  CONSTRAINT [FK_JobApplication_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[JobApplication] CHECK CONSTRAINT [FK_JobApplication_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[JobApplication]  WITH CHECK ADD  CONSTRAINT [FK_JobApplication_Job_JobId] FOREIGN KEY([JobId])
REFERENCES [dbo].[Job] ([Id])
GO
ALTER TABLE [dbo].[JobApplication] CHECK CONSTRAINT [FK_JobApplication_Job_JobId]
GO
USE [master]
GO
ALTER DATABASE [ASM_1670] SET  READ_WRITE 
GO
