CREATE DATABASE db_librarycatalogue
USE db_librarycatalogue

/*=============================================
		Create Tables in Heirarchical Order
=============================================*/


CREATE TABLE publisher (
	Name VARCHAR(50) PRIMARY KEY NOT NULL,
	Address VARCHAR(50) NOT NULL,
	Phone VARCHAR(50) NOT NULL,
);

CREATE TABLE book (
	BookID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	Title VARCHAR(50) NOT NULL,
	PublisherName VARCHAR(50) NOT NULL CONSTRAINT fk_publisher_name FOREIGN KEY REFERENCES publisher(Name) ON UPDATE CASCADE ON DELETE CASCADE,
);

CREATE TABLE book_authors (
	BookID INT NOT NULL CONSTRAINT fk_bookid FOREIGN KEY REFERENCES book(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	AuthorName VARCHAR(50) NOT NULL
);

CREATE TABLE library_branch (
	BranchID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	BranchName VARCHAR(50) NOT NULL,
	Address VARCHAR(50) NOT NULL
);

CREATE TABLE book_copies (
	BookID INT NOT NULL CONSTRAINT fk_book_bookid FOREIGN KEY REFERENCES book(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_BranchID FOREIGN KEY REFERENCES Library_Branch(BranchID) ON UPDATE CASCAdE ON DELETE CASCADE,
	No_Of_Copies INT NOT NULL
);

CREATE TABLE borrower (
	CardNo INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	Name VARCHAR(50) NOT NULL,
	Address VARCHAR(50) NOT NULL,
	Phone VARCHAR(50) NOT NULL
);

CREATE TABLE book_loans (
	BookID INT NOT NULL CONSTRAINT fk_loans_bookid FOREIGN KEY REFERENCES book(BookID) ON UPDATE CASCAdE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_loans_branchid FOREIGN KEY REFERENCES Library_Branch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	CardNo VARCHAR(50) NOT NULL CONSTRAINT fk_borrower FOREIGN KEY REFERENCES Borrower(CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
	DateOut DATE NOT NULL,
	DueDate DATE NOT NULL
);

/*=============================================
		Populate Table Data
=============================================*/



/*=============================================
		Query tables for specified data.
=============================================*/