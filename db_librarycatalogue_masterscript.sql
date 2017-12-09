/* Master script to create, populate, and query against db_librarycatalogue ~BeachTheSage*/

USE [master]
GO

	EXECUTE [dbo].[create_db_librarycatalogue]
	GO

USE [db_librarycatalogue]
GO
	/*run file [sp]populate_db_librarycatalogue*/
	
	EXECUTE [dbo].[populate_db_librarycatalogue]
	GO

	/*run file [sp]script_catalogue_queries*/

	/*Execute Query Scripts*/

	EXECUTE [dbo].[sharpstown_thelosttribe]
	GO

	EXECUTE [dbo].[branch_thelosttribe]
	GO

	EXECUTE [dbo].[borrowers_nobooks]
	GO

	EXECUTE [dbo].[sharpstown_duetoday]
	GO

	EXECUTE [dbo].[branch_loans]
	GO

	EXECUTE [dbo].[more_than_five]
	GO

	EXECUTE [dbo].[stephen_king]
	GO
