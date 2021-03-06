USE [master]
GO

/****** Object:  Database [Dev]    Script Date: 10/26/2018 9:36:01 AM ******/
CREATE DATABASE [Dev]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Dev', FILENAME = N'C:\Data\MSSQL\Dev.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Dev_log', FILENAME = N'C:\Data\MSSQL\Dev_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

ALTER DATABASE [Dev] SET COMPATIBILITY_LEVEL = 120
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Dev].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [Dev] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [Dev] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [Dev] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [Dev] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [Dev] SET ARITHABORT OFF 
GO

ALTER DATABASE [Dev] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [Dev] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [Dev] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [Dev] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [Dev] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [Dev] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [Dev] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [Dev] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [Dev] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [Dev] SET  DISABLE_BROKER 
GO

ALTER DATABASE [Dev] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [Dev] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [Dev] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [Dev] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [Dev] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [Dev] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [Dev] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [Dev] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [Dev] SET  MULTI_USER 
GO

ALTER DATABASE [Dev] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [Dev] SET DB_CHAINING OFF 
GO

ALTER DATABASE [Dev] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [Dev] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO

ALTER DATABASE [Dev] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [Dev] SET  READ_WRITE 
GO


