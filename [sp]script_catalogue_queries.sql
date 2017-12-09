USE [db_librarycatalogue]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*=============================================
		Query tables for specified data.
=============================================*/
CREATE PROCEDURE [dbo].[sharpstown_thelosttribe]
AS
BEGIN
SELECT a1.Title, b1.No_Of_Copies AS 'Copies Available', c1.BranchName AS 'Library'
	FROM book a1 
	INNER JOIN book_copies b1 ON a1.BookID = b1.BookID
	INNER JOIN library_branch c1 ON c1.BranchID = b1.branchID
	WHERE a1.BookID = 1 AND b1.BranchID = 1
;
END
GO

CREATE PROCEDURE [dbo].[branch_thelosttribe]
AS
BEGIN
SELECT a1.Title, b1.No_Of_Copies AS 'Copies Available', c1.BranchName AS 'Library'
	FROM book a1 
	INNER JOIN book_copies b1 ON a1.BookID = b1.BookID
	INNER JOIN library_branch c1 ON c1.BranchID = b1.branchID
	WHERE a1.BookID = 1
;
END
GO

CREATE PROCEDURE [dbo].[borrowers_nobooks]
AS
BEGIN
SELECT a1.Name, b1.BookID
	FROM borrower a1
	INNER JOIN book_loans b1 ON a1.CardNo = b1.CardNo
	WHERE BookID < 1
;
END
GO

CREATE PROCEDURE [dbo].[sharpstown_duetoday]
AS
BEGIN
SELECT a1.Title, b1.Name, b1.Address
	FROM book_loans c1
	INNER JOIN borrower b1 ON b1.CardNo = c1.CardNo
	INNER JOIN book a1 ON c1.BookID = a1.BookID
	WHERE c1.DueDate = '2017-12-15' AND c1.BranchID = 1
;
END
GO

CREATE PROCEDURE [dbo].[branch_loans]
AS
BEGIN
SELECT a1.BranchName, COUNT(b1.BookID) AS 'Books Loaned'
	FROM library_branch a1
	INNER JOIN book_loans b1 ON a1.BranchID = b1.BranchID
	GROUP BY a1.BranchName
;
END
GO

CREATE PROCEDURE [dbo].[more_than_five]
AS
BEGIN
SELECT a1.Name, a1.Address, COUNT(b1.CardNo) AS 'Books Loaned'
	FROM borrower a1
	INNER JOIN book_loans b1 ON b1.CardNo = a1.CardNo
	GROUP BY a1.Name, a1.Address
	HAVING COUNT(b1.CardNO) > 5
;
END
GO

CREATE PROCEDURE [dbo].[stephen_king]
AS
BEGIN
SELECT a1.AuthorName, b1.Title, c1.No_Of_Copies AS 'Copies at Central'
	FROM book_authors a1
	INNER JOIN book b1 ON a1.BookID = b1.BookID
	INNER JOIN book_copies c1 ON b1.BookID = c1.BookID
	WHERE a1.AuthorName = 'Stephen King' AND c1.BranchID = 2
;
END
GO