/* This is a database project for my studies with the Tech Academy. They asked me to create and populate a library database, then to create stored procedures to run specified queries against several tables. ~BeachTheSage*/

USE [master]
GO
/****** Object:  StoredProcedure [dbo].[create_db_librarycatalogue]    Script Date: 12/8/2017 3:50:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[create_db_librarycatalogue]
AS
BEGIN

	/******************************************************
	 * The following prevents any errors from occuring
	 * if the database or tables already exist.
	 * This code will close all active connections to the 
	 * database and then drop it
	 ******************************************************/

	WHILE EXISTS(select * from sys.databases where name='db_librarycatalogue')
	BEGIN
		DECLARE @SQL varchar(max)
		SELECT @SQL = COALESCE(@SQL,'') + 'Kill ' + Convert(varchar, SPId) + ';'
		FROM MASTER.sys.sysprocesses
		WHERE DBId = DB_ID(N'db_librarycatalogue') AND SPId <> @@SPId
		EXEC(@SQL)
		DROP DATABASE [db_librarycatalogue]
	END

	CREATE DATABASE db_librarycatalogue

END

GO
