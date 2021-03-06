USE [master]
GO
/****** Object:  Database [blogDb]    Script Date: 2/19/2015 3:53:04 PM ******/
CREATE DATABASE [blogDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'blogDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\blogDb.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'blogDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\blogDb_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [blogDb] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [blogDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [blogDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [blogDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [blogDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [blogDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [blogDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [blogDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [blogDb] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [blogDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [blogDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [blogDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [blogDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [blogDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [blogDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [blogDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [blogDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [blogDb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [blogDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [blogDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [blogDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [blogDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [blogDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [blogDb] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [blogDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [blogDb] SET RECOVERY FULL 
GO
ALTER DATABASE [blogDb] SET  MULTI_USER 
GO
ALTER DATABASE [blogDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [blogDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [blogDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [blogDb] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'blogDb', N'ON'
GO
USE [blogDb]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 2/19/2015 3:53:04 PM ******/
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
/****** Object:  Table [dbo].[Articles]    Script Date: 2/19/2015 3:53:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Articles](
	[ArticleId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[PostedDate] [datetime] NOT NULL,
	[UserId] [int] NOT NULL,
	[IsPublished] [bit] NOT NULL,
	[NoOfView] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Articles] PRIMARY KEY CLUSTERED 
(
	[ArticleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Comments]    Script Date: 2/19/2015 3:53:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[CommentId] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[CommentDate] [datetime] NOT NULL,
	[ArticleId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Comments] PRIMARY KEY CLUSTERED 
(
	[CommentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 2/19/2015 3:53:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_dbo.Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201502180915079_NewColumnAdded', N'MonkBlog.Migrations.Configuration', 0x1F8B0800000000000400DD5BDB6EDC36107D2FD07F10F4D416C8CA4E51200D761338BB766134BEC0EBE435E04ADC35118A5445AEB3FEB63EF493FA0BA5EEBC8812B5373B7DF352E4E1CCF0CC70C8A1FFFDFB9FF1FB4D8CBD47983244C9C43F1D9DF81E24218D10594DFC355FBE7AE3BF7FF7E30FE3F328DE789FAB7EBF66FDC448C226FE03E7C9DB2060E1038C011BC5284C29A34B3E0A691C808806AF4F4E7E0F4E4F0328207C81E579E3BB35E12886F90FF1734A490813BE06F88A4610B3B25D7C99E7A8DE3588214B400827FE15255F3F60BA1A155D7DEF0C2320C49843BCF43D4008E5800B21DF7E6270CE534A56F34434007CFF9440D16F093083A5F06F9BEEAE7A9CBCCEF4089A815BD9C1AF35143A9E0B5BF0A74CBC5CCF897F96721462287712DDFE844F4A8368BA4D690253FE740797EAD0CBC8F7027578A08FAF479B43335926FE25E1BFBEF6BDEB35C66081616D3AC9C6734E53F8072430051C46B78073980A535E4630D7C910429BF21E71A166399D582C413ADFBB029B8F90ACF883586BB0F1BD0BB48151D5528AF08920C1513188A76BD837CB0CB2304549B158079EEB9632618899B0463555F6F7BDE07A8B21BBA1047FD3FEC5E8C6B864B7EB0546EC01D6401F28C51090C150D7F466F919C16F0305BA068F68959345C39BD238162C110E7C0771DE813DA0A4F0E351F9F14BC949D1E922A5F11DC5CDC0FADB977B90AE201772514B87395DA7E100D132CBB78A55227E293A3422C9EDF56C9538CAC74A56599471D04480CEB8502AB64D5C28876E1317A4A1C78A0BC7F4D852BDBDB8AC73083D80E75BD9DCF8D0AE8EA633DBEA893B3B5AEE2B4D846864523E189EAF7E6D737B675FCB45DBC2D1B6F1B063BA56A61701F13E76DD81ACBE058C7DA369D431F36F2787985864974B94C60EF3EF27A29CC700E1E3DBF702A58C5F3FCBD27E04479B79BB30E7B471EBD1A47557DF4B7AE318DEF478DB1EFC5CC2DB19633444B918AA7C4DE057F53A2791D7B70B144B2DED2262C1D798A304A350C830F17F31CCD5015B5BBF81ADCE411AECA9AF87E11B32831872E89D85C5596E0A58082273B9847922B545446E9866A113601127184F0122DC0CF388842801B847786DDCB0135A265E3D91FE65061348B210DFB32A3B4B504FA419AECF4EE340E25837F554F6DB08627185861D852F1F901A36595A98EAEC005BD1ADD5142E2BBD23C95AD57699B74A609F855E4AACB7AD68FB89AD37F47445B4F6BDA48FAF7B2148DBD447E0479B115F183D8AED508CE162044C4B01B2FBC3D9226B851BFD385D8C98436EE415CDD6AA93C4E0840AD1ECF406441D387A203293B58D2F48A50D966C6108219DF4A46EB6D3A0BE400E69412DB9ACB7B1D20E898004D4C8AC076D5555073368A99769838EDDC9617F92842E97AC43F5F66DC5C1805BE8AD66C0A6DAF6A8D91F371D56AA3F52F659AE43E72AEBADDDBCA91F044501A12A3404964AC3F80A248938B2489587B2C59B176587E9ABF9F09BFEB8C00842D672E15F4B5BCF244EF66005B5AF190B22981FEE66808305C80E45D32836BA3905B56A2E2DB6996B55C5996A40F67731482BC0D451D08CFCE5D80BA15546E35C416892C51C99177E0006A9FD7E6D4AF13A26BD09AD1DABAC3DC83865933B86724F2923291FDCF1E4EA810C27B7BBA355DBAC8C64DB7AED284A094186523EB8E335750419AC693591C6814624236D30E86AA4F62AFD9D9CA3630F70778ED62BFB1CA5CF39AC236D8695EEE965CB5A6FFEBBB0F64D6CE592BD45BAA1D4DE672018E626CF44C6624BDC85896D1BBB030DDB875983851E2306AF447137ADAF45D13A2090D677BD4A18AD5B873057BB3C56D9AB7D74C72D2F8965B4B2C91D43BAF19571A46677ACE60A57866A5A8FEC09464AA777A967AF533B2D851B97E954FF8B1223BF2ABAF89E30D1238AB2DC6AFE2436E078947518CDFFC2538CF2435BD5E10A10B4848CDFD3AF5024D422FD7BA3BD4BD9E28D48C05884BF8B872228B3456F5D6A604D41791B421E411A3E80F4A7186C7E96A1B67CFFB1139EF9C623127FF3DDDF78E476DCFD85C7020D87D15F77F48BF2BDBD5A380849F74DAD96C7085B73ABDD4D0F4CD0175E5F3F0809F492BA95015B95C92B34A350BE9F2AF84E74552ADDBBA96D54AF7783D32BD243D00E5044AD6F8A8F5CDD34AE598F58B5B2DF0B1DB828FA3F2B823E57D1F3F88CB11C51F75EB71AC293975FCA74E4486FE172BBFAE78B5EE82121E8D98B92E635BFE566483BFC75D4258B83ACC8211754AC6EB1E1596B6996AA6557D1B20DDF5AB36A2B695A2B9A6DC8ED65A163143B35532BC50B87DA665B4DEFA595328D02DC332AB6A75AE570B506ACF37ECA91E61D95082BD2FF468988C6D0AA81C8FE538AC0500928759F4BB2A4555CD324AABA6859F215E4409C2F41A6E312845C7C0E2163F9DBCDCF00AFF3147F01A34B72B3E6C99A0B9561BCC0CA23E32C3E76CD9FD75C5599C737F98999ED43052126CA8EC837E4C31AE1A896FBA225AFB7406481B73C0E666BC9B363E1EAA946BAA6C411A8345FBD5FDCC338C1028CDD9039788476D9FA6DA85A6C3C43609582989518CD78F153D02F8A37EFFE032289A301DD370000, N'6.0.0-20911')
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201502190815269_updateTable', N'MonkBlog.Migrations.Configuration', 0x1F8B0800000000000400DD5BDB6EDC36107D2FD07F10F4D416C8CA7650A035761338BB766134BEC0EBE435E04ADC35118A5445CA597F5B1FFA49FD8552778AA4246AAF4EDFBC14E77066383C2467E87FFFFE67FC7E1D62E719C60C5132714F4727AE03894F0344561337E1CB37BFB9EFDFFDF8C3F83208D7CEE7B2DFDBB49F90246CE23E711E9D7B1EF39F6008D828447E4C195DF2914F430F04D43B3B39F9DD3B3DF5A080700596E38C1F12C25108B31FE2E794121F463C01F8860610B3A25D7C9967A8CE2D08218B800F27EE0D255F3F60BA1AE55D5DE7022320D49843BC741D4008E5800B25CF3F3138E73125AB79241A007E7C89A0E8B70498C142F9F3BABBAD1D2767A91D5E2DB8911FDCCA4261E3A5F0057F49D5CBEC9CB81731473E867227D1ED4FF8D268104DF7318D60CC5F1EE0B2297A1DB88ED714F754F94A5A174D7599B8D784BF3D739DDB0463B0C0B0729DE4E339A731FC031218030E837BC0398C852BAF0398D9A429A10CF988B830B3184E4C96083AD7B901EB8F90ACF893986BB0769D2BB48641D952A8F0892011A34288C70934A8D83DEC0C323F46513E7B871EFC9E32E1AA99F0573976FAF7A3580D83A14484C7FDD3D58D71CDEE930546EC0956401F28C51090C150B7F46EF919C16F0315BA05CF689585938237A56128E2482CF10788B30EEC0945F94A1F151FBF14512B3A5DC5347CA0B816ACBE7D7904F10A72A1176DE930A749EC0F502DF5BC51AD02F14BDEA156496EAF462BD5697C2C759555197B354774324761D826CC51886EC21C92E8A198E3A84BB8B077276BD89A75F74005ADE15D2FAA6D579E1AEAAD4B73EB95972D9E9A326A9D1A1F342A687E35F180F5E2CB54DB60E56DB2E40EB9D652BB08088FB051DF03C6BED138E818F9D7937D0C7C1902840F6FEF158A19BF3D8AAB3F82838DBC19ED58EDACEAEA366EBB3B397F58D28DCA7F6632B2A19B0BC6A88F32359AFAD544DCB4EB92044E1F2BE7532DB1BA98F004731461E40B1D26EE2F9ABB3A602BEFD7B0E55546813D75555ABC2333882187CE859F5FC7A680F920D0A74BB82768B6082685714A65008B8B24E3314084EBB48B888F22807B9457E4865DB252F5AA81D42F33184192526ECFAC6CAD413590E2B83E3F8D3D29C6BA43AF19FD6D01D2B214EAE8C8D7F21E43A34D1743A45A2F808DC2CDE80A9B99DE32C88C66DB8C5B1E288F125E0DAE6F9B51F395AA977ABA18CDBC97F4C5EB4E02C434F401E2C3E4C457161EF9762864B8908071A1409A029C2DD256B856EFBBB9C41C72ED5C516FAD6A906831D184A8777A0DA2228E1E88D46526F93CA81461C9179A12D2CD4BEAD6763B5327C8E25850692EDBADCDB4C5414002AA755649BB69AA851B94A397EE838EDDC9627F92942EA6ACC374F3B662E1C00DEC6E9E8075B3DB59B39F372D66AA9F29FB3CD7617379EAAD96795D02F0F21A40592BF05A8A05E31B1045E2CA22150F8A16679E570EA66FE6C393F5618EE1F9CC90B3AFB4AD4612376DB082CAD7340A02985DEE66808305482F45D320D4BA59915A3996C26DFA5C953C530AA47FE7424A0DA562419DF90BD92B61551AC69981500F165D32ABDD000CE2F67CD794E22424BD07DA76ACA27C20E3144DF6188D44A28CD4F8608F27A7F76538B9DD1EADDC6665A4B6ADB71DA591E397A11A1FECF1EA44BF0C56B7EA48634F0924EDD8A085AB76B46F86BFD5E2E8D803EC178731A79EA1F42D8E56C936C74A8974D9B3ADA9F92EAC5D077623E96DD06E6868EF9208862D93230563BE256E1389A68DDD220CCD62AD64A172C4E099C873C5EA5CE4AD0388B4CAFD3668B46AB5472A92B9324CD1648F216566651CA9D91EAB4EB5CA5075EB8123563B7AA95DAAD1AB239872D41A17C79EFEC71BDA3928EFE23AC245CF2848CF40F317B15186A3B4C368FE179E62945DAECA0E3780A02564FC917E85E2E07B76727AA63C01D9E03986C75880BF8B371928F5456F3D6760EEBFF10C833C83D87F02F14F2158FFBC8BA715DB01EACF2502F137DFFEB944E6C9ED1F4B2CD07018F5A144BF2ADFDB0380BD84E9CE63CB50C7DF38B8CC2B75CF11FACA4BD37B8902B51ABD25BD2815E6124DAB316F5340DE4E45AD28BC1D9C5AE81D82B687DA6495803D70D150CB5E1EB018D49E6ED973ADF17F565B3C562DF1F011D372F3DB793968489CBCFE0AA1658CF4D603372B2BBEEA891E424147AFF5E9D9F396848B7257EB28F7E5F74E71DE5B5031BBF986D75AA26A290676D5024DF8ADA52053A5B0B550684236575B0E5143545CDDA80958940C4DA5B2D75621D4EA5A47346C4725C0E1660D98E7DD54F9F49492A015E9BF8604A331B4AA21D2FF2122D06F104AD5E79A2C69C96B8A466517E5947C033910774190DAB8043E179F7DC858F624F233C04976C45FC0E09ADC253C4AB83019860BDC784B9BF263D7F85929B3A9F3F82EBBDEB25D9820D444E975F68E7C48100E2ABDAF0CE7FA168894788BAB5B3A973CBDC2AD5E2AA45B4A2C810AF755FBC5230C232CC0D81D998367D8AE5BBF0F9B1E1BCF1058C5206405462D2F7E8AF00BC2F5BBFF0041A21AA3F7360000, N'6.0.0-20911')
SET IDENTITY_INSERT [dbo].[Articles] ON 

INSERT [dbo].[Articles] ([ArticleId], [Title], [Description], [PostedDate], [UserId], [IsPublished], [NoOfView]) VALUES (1, N'Inception', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius', CAST(0x0000A44400A4A4D3 AS DateTime), 1, 1, 0)
INSERT [dbo].[Articles] ([ArticleId], [Title], [Description], [PostedDate], [UserId], [IsPublished], [NoOfView]) VALUES (2, N'Second post', N'Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.', CAST(0x0000A44400C99291 AS DateTime), 2, 0, 1)
INSERT [dbo].[Articles] ([ArticleId], [Title], [Description], [PostedDate], [UserId], [IsPublished], [NoOfView]) VALUES (3, N'Test', N'This is test content', CAST(0x0000A44400000000 AS DateTime), 1, 1, 0)
INSERT [dbo].[Articles] ([ArticleId], [Title], [Description], [PostedDate], [UserId], [IsPublished], [NoOfView]) VALUES (4, N'Group Work', N'<p><strong>This is nothing but ckeditor</strong></p>

<p><strong>This is test.</strong></p>
', CAST(0x0000A4440100B421 AS DateTime), 1, 0, 1)
SET IDENTITY_INSERT [dbo].[Articles] OFF
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([CommentId], [Description], [CommentDate], [ArticleId], [UserId]) VALUES (4, N'This is a test comment', CAST(0x0000A44400BF3E36 AS DateTime), 1, 1)
INSERT [dbo].[Comments] ([CommentId], [Description], [CommentDate], [ArticleId], [UserId]) VALUES (5, N'This is a test comment', CAST(0x0000A44400BFB520 AS DateTime), 1, 1)
INSERT [dbo].[Comments] ([CommentId], [Description], [CommentDate], [ArticleId], [UserId]) VALUES (6, N'This is another test comment', CAST(0x0000A44400C2175E AS DateTime), 1, 1)
INSERT [dbo].[Comments] ([CommentId], [Description], [CommentDate], [ArticleId], [UserId]) VALUES (7, N'This is test comment', CAST(0x0000A4440103F611 AS DateTime), 4, 1)
SET IDENTITY_INSERT [dbo].[Comments] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Username], [Password], [Email], [FirstName], [LastName]) VALUES (1, N'hamim', N'123456', N'hamim@hamim.com', N'Hamim', N'Hayder')
INSERT [dbo].[Users] ([Id], [Username], [Password], [Email], [FirstName], [LastName]) VALUES (2, N'amir', N'123456', N'amir@amir.com', N'Amir', N'Hossain')
INSERT [dbo].[Users] ([Id], [Username], [Password], [Email], [FirstName], [LastName]) VALUES (3, N'amir', N'123456', N'amir@amir.com', N'Amir', N'Hossain')
SET IDENTITY_INSERT [dbo].[Users] OFF
/****** Object:  Index [IX_UserId]    Script Date: 2/19/2015 3:53:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[Articles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ArticleId]    Script Date: 2/19/2015 3:53:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_ArticleId] ON [dbo].[Comments]
(
	[ArticleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserId]    Script Date: 2/19/2015 3:53:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[Comments]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Articles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Articles_dbo.Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Articles] CHECK CONSTRAINT [FK_dbo.Articles_dbo.Users_UserId]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Comments_dbo.Articles_ArticleId] FOREIGN KEY([ArticleId])
REFERENCES [dbo].[Articles] ([ArticleId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_dbo.Comments_dbo.Articles_ArticleId]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Comments_dbo.Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_dbo.Comments_dbo.Users_UserId]
GO
USE [master]
GO
ALTER DATABASE [blogDb] SET  READ_WRITE 
GO
