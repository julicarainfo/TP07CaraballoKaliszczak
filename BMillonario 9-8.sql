USE [master]
GO
/****** Object:  Database [Millonario]    Script Date: 9/8/2022 08:59:17 ******/
CREATE DATABASE [Millonario]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Millonario', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Millonario.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Millonario_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Millonario_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Millonario] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Millonario].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Millonario] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Millonario] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Millonario] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Millonario] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Millonario] SET ARITHABORT OFF 
GO
ALTER DATABASE [Millonario] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Millonario] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Millonario] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Millonario] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Millonario] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Millonario] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Millonario] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Millonario] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Millonario] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Millonario] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Millonario] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Millonario] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Millonario] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Millonario] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Millonario] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Millonario] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Millonario] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Millonario] SET RECOVERY FULL 
GO
ALTER DATABASE [Millonario] SET  MULTI_USER 
GO
ALTER DATABASE [Millonario] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Millonario] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Millonario] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Millonario] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Millonario] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Millonario', N'ON'
GO
ALTER DATABASE [Millonario] SET QUERY_STORE = OFF
GO
USE [Millonario]
GO
/****** Object:  User [alumno]    Script Date: 9/8/2022 08:59:17 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Jugadores]    Script Date: 9/8/2022 08:59:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jugadores](
	[idJugador] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](200) NULL,
	[FechaHora] [datetime] NULL,
	[Pozo_Ganado] [int] NULL,
	[ComodinDobleChance] [bit] NULL,
	[Comodin50] [bit] NULL,
	[ComodinSaltear] [bit] NULL,
 CONSTRAINT [PK_Jugadores] PRIMARY KEY CLUSTERED 
(
	[idJugador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prreguntas]    Script Date: 9/8/2022 08:59:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prreguntas](
	[idPregunta] [int] IDENTITY(1,1) NOT NULL,
	[TextoPregunta] [varchar](200) NULL,
	[NivelDificultad] [int] NULL,
 CONSTRAINT [PK_Prreguntas] PRIMARY KEY CLUSTERED 
(
	[idPregunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Respuesta]    Script Date: 9/8/2022 08:59:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Respuesta](
	[idRespuesta] [int] IDENTITY(1,1) NOT NULL,
	[idPregunta] [int] NULL,
	[OpcionRespuesta] [char](10) NULL,
	[TextoRespuesta] [varchar](200) NULL,
	[Correcta] [bit] NULL,
 CONSTRAINT [PK_Respuesta] PRIMARY KEY CLUSTERED 
(
	[idRespuesta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Prreguntas] ON 

INSERT [dbo].[Prreguntas] ([idPregunta], [TextoPregunta], [NivelDificultad]) VALUES (1, N'¿Cuál de los siguientes equipos es el que ganó más copas Libertadores?', 1)
INSERT [dbo].[Prreguntas] ([idPregunta], [TextoPregunta], [NivelDificultad]) VALUES (2, N'¿En que año Cristobal Colon descubrió América?', 3)
INSERT [dbo].[Prreguntas] ([idPregunta], [TextoPregunta], [NivelDificultad]) VALUES (3, N'¿Qué porcentaje representa el agua en el peso de los seres humanos?', 2)
INSERT [dbo].[Prreguntas] ([idPregunta], [TextoPregunta], [NivelDificultad]) VALUES (4, N'¿Cuál es el resultado del cálculo: 455 - 215 x 2 ÷ 5 ', 3)
INSERT [dbo].[Prreguntas] ([idPregunta], [TextoPregunta], [NivelDificultad]) VALUES (5, N'¿Cuál de estos jugadores ganó más anillos de campeon de la nba?', 2)
INSERT [dbo].[Prreguntas] ([idPregunta], [TextoPregunta], [NivelDificultad]) VALUES (6, N'¿Quien fue Marco Aurelio?', 2)
INSERT [dbo].[Prreguntas] ([idPregunta], [TextoPregunta], [NivelDificultad]) VALUES (7, N'¿Cual es el Manga más vendido hasta el día de hoy?', 1)
INSERT [dbo].[Prreguntas] ([idPregunta], [TextoPregunta], [NivelDificultad]) VALUES (8, N'¿Cuál fue el mayor invento del ingeniero Nikola Tesla?', 3)
INSERT [dbo].[Prreguntas] ([idPregunta], [TextoPregunta], [NivelDificultad]) VALUES (9, N'¿Cuál es el país más perqueño del mundo?', 1)
INSERT [dbo].[Prreguntas] ([idPregunta], [TextoPregunta], [NivelDificultad]) VALUES (10, N'¿Cual es el nombre del protagonista del juego "Devil May Cry"?', 3)
INSERT [dbo].[Prreguntas] ([idPregunta], [TextoPregunta], [NivelDificultad]) VALUES (11, N'¿A qué serie pertenece el bar "The Garrison"?', 2)
INSERT [dbo].[Prreguntas] ([idPregunta], [TextoPregunta], [NivelDificultad]) VALUES (12, N'¿Quien fue el director de la primer trilogia de "Spiderman"?', 2)
INSERT [dbo].[Prreguntas] ([idPregunta], [TextoPregunta], [NivelDificultad]) VALUES (13, N'¿Cual de estos famosos gano alguna vez un titulo de kick boxing?', 1)
INSERT [dbo].[Prreguntas] ([idPregunta], [TextoPregunta], [NivelDificultad]) VALUES (14, N'¿Cual de estos famosos gano alguna vez un titulo de kick boxing?', 1)
INSERT [dbo].[Prreguntas] ([idPregunta], [TextoPregunta], [NivelDificultad]) VALUES (15, N'¿Cual de estas es la formula para sacar el area de un hexágono?', 3)
INSERT [dbo].[Prreguntas] ([idPregunta], [TextoPregunta], [NivelDificultad]) VALUES (16, N'¿Cual es la isla mas grande del mundo?', 3)
INSERT [dbo].[Prreguntas] ([idPregunta], [TextoPregunta], [NivelDificultad]) VALUES (17, N'¿En cual de estos juegos no esta la mecanica del rocket jump?', 3)
INSERT [dbo].[Prreguntas] ([idPregunta], [TextoPregunta], [NivelDificultad]) VALUES (18, N'¿Cual des estos autores cito la frase "Si de algo soy rico es de perplejidades, y no de certezas"?', 3)
INSERT [dbo].[Prreguntas] ([idPregunta], [TextoPregunta], [NivelDificultad]) VALUES (19, N'¿Cuál es el nombre completo del actor famoso "La Roca"?', 2)
INSERT [dbo].[Prreguntas] ([idPregunta], [TextoPregunta], [NivelDificultad]) VALUES (20, N'¿Cuál de estos sistemas operativos fue el primero en ser creado?', 3)
SET IDENTITY_INSERT [dbo].[Prreguntas] OFF
GO
SET IDENTITY_INSERT [dbo].[Respuesta] ON 

INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (1, 1, N'A         ', N'Boca Juniors', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (2, 1, N'B         ', N'River Plate', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (3, 1, N'C         ', N'Independiente', 1)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (4, 1, N'D         ', N'Argentino Juniors ', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (5, 2, N'A         ', N'1492', 1)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (6, 2, N'B         ', N'1498', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (7, 2, N'C         ', N'1502', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (8, 2, N'D         ', N'1592', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (9, 3, N'A         ', N'75%', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (10, 3, N'B         ', N'65%', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (11, 3, N'C         ', N'68%', 1)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (12, 3, N'D         ', N'73%', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (13, 4, N'A         ', N'366', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (14, 4, N'B         ', N'370', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (15, 4, N'C         ', N'360', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (16, 4, N'D         ', N'369', 1)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (17, 5, N'A         ', N'Bill Russell', 1)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (18, 5, N'B         ', N'Michael Jordan', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (19, 5, N'C         ', N'Sam Jones', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (20, 5, N'D         ', N'Stephen Curry', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (21, 6, N'A         ', N'Un gladiador romano', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (22, 6, N'B         ', N'Un pensador romano', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (23, 6, N'C         ', N'Un emperador romano', 1)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (24, 6, N'D         ', N'Un artista romano', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (25, 7, N'A         ', N'Dragon Bal', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (26, 7, N'B         ', N'One Piece', 1)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (27, 7, N'C         ', N'Naruto', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (28, 7, N'D         ', N'Pokemón', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (29, 8, N'A         ', N'Lámpara incandesiente', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (30, 8, N'B         ', N'La radio', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (31, 8, N'C         ', N'Transitores', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (32, 8, N'D         ', N'Corriente alterna', 1)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (33, 9, N'A         ', N'Mónaco', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (34, 9, N'B         ', N'Ciudad del Vaticano', 1)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (35, 9, N'C         ', N'Islas Marshall', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (36, 9, N'D         ', N'Tuvalu', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (37, 10, N'A         ', N'Dante', 1)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (38, 10, N'B         ', N'Alucard', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (39, 10, N'C         ', N'Joel', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (40, 10, N'D         ', N'Big Boss', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (41, 11, N'A         ', N'Daredevil', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (42, 11, N'B         ', N'Los Sopranos', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (43, 11, N'C         ', N'Narcos', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (44, 11, N'D         ', N'Peaky Blinders', 1)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (45, 12, N'A         ', N'Joe Russo ', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (46, 12, N'B         ', N'Jon Wats', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (47, 12, N'C         ', N'Sam Raimi', 1)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (48, 12, N'D         ', N'James Gunn', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (49, 13, N'A         ', N'Andrew Tate', 1)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (50, 13, N'B         ', N'Tristan Tate', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (51, 13, N'C         ', N'Michael Jordan', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (52, 13, N'D         ', N'Sylvester Stallone', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (53, 14, N'A         ', N'Una enfermedad', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (54, 14, N'B         ', N'Un sindrome', 1)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (55, 14, N'C         ', N'Una patología', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (56, 14, N'D         ', N'Un virus', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (57, 15, N'A         ', N'Perímetro por la apotema partido por dos', 1)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (58, 15, N'B         ', N'Perímetro por la apotema por dos', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (59, 15, N'C         ', N'Perímetro por la apotema', 0)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (60, 15, N'D         ', NULL, 0)
SET IDENTITY_INSERT [dbo].[Respuesta] OFF
GO
USE [master]
GO
ALTER DATABASE [Millonario] SET  READ_WRITE 
GO
