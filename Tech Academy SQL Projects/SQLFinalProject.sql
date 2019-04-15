CREATE DATABASE db_Library
USE db_Library

/* Names and Addresses are varchar(50), phones are varchar(20) */

CREATE TABLE Library_Branch (
	BranchID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	BranchName varchar(50) NOT NULL,
	BranchAddress varchar(50) NOT NULL
);
INSERT INTO Library_Branch (BranchName, BranchAddress) VALUES
	('Central','666 Undercity Place'),
	('Sharpstown',' 123 Darnassus Court'),
	('Ironforge','1000 Ironforge Lane'),
	('Stormwind','437 South Tradesman Corner'),
	('Orgrimmar','1337 Orgrimmar Boulevard')
;
UPDATE Library_Branch
SET BranchAddress='123 Darnassus Court' WHERE BranchID=2
/* corrected erroneous space in Sharpstown Address */
SELECT * FROM Library_Branch

CREATE TABLE Publisher (
	PublisherName varchar(50) PRIMARY KEY NOT NULL,
	PublisherAddress varchar(50) NOT NULL,
	PublisherPhone varchar(20) NOT NULL
);
INSERT INTO Publisher (PublisherName, PublisherAddress, PublisherPhone) VALUES
	('Elune Publishing','437 Darnassus Way','281-797-8470'),
	('King Thrall Corp','Orgrimmar Castle Room 105','713-412-1184'),
	('Arcane Publishers','111 Seeker''s Sanctum','1-800-SPELLS')
;
SELECT * FROM Publisher

CREATE TABLE Books (
	BookID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	Title varchar(50) NOT NULL,
	PublisherName varchar(50) NOT NULL FOREIGN KEY REFERENCES Publisher(PublisherName)
);
INSERT INTO Books (Title, PublisherName) VALUES
	('The Lost Tribe','Elune Publishing'),
	('Secrets of Dire Maul','Elune Publishing'),
	('Guide to Eastern Kingdoms Flora','Elune Publishing'),
	('How to Bond with your Nightsaber','Elune Publishing'),
	('Moonfire Spam - Is It Worth?','Elune Publishing'),
	('How to Arcane Mage: For Dummies','Arcane Publishers'),
	('Gnomish Tinkering and You','Arcane Publishers'),
	('Goblin Tinkering - Backfiring 101','Arcane Publishers'),
	('Quests of Kalimdor','Arcane Publishers'),
	('Full Battle Logs of Vanndar Stormpike','Arcane Publishers'),
	('The Molten Core','Arcane Publishers'),
	('The Blackwing Lair','Arcane Publishers'),
	('Encyclopedia of The Dragonkin','Arcane Publishers'),
	('How to Read Gud','King Thrall Corp'),
	('An Introduction to Shapeshifting','King Thrall Corp'),
	('Troll Tusks - Evolutionary or Archaic?','King Thrall Corp'),
	('Atlas of Azeroth','King Thrall Corp'),
	('How to War Stomp Effectively','King Thrall Corp'),
	('Frost Shock, Frost Shock, Frost Shock, Win!','King Thrall Corp'),
	('What Can We Do About Bubble Hearthing?','King Thrall Corp')
SELECT * FROM Books

CREATE TABLE Book_Authors (
	BookID INT NOT NULL FOREIGN KEY REFERENCES Books(BookID),
	AuthorName varchar(50) NOT NULL
);
INSERT INTO Book_Authors (BookID, AuthorName) VALUES
	(1,'Stephen King'),
	(2,'Stephen King'),
	(3,'Mirana Starlight'),
	(4,'Mirana Starlight'),
	(5,'Tyrande Whisperwind'),
	(6,'Jaina Proudmoore'),
	(7,'Gelbin Mekkatorque'),
	(8,'Tinkerer Gizlock'),
	(9,'Emissary Fuzzlethorp'),
	(10,'Vanndar Stormpike'),
	(11,'Muradin Bronzebeard'),
	(12,'Muradin Bronzebeard'),
	(13,'Chromie'),
	(14,'Drek''Thar'),
	(15,'Cairne Bloodhoof'),
	(16,'Zul''jin'),
	(17,'Gul''dan'),
	(18,'Cairne Bloodhoof'),
	(19,'Hamuul Runetotem'),
	(20,'Grommash Hellscream')
;
SELECT * FROM Book_Authors

CREATE TABLE Book_Copies (
	BookID INT NOT NULL FOREIGN KEY REFERENCES Books(BookID),
	BranchID INT NOT NULL FOREIGN KEY REFERENCES Library_Branch(BranchID),
	Number_Of_Copies INT NOT NULL
);
INSERT INTO Book_Copies (BookID, BranchID, Number_Of_Copies) VALUES
	(1,1,2),(2,1,5),(3,1,9),(4,1,2),(5,1,3),(6,1,12),(7,1,5),(8,1,5),(9,1,2),(10,1,15),(11,1,3),(12,1,3),(13,1,5),(14,1,3),(15,1,2),(16,1,10),(17,1,8),(18,1,12),(19,1,4),(20,1,8),
	(1,2,4),(2,2,3),(3,2,3),(4,2,5),(5,2,2),(6,2,12),(7,2,5),(8,2,5),(9,2,8),(10,2,3),(11,2,3),(12,2,6),(13,2,7),(14,2,2),(15,2,4),(16,2,2),(17,2,5),(18,2,6),(19,2,5),(20,2,8),
	(1,3,2),(2,3,2),(3,3,6),(4,3,6),(5,3,2),(6,3,5),(7,3,4),(8,3,3),(9,3,3),(10,3,11),(11,3,3),(12,3,2),(13,3,2),(14,3,4),(15,3,7),(16,3,3),(17,3,6),(18,3,2),(19,3,4),(20,3,8),
	(1,4,2),(2,4,3),(3,4,4),(4,4,4),(5,4,3),(6,4,12),(7,4,3),(8,4,15),(9,4,2),(10,4,5),(11,4,5),(12,4,3),(13,4,5),(14,4,6),(15,4,5),(16,4,5),(17,4,8),(18,4,7),(19,4,4),(20,4,8),
	(1,5,2),(2,5,5),(3,5,8),(4,5,2),(5,5,3),(6,5,8),(7,5,5),(8,5,5),(9,5,2),(10,5,15),(11,5,3),(12,5,6),(13,5,5),(14,5,3),(15,5,2),(16,5,6),(17,5,8),(18,5,12),(19,5,6),(20,5,8)
;
SELECT * FROM Book_Copies

CREATE TABLE Book_Loans (
	BookID INT NOT NULL FOREIGN KEY REFERENCES Books(BookID),
	BranchID INT NOT NULL FOREIGN KEY REFERENCES Library_Branch(BranchID),
	CardNo INT NOT NULL FOREIGN KEY REFERENCES Borrower(CardNo),
	DateOut DATE NOT NULL,
	DateDue DATE NOT NULL
);
INSERT INTO Book_Loans (BookID, BranchID, CardNo, DateOut, DateDue) VALUES
	(2,2,1000004,'2019-04-12','2019-04-26'),
	(5,2,1000004,'2019-04-12','2019-04-26'),
	(15,2,1000004,'2019-04-12','2019-04-26'),
	(17,2,1000004,'2019-04-12','2019-04-26'),
	(9,2,1000004,'2019-04-12','2019-04-26'),
	(20,2,1000004,'2019-04-12','2019-04-26'),
	(1,5,1000000,'2019-04-11','2019-04-25'),
	(3,5,1000000,'2019-04-11','2019-04-25'),
	(7,5,1000000,'2019-04-11','2019-04-25'),
	(8,5,1000000,'2019-04-11','2019-04-25'),
	(12,5,1000000,'2019-04-11','2019-04-25'),
	(4,5,1000001,'2019-04-10','2019-04-24'),
	(2,5,1000001,'2019-04-10','2019-04-24'),
	(5,5,1000001,'2019-04-10','2019-04-24'),
	(6,5,1000001,'2019-04-10','2019-04-24'),
	(7,5,1000001,'2019-04-10','2019-04-24'),
	(8,5,1000002,'2019-04-12','2019-04-26'),
	(11,5,1000002,'2019-04-12','2019-04-26'),
	(3,5,1000002,'2019-04-12','2019-04-26'),
	(18,5,1000002,'2019-04-12','2019-04-26'),
	(17,5,1000002,'2019-04-12','2019-04-26'),
	(18,5,1000003,'2019-04-12','2019-04-26'),
	(9,5,1000003,'2019-04-12','2019-04-26'),
	(19,5,1000003,'2019-04-12','2019-04-26'),
	(12,5,1000003,'2019-04-12','2019-04-26'),
	(1,5,1000003,'2019-04-12','2019-04-26'),
	(12,1,1000010,'2019-04-13','2019-04-27'),
	(13,1,1000010,'2019-04-13','2019-04-27'),
	(15,1,1000010,'2019-04-13','2019-04-27'),
	(6,1,1000010,'2019-04-13','2019-04-27'),
	(4,1,1000010,'2019-04-13','2019-04-27'),
	(2,2,1000005,'2019-04-12','2019-04-26'),
	(7,2,1000005,'2019-04-12','2019-04-26'),
	(8,2,1000005,'2019-04-12','2019-04-26'),
	(11,2,1000005,'2019-04-12','2019-04-26'),
	(12,2,1000005,'2019-04-12','2019-04-26'),
	(16,3,1000006,'2019-04-12','2019-04-26'),
	(17,3,1000006,'2019-04-12','2019-04-26'),
	(18,3,1000006,'2019-04-12','2019-04-26'),
	(19,3,1000006,'2019-04-12','2019-04-26'),
	(20,3,1000006,'2019-04-12','2019-04-26'),
	(2,3,1000007,'2019-04-07','2019-04-21'),
	(3,3,1000007,'2019-04-07','2019-04-21'),
	(4,3,1000007,'2019-04-07','2019-04-21'),
	(5,3,1000007,'2019-04-07','2019-04-21'),
	(6,3,1000007,'2019-04-07','2019-04-21'),
	(1,3,1000008,'2019-04-12','2019-04-26'),
	(7,3,1000008,'2019-04-12','2019-04-26'),
	(9,3,1000008,'2019-04-12','2019-04-26'),
	(10,3,1000008,'2019-04-12','2019-04-26'),
	(17,3,1000008,'2019-04-12','2019-04-26'),
	(2,4,1000009,'2019-04-12','2019-04-19'),
	(5,4,1000009,'2019-04-12','2019-04-19'),
	(14,4,1000009,'2019-04-12','2019-04-19'),
	(18,4,1000009,'2019-04-12','2019-04-19'),
	(20,4,1000009,'2019-04-12','2019-04-19')
;
UPDATE Book_Loans
SET BranchID = 2 WHERE CardNo = 1000001
UPDATE Book_Loans
SET DateDue = '2019-04-15' WHERE CardNo = 1000009
UPDATE Book_Loans
SET BranchID = 2 WHERE CardNo = 1000009;
INSERT INTO Book_Loans (BookID, BranchID, CardNo, DateOut, DateDue) VALUES
	(1,4,1000009,'2019-04-12','2019-04-19'),
	(3,4,1000009,'2019-04-12','2019-04-19'),
	(4,4,1000009,'2019-04-12','2019-04-19')
;
DELETE FROM Book_Loans WHERE CardNo = 1000007;
DELETE FROM Book_Loans WHERE CardNo = 1000000 AND BookID = 1
/* modifying dataset to meet condition of various queries so something is returned and to make them slightly more interesting */
SELECT * FROM Book_Loans

CREATE TABLE Borrower (
	CardNo INT PRIMARY KEY NOT NULL IDENTITY(1000000,1),
	BorrowerName varchar(50) NOT NULL,
	BorrowerAddress varchar(50) NOT NULL,
	BorrowerEmail varchar(50) NOT NULL
);
INSERT INTO Borrower (BorrowerName, BorrowerAddress, BorrowerEmail) VALUES
	('Zugzug','Razorhill Unit 11','zugzug@orgrimmar.com'),
	('Mukthor','Thunder Ridge Blvd #15','mukthor@orgrimmar.com'),
	('Thragtusk','17 Kolkar Crag Coast','thraggy@orgrimmar.com'),
	('Grogg','Razorhill Unit 5','grogg@orgrimmar.com'),
	('Stella Moonbeam','Rut''Theran Village #19','stella@darn.com'),
	('Liliana Farsight','1710 Wellspring Lake','lily@darn.com'),
	('Fizzle Cogwhistle','103 Kharanos Way','fizzle@forge.com'),
	('Sprackle Sprinklesprocket','101 Kharanos Way','sprackle@forge.com'),
	('Beardy McBeardface','111 Shimmer Ridge','beardy@forge.com'),
	('Scuzzies Weeblewobble','1555 Stormwind Blvd','scuzz@storm.com'),
	('Plagueous Deathbringer','904 Undercity Caves #15','plague@under.com')
;
SELECT * FROM Borrower

CREATE PROCEDURE dbo.uspTribeSharp
AS
	SELECT Books.BookID, Books.Title, Library_Branch.BranchName, Book_Copies.Number_Of_Copies
		FROM Book_Copies
		INNER JOIN Books ON Books.BookID = Book_Copies.BookID
		INNER JOIN Library_Branch ON Library_Branch.BranchID = Book_Copies.BranchID
		WHERE Books.Title = 'The Lost Tribe'
		AND Library_Branch.BranchName = 'Sharpstown'
	;
GO

CREATE PROCEDURE dbo.uspTribeCopies
AS
	SELECT Books.BookID, Books.Title, Library_Branch.BranchName, Book_Copies.Number_Of_Copies
		FROM Book_Copies
		INNER JOIN Books ON Books.BookID = Book_Copies.BookID
		INNER JOIN Library_Branch ON Library_Branch.BranchID = Book_Copies.BranchID
		WHERE Books.Title = 'The Lost Tribe'
	;
GO

CREATE PROCEDURE dbo.uspBorrowerNoBooks
AS
	SELECT Borrower.BorrowerName, Borrower.CardNo, Book_Loans.BookID
		FROM Borrower
		LEFT JOIN Book_Loans ON Book_Loans.CardNo = Borrower.CardNo
		WHERE Book_Loans.BookID IS NULL
	;
GO

CREATE PROCEDURE dbo.uspDueTodaySharp
AS	
	SELECT Books.Title, Library_Branch.BranchName, Borrower.BorrowerName, Borrower.BorrowerAddress
		FROM Book_Loans
		INNER JOIN Books ON Books.BookID = Book_Loans.BookID
		INNER JOIN Borrower ON Borrower.CardNo = Book_Loans.CardNo
		INNER JOIN Library_Branch ON Library_Branch.BranchID = Book_Loans.BranchID
		WHERE Library_Branch.BranchName = 'Sharpstown'
		AND Book_Loans.DateDue = '2019-04-15'
	;
GO

CREATE PROCEDURE dbo.uspCheckedOutPerBranch
AS
	SELECT Library_Branch.BranchName, COUNT(Book_Loans.BranchID) AS 'Number of Books Loaned'
		FROM Book_Loans
		INNER JOIN Library_Branch ON Library_Branch.BranchID = Book_Loans.BranchID
		GROUP BY Library_Branch.BranchName
	;
GO

CREATE PROCEDURE dbo.usp5orMoreBooks
AS
	SELECT Borrower.BorrowerName, Borrower.BorrowerAddress, Borrower.CardNo, COUNT(Book_Loans.CardNo) AS 'Number of Books Checked Out'
		FROM Borrower
		INNER JOIN Book_Loans ON Book_Loans.CardNo = Borrower.CardNo
		GROUP BY Borrower.BorrowerName, Borrower.BorrowerAddress, Borrower.Cardno
		HAVING COUNT(Book_Loans.CardNo) >= 5
	;
GO

CREATE PROCEDURE dbo.uspKingCentral
AS
	SELECT Books.Title, Book_Copies.Number_Of_Copies
		FROM Books
		INNER JOIN Book_Authors ON Book_Authors.BookID = Books.BookID
		INNER JOIN Book_Copies ON Book_Copies.BookID = Books.BookID
		WHERE Book_Copies.BranchID = 1 AND Book_Authors.AuthorName = 'Stephen King'
	;
GO