USE [master]
GO
/****** Object:  Database [GeneticsTest]    Script Date: 26/04/2023 10:32:53 ******/
CREATE DATABASE [GeneticsTest]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GeneticsTest', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\GeneticsTest.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'GeneticsTest_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\GeneticsTest_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [GeneticsTest] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GeneticsTest].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GeneticsTest] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GeneticsTest] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GeneticsTest] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GeneticsTest] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GeneticsTest] SET ARITHABORT OFF 
GO
ALTER DATABASE [GeneticsTest] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [GeneticsTest] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GeneticsTest] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GeneticsTest] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GeneticsTest] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GeneticsTest] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GeneticsTest] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GeneticsTest] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GeneticsTest] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GeneticsTest] SET  ENABLE_BROKER 
GO
ALTER DATABASE [GeneticsTest] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GeneticsTest] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GeneticsTest] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GeneticsTest] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GeneticsTest] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GeneticsTest] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GeneticsTest] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GeneticsTest] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GeneticsTest] SET  MULTI_USER 
GO
ALTER DATABASE [GeneticsTest] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GeneticsTest] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GeneticsTest] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GeneticsTest] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [GeneticsTest] SET DELAYED_DURABILITY = DISABLED 
GO
USE [GeneticsTest]
GO
/****** Object:  UserDefinedFunction [dbo].[avg_seq_length]    Script Date: 26/04/2023 10:32:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[avg_seq_length] ()
RETURNS FLOAT AS
BEGIN
  DECLARE @avg_length float;
  set @avg_length = (SELECT AVG(LEN(sequence_)) from Genome) 
  
  RETURN @avg_length;
END;
GO
/****** Object:  Table [dbo].[Genome]    Script Date: 26/04/2023 10:32:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Genome](
	[organism_id] [int] NULL,
	[sequence_] [varchar](100) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Institute]    Script Date: 26/04/2023 10:32:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Institute](
	[institute_id] [int] NOT NULL,
	[location] [varchar](30) NULL,
	[boss_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[institute_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Institute_Researches]    Script Date: 26/04/2023 10:32:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Institute_Researches](
	[research_id] [int] NULL,
	[institute_id] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Organism]    Script Date: 26/04/2023 10:32:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Organism](
	[organism_id] [int] NOT NULL,
	[scientific_name] [varchar](50) NULL,
	[dominium] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[organism_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Protein]    Script Date: 26/04/2023 10:32:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Protein](
	[protein_id] [int] NOT NULL,
	[functionality] [varchar](100) NULL,
	[protein_name] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[protein_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Research]    Script Date: 26/04/2023 10:32:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Research](
	[research_id] [int] NOT NULL,
	[organism_id] [int] NULL,
	[budget] [float] NULL,
	[objective] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[research_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Researcher]    Script Date: 26/04/2023 10:32:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Researcher](
	[researcher_id] [int] IDENTITY(1,1) NOT NULL,
	[researcher_name] [varchar](20) NULL,
	[researcher_surname] [varchar](20) NULL,
	[field_of_studies] [varchar](30) NULL,
	[is_boss] [bit] NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[researcher_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Researchers_Institutes]    Script Date: 26/04/2023 10:32:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Researchers_Institutes](
	[researcher_id] [int] NULL,
	[institute_id] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SequenceHighlight]    Script Date: 26/04/2023 10:32:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SequenceHighlight](
	[sequence_] [varchar](100) NOT NULL,
	[highlight_prot_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[sequence_] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Genome]  WITH CHECK ADD FOREIGN KEY([organism_id])
REFERENCES [dbo].[Organism] ([organism_id])
GO
ALTER TABLE [dbo].[Genome]  WITH CHECK ADD FOREIGN KEY([sequence_])
REFERENCES [dbo].[SequenceHighlight] ([sequence_])
GO
ALTER TABLE [dbo].[Institute_Researches]  WITH CHECK ADD FOREIGN KEY([institute_id])
REFERENCES [dbo].[Institute] ([institute_id])
GO
ALTER TABLE [dbo].[Institute_Researches]  WITH CHECK ADD FOREIGN KEY([research_id])
REFERENCES [dbo].[Research] ([research_id])
GO
ALTER TABLE [dbo].[Research]  WITH CHECK ADD FOREIGN KEY([organism_id])
REFERENCES [dbo].[Organism] ([organism_id])
GO
ALTER TABLE [dbo].[Researchers_Institutes]  WITH CHECK ADD FOREIGN KEY([institute_id])
REFERENCES [dbo].[Institute] ([institute_id])
GO
ALTER TABLE [dbo].[Researchers_Institutes]  WITH CHECK ADD FOREIGN KEY([researcher_id])
REFERENCES [dbo].[Researcher] ([researcher_id])
GO
ALTER TABLE [dbo].[SequenceHighlight]  WITH CHECK ADD FOREIGN KEY([highlight_prot_id])
REFERENCES [dbo].[Protein] ([protein_id])
GO
/****** Object:  StoredProcedure [dbo].[insertGenome]    Script Date: 26/04/2023 10:32:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertGenome]
    @id INT,
    @sequence VARCHAR(100)
AS
BEGIN
    INSERT INTO [dbo].[Genome](organism_id, sequence_)
    VALUES (@id, @sequence)
END
GO
/****** Object:  StoredProcedure [dbo].[insertInstitute]    Script Date: 26/04/2023 10:32:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertInstitute]
    @id INT,
    @location Varchar(20),
    @boss INT
AS
BEGIN
    INSERT INTO [dbo].[Institute] (institute_id, location, boss_id)
    VALUES (@id, @location, @boss)
END
GO
/****** Object:  StoredProcedure [dbo].[insertOrganism]    Script Date: 26/04/2023 10:32:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertOrganism]
    @id INT,
    @name VARCHAR(50),
    @dominium VARCHAR(20)
AS
BEGIN
    INSERT INTO Organism(organism_id, scientific_name, dominium)
    VALUES (@id, @name, @dominium)
END
GO
/****** Object:  StoredProcedure [dbo].[insertProtein]    Script Date: 26/04/2023 10:32:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertProtein]
    @id INT,
    @functionality VARCHAR(100),
	@name VARCHAR(50)
AS
BEGIN
    INSERT INTO [dbo].[Protein](protein_id,functionality,protein_name)
    VALUES (@id, @functionality,@name)
END
GO
/****** Object:  StoredProcedure [dbo].[insertResearch]    Script Date: 26/04/2023 10:32:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertResearch]
    @id INT,
    @orgid INT,
    @budget FLOAT,
	@objective VARCHAR(100)
AS
BEGIN
    INSERT INTO [dbo].[Research](research_id, organism_id, budget,objective)
    VALUES (@id, @orgid, @budget,@objective)
END
GO
/****** Object:  StoredProcedure [dbo].[insertResearcher]    Script Date: 26/04/2023 10:32:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertResearcher]
@name VARCHAR(20),
@surname VARCHAR(20),
@field VARCHAR(30)
AS
BEGIN

    BEGIN TRY
       
	    INSERT INTO Researcher (researcher_name, researcher_surname, field_of_studies)
		VALUES (@name, @surname,@field)
        
    END TRY
        
		BEGIN CATCH
            
			SELECT  ERROR_MESSAGE() as 'An error occurred'
        
		END CATCH
        
     
END
GO
/****** Object:  StoredProcedure [dbo].[insertSeqHigh]    Script Date: 26/04/2023 10:32:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertSeqHigh]
    @sequence VARCHAR(100),
    @highProt INT
AS
BEGIN
    INSERT INTO [dbo].[SequenceHighlight](sequence_, highlight_prot_id)
    VALUES (@sequence, @highProt)
END
GO
USE [master]
GO
ALTER DATABASE [GeneticsTest] SET  READ_WRITE 
GO
