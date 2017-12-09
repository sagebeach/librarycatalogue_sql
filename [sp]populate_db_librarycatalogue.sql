/* This is a database project for my studies with the Tech Academy. They asked me to create and populate a library database, then to create stored procedures to run specified queries against several tables. ~BeachTheSage*/

USE [db_librarycatalogue]
GO
/****** Object:  StoredProcedure [dbo].[populate_db_librarycatalogue]    Script Date: 12/8/2017 3:45:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*=============================================
		Create Tables in Heirarchical Order
=============================================*/

CREATE PROCEDURE populate_db_librarycatalogue
AS
BEGIN

CREATE TABLE publisher (
	Name VARCHAR(50) PRIMARY KEY NOT NULL,
	Address VARCHAR(100) NOT NULL,
	Phone VARCHAR(50) NULL,
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
	BranchID INT NOT NULL CONSTRAINT fk_BranchID FOREIGN KEY REFERENCES Library_Branch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	No_Of_Copies INT NOT NULL
);

CREATE TABLE borrower (
	CardNo INT PRIMARY KEY NOT NULL IDENTITY (1000,10),
	Name VARCHAR(50) NOT NULL,
	Address VARCHAR(50) NOT NULL,
	Phone VARCHAR(50) NOT NULL
);

CREATE TABLE book_loans (
	BookID INT NOT NULL CONSTRAINT fk_loans_bookid FOREIGN KEY REFERENCES book(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_Loans_BranchID FOREIGN KEY REFERENCES Library_Branch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	CardNo INT NOT NULL CONSTRAINT fk_Loans_CardNo FOREIGN KEY REFERENCES borrower(CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
	DateOut DATE NOT NULL,
	DueDate DATE NOT NULL
);
/*=============================================
		Populate Table Data
=============================================*/

INSERT INTO publisher
		(Name, Address, Phone)
		VALUES
		('Tor/Forge', '175 Fifth Avenue New York, NY 10010', '(212) 677-7456'),
		('Headline Publishing Group', 'Carmelite House 50 Victoria Embankment London EC4Y 0DZ', '+44 20 3122 7222'),
		('Fiction Publishing', '42 wallaby way Sydney, Australia', ''),
		('Wizards of the Coast', 'Renton Washington', '(425) 226-6500'),
		('Riverhead Books', '375 Hudson St, New York, NY 10014', ''),
		('Oxford University Press', '198 Madison Avenue New York, NY 10016', ''),
		('Random House', 'NA', 'NA'),
		('Crown Publishers', 'NA', 'NA'),
		('Simon and Schuster', 'NA', 'NA')
	;
	SELECT * FROM publisher;

INSERT INTO book
		(Title, PublisherName)
		VALUES
		('The Lost Tribe', 'Fiction Publishing'),
		('Superintelligence', 'Oxford University Press'),
		('Chronicles of the Black Company', 'Tor/Forge'),
		('The Books of the South', 'Tor/Forge'),
		('The Return of the Black Company', 'Tor/Forge'),
		('The Many Deaths of the Black Company', 'Tor/Forge'),
		('Across the Nightingale Floor', 'Riverhead Books'),
		('Grass for His Pillow', 'Riverhead Books'),
		('Brilliance of the Moon', 'Riverhead Books'),
		('Heavens Net is Wide', 'Riverhead Books'),
		('The Harsh Cry of the Heron', 'Riverhead Books'),
		('Snow Falling on Cedars', 'Random House'),
		('The 4-Hour Work Week', 'Crown Publishers'),
		('How to Win Friends and Influence People', 'Simon and Schuster'),
		('Homeland', 'Wizards of the Coast'),
		('Exile', 'Wizards of the Coast'),
		('Sojourn', 'Wizards of the Coast'),
		('The Dragonlance Chronicles', 'Random House'),
		('The Way of Kings', 'Tor/Forge'),
		('Dance Dance Dance', 'Random House'),
		('The Tower', 'Random House')
	;
	SELECT * FROM book;

INSERT INTO book_authors
		(BookID, AuthorName)
		VALUES
		(1, 'Simba'),
		(15, 'R.A. Salvatore'),
		(16, 'R.A. Salvatore'),
		(17, 'R.A. Salvatore'),
		(19, 'Brandon Sanderson'),
		(3, 'Glen Cook'),
		(4, 'Glen Cook'),
		(5, 'Glen Cook'),
		(6, 'Glen Cook'),
		(18, 'Margaret Weis'),
		(7, 'Lian Hearn'),
		(8, 'Lian Hearn'),
		(9, 'Lian Hearn'),
		(10, 'Lian Hearn'),
		(11, 'Lian Hearn'),
		(13, 'Timothy Ferris'),
		(12, 'David Guterson'),
		(20, 'Haruki Murakami'),
		(14, 'Dale Carnegie'),
		(21, 'Stephen King')
	;
	SELECT * FROM book_authors;

INSERT INTO library_branch 
		(BranchName, Address)
		VALUES
		('Sharpstown', 'Chicago, IL'),
		('Central', 'Los Angeles, CA'),
		('FVRL', 'Vancouver, WA'),
		('Northwest', 'Seattle, WA')
	;
	SELECT * FROM library_branch;

INSERT INTO book_copies
		(BookID, BranchID, No_Of_Copies)
		VALUES
		(1, 1, 2),
		(1, 3, 2),
		(2, 1, 3),
		(2, 3, 3),
		(3, 1, 4),
		(3, 3, 4),
		(4, 1, 5),
		(4, 3, 5),
		(5, 1, 6),
		(5, 3, 6),
		(6, 1, 2),
		(6, 3, 2),
		(7, 1, 3),
		(7, 3, 3),
		(8, 1, 4),
		(8, 3, 4),
		(9, 1, 5),
		(9, 3, 5),
		(10, 1, 6),
		(10, 3, 6),
		(11, 2, 2),
		(11, 4, 2),
		(12, 2, 3),
		(12, 4, 3),
		(13, 2, 4),
		(13, 4, 4),
		(14, 2, 5),
		(14, 4, 5),
		(15, 2, 6),
		(15, 4, 6),
		(16, 2, 2),
		(16, 4, 2),
		(17, 2, 3),
		(17, 4, 3),
		(18, 2, 4),
		(18, 4, 4),
		(19, 2, 5),
		(19, 4, 5),
		(20, 2, 6),
		(20, 4, 6),
		(21, 2, 4)
	;
	SELECT * FROM book_copies;

INSERT INTO borrower
		(Name, Address, Phone)
		VALUES
		('Steven', '1738 NE 5th st Chicago, IL 88857', '658-854-4548'),
		('Mary', '654 S 46th ave Seattle, WA 54854', '984-878-4247'),
		('Jeff', '8937 W hotrun ave Seattle, WA 57854', '789-145-3647'),
		('Pickle Rick', '980 SE side st Springfield, IL 65874', '541-695-3187'),
		('Steve', '1657 E 69th ct Westfield, PA 45254', '741-852-9639'),
		('Foxy', '7784 NW Foxhole Dr Somewhere, OR 12365', '789-456-1230'),
		('Jennay', '987 SE yessir st Gettysburg, PA 78965', '752-951-7896'),
		('Forest', '852 W G ez Denver, CO 78541','553-115-2725')
	;
	SELECT * FROM borrower;

INSERT INTO book_loans
		(BookID, BranchID, CardNo, DateOut, DueDate)
		Values
		(1, 1, 1000, '2017-11-25', '2017-12-15'),
		(5, 1, 1010, '2017-11-25', '2017-12-15'),
		(9, 1, 1020, '2017-11-25', '2017-12-15'),
		(7, 1, 1030, '2017-11-25', '2017-12-15'),
		(4, 1, 1040, '2017-11-25', '2017-12-15'),
		(5, 1, 1050, '2017-11-25', '2017-12-15'),
		(8, 1, 1060, '2017-11-25', '2017-12-15'),
		(2, 1, 1070, '2017-11-25', '2017-12-15'),
		(3, 1, 1000, '2017-11-25', '2017-12-15'),
		(10, 1, 1010, '2017-11-25', '2017-12-15'),
		(3, 3, 1000, '2017-11-25', '2017-12-15'),
		(6, 3, 1010, '2017-11-25', '2017-12-15'),
		(9, 3, 1020, '2017-11-25', '2017-12-15'),
		(4, 3, 1030, '2017-11-25', '2017-12-15'),
		(7, 3, 1040, '2017-11-25', '2017-12-15'),
		(2, 3, 1050, '2017-11-25', '2017-12-15'),
		(5, 3, 1060, '2017-11-25', '2017-12-15'),
		(1, 3, 1070, '2017-11-25', '2017-12-15'),
		(10, 3, 1000, '2017-11-25', '2017-12-15'),
		(8, 3, 1010, '2017-11-25', '2017-12-15'),
		(12, 2, 1000, '2017-11-25', '2017-12-15'),
		(11, 2, 1010, '2017-11-25', '2017-12-15'),
		(15, 2, 1020, '2017-11-25', '2017-12-15'),
		(13, 2, 1030, '2017-11-25', '2017-12-15'),
		(18, 2, 1040, '2017-11-25', '2017-12-15'),
		(17, 2, 1050, '2017-11-25', '2017-12-15'),
		(19, 2, 1060, '2017-11-25', '2017-12-15'),
		(20, 2, 1070, '2017-11-25', '2017-12-15'),
		(14, 2, 1000, '2017-11-25', '2017-12-15'),
		(16, 2, 1010, '2017-11-25', '2017-12-15'),
		(12, 4, 1000, '2017-11-25', '2017-12-15'),
		(11, 4, 1010, '2017-11-25', '2017-12-15'),
		(15, 4, 1020, '2017-11-25', '2017-12-15'),
		(13, 4, 1030, '2017-11-25', '2017-12-15'),
		(18, 4, 1040, '2017-11-25', '2017-12-15'),
		(17, 4, 1050, '2017-11-25', '2017-12-15'),
		(19, 4, 1060, '2017-11-25', '2017-12-15'),
		(20, 4, 1070, '2017-11-25', '2017-12-15'),
		(14, 4, 1000, '2017-11-25', '2017-12-15'),
		(16, 4, 1010, '2017-11-25', '2017-12-15'),
		(3, 1, 1000, '2017-11-25', '2017-12-15'),
		(5, 1, 1000, '2017-11-25', '2017-12-15'),
		(8, 1, 1000, '2017-11-25', '2017-12-15'),
		(4, 1, 1000, '2017-11-25', '2017-12-15'),
		(6, 1, 1000, '2017-11-25', '2017-12-15'),
		(15, 4, 1050, '2017-11-25', '2017-12-15'),
		(13, 4, 1050, '2017-11-25', '2017-12-15'),
		(16, 4, 1050, '2017-11-25', '2017-12-15'),
		(18, 4, 1050, '2017-11-25', '2017-12-15'),
		(19, 4, 1050, '2017-11-25', '2017-12-15')
;
	SELECT * FROM book_loans;
END

GO