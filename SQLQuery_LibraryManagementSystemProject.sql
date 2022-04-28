--create database
CREATE DATABASE db_Library
USE  db_Library

--Create tables
CREATE TABLE LIBRARY_BRANCH (
	BranchID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	BranchName VARCHAR(255) NOT NULL,
	BranchAddress VARCHAR(255) NOT NULL
);

CREATE TABLE BORROWER (
	CardNo INT NOT NULL PRIMARY KEY,
	BorrowerNAME VARCHAR(255) NOT NULL ,
	BorrowerAddress VARCHAR(255) NOT NULL,
	Phone VARCHAR(50) NOT NULL
);

CREATE TABLE PUBLISHER (
	PublisherName VARCHAR(255) NOT NULL PRIMARY KEY,
	PublisherAddress VARCHAR(255) NOT NULL,
	Phone VARCHAR(50) NOT NULL
);

CREATE TABLE BOOKS (
	BookID INT NOT NULL PRIMARY KEY IDENTITY(1,10),
	Title VARCHAR(255) NOT NULL,
	PublisherName VARCHAR(255) NOT NULL CONSTRAINT fk_PublisherName FOREIGN KEY REFERENCES PUBLISHER(PublisherName) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE BOOK_COPIES (
	Copies_ID INT PRIMARY KEY IDENTITY(100,100),
	BookID INT NOT NULL CONSTRAINT fk_BookID FOREIGN KEY REFERENCES BOOKS(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_BranchID FOREIGN KEY REFERENCES LIBRARY_BRANCH(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	Number_Of_Copies INT NOT NULL
);

CREATE TABLE BOOK_AUTHORS (
	BookID INT NOT NULL PRIMARY KEY CONSTRAINT fk_BookID_1 FOREIGN KEY REFERENCES BOOKS(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	AuthorName VARCHAR(255) NOT NULL
);


CREATE TABLE BOOK_LOANS (
	LoansID INT NOT NULL PRIMARY KEY IDENTITY(1000,2),
	BookID INT NOT NULL CONSTRAINT fk_BookID_2 FOREIGN KEY REFERENCES BOOKS(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_BranchID_2 FOREIGN KEY REFERENCES LIBRARY_BRANCH(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	CardNo INT NOT NULL CONSTRAINT fk_CardNo FOREIGN KEY REFERENCES BORROWER(CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
	DateOut VARCHAR(50),
	DateDue VARCHAR(50)
);


---Populating the tables with Data


INSERT INTO LIBRARY_BRANCH
	(BranchName, BranchAddress)
	VALUES
	('Sharpstown','Alexandria, Virginia, United States'),
	('Advocates','Edinburgh, Scotland'),
	('Playford Library','Adelaide, Australia'),
	('Columbia Public Library','District of Columbia'),
	('Beit Ariela','Tel Aviv, Israel'),
	('EveningHour Library','Hyderabad, India')
;

INSERT INTO BORROWER
	(CardNo, BorrowerNAME, BorrowerAddress, Phone)
	VALUES
	('5018','Liam','777 Brockton Avenue, Abington MA 2351','100-100-100'),
	('5020','Olivia','30 Memorial Drive, Avon MA 2322','100-100-101'),
	('5038','Noah','250 Hartford Avenue, Bellingham MA 2019','100-100-102'),
	('5893','Emma','700 Oak Street, Brockton MA 2301','100-100-103'),
	('6304','Oliver','66-4 Parkhurst Rd, Chelmsford MA 1824','100-100-104'),
	('6759','Ava','591 Memorial Dr, Chicopee MA 1020','100-100-106'),
	('6761','Elijah','55 Brooksby Village Way, Danvers MA 1923','100-100-105'),
	('6762','Charlotte','137 Teaticket Hwy, East Falmouth MA 2536','100-100-108')
;

INSERT INTO PUBLISHER 
	(PublisherName, PublisherAddress, Phone)
	VALUES
	('A. C. McClurg','42 Fairhaven Commons Way, Fairhaven MA 2719','200-200-2001'),
	('Arbor House','374 William S Canning Blvd, Fall River MA 2721','200-200-2002'),
	('Blackie and Son','121 Worcester Rd, Framingham MA 1701','200-200-2004'),
	('Booktrope','677 Timpany Blvd, Gardner MA 1440','200-200-2008'),
	('Cisco Press','337 Russell St, Hadley MA 1035','200-200-2009'),
	('CRC Press','295 Plymouth Street, Halifax MA 2338','200-200-2010'),
	('DK','1775 Washington St, Hanover MA 2339','200-200-2011'),
	('Dover Publications','280 Washington Street, Hudson MA 1749','200-200-2301'),
	('Europa Press','20 Soojian Dr, Leicester MA 1524','200-200-2401'),
	('Free Press','11 Jungle Road, Leominster MA 1453','200-200-2051')
;

INSERT INTO BOOKS
	(Title, PublisherName)
	VALUES
	('The Lost Tribe','A. C. McClurg'),
	('Pride and Prejudice ','Arbor House'),
	('To Kill a Mockingbird','Blackie and Son'),
	('The Great Gatsby','Booktrope'),
	('One Hundred Years of Solitude','Cisco Press'),
	('In Cold Blood','CRC Press'),
	('Wide Sargasso Sea','DK'),
	('Brave New World','Dover Publications'),
	('Jane Eyre','Europa Press'),
	('Crime and Punishment','Free Press'),
	('The Secret History','DK'),
	('The Call of the Wild','Europa Press'),
	('The Chrysalids','DK'),
	('Persuasion','Europa Press'),
	('Moby-Dick','Arbor House'),
	('The Lion','Cisco Press'),
	('To the Lighthouse','Arbor House'),
	('The Death of the Heart','Cisco Press'),
	('Tess of the Urbervilles','Booktrope'),
	('Frankenstein','Arbor House')
;

INSERT INTO BOOK_AUTHORS
	(BookID, AuthorName)
	VALUES
	('1','Constantin -this is me :)'),
	('21','Jane Austen'),
	('31','Harper Lee'),
	('41','Scott Fitzgerald'),
	('51','Gabriel García Márquez'),
	('61','Truman Capote'),
	('71','Jean Rhys'),
	('81','Aldous Huxley'),
	('91','John Wyndham' ),
	('111','Fyodor Dostoevsky')
;

INSERT INTO BOOK_COPIES
	(BookID, BranchID, Number_Of_Copies )
	VALUES 
	('1','1','3'),
	('11','2','4'),
	('21','3','6'),
	('31','4','21'),
	('41','5','14'),
	('1','3','6'),
	('1','6','21'),
	('11','3','4'),
	('21','4','6'),
	('31','5','21'),
	('41','6','14'),
	('51','6','12'),
	('61','1','2'),
	('71','2','4'),
	('81','3','8'),
	('91','4','3'),
	('101','5','8'),
	('111','6','12'),
	('121','1','15'),
	('131','2','3'),
	('141','3','12'),
	('151','4','14'),
	('161','5','19'),
	('171','6','17'),
	('181','1','4'),
	('191','2','9')
;

INSERT INTO BOOK_LOANS
	(BookID, BranchID, CardNo, DateOut, DateDue)
	VALUES
	('1','1','5018','12 Jan 22','12 May 22'),
	('31','4','5018','15 Mar 22','15 July 22'),
	('1','1','5020','12 Jan 22','12 May 22'),
	('81','3','5038','21 Feb 22','21 June 22'),
	('1','1','5893','1 Feb 22','1 June 22'),
	('111','6','6304','3 Mar 22','3 July 22'),
	('141','3','6759','6 Mar 22','6 July 22'),
	('161','5','6304','12 Dec 21','12 April 22'),
	('191','2','6304','18 Feb 22','18 June 22'),
	('31','4','6759','16 Mar 22','16 July 22')
;
--returns the combined data for the books that are currently borrowed
SELECT * FROM 
	((BOOK_LOANS FULL OUTER JOIN BORROWER ON BOOK_LOANS.CardNo = BORROWER.CardNo) INNER JOIN BOOKS ON BOOK_LOANS.BookID = BOOKS.BookID);

--returns the combined data for all the books in the database sorted ASC by BOOKS.BookID coulmn
SELECT * FROM 
	((BOOK_LOANS FULL OUTER JOIN BORROWER ON BOOK_LOANS.CardNo = BORROWER.CardNo) FULL OUTER JOIN BOOKS ON BOOK_LOANS.BookID = BOOKS.BookID)
	ORDER BY BOOKS.BookID;

--query that returns all book titles and the authors name.
SELECT BOOKS.Title, a.AuthorName
FROM BOOKS
INNER JOIN BOOK_AUTHORS a ON a.BookID = BOOKS.BookID


--CREATING THE STORED PROCEDURES
--A.How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"?
CREATE PROC No_Of_Copies
@BookTitle VARCHAR(50),
@BranchName VARCHAR(50)
AS
 BEGIN
	SELECT 
	x.Title, 
	b.BranchName, 
	a.Number_Of_Copies
	FROM BOOKS AS x
	INNER JOIN BOOK_COPIES AS a ON a.BookID = x.BookID
	INNER JOIN LIBRARY_BRANCH AS b ON b.BranchID = a.BranchID
	WHERE x.Title = @BookTitle AND b.BranchName = @BranchName
	;
 END
 --A. PROC CALL
EXEC [dbo].[No_Of_Copies] 'The Lost Tribe' , 'Sharpstown'


--B.How many copies of the book titled "The Lost Tribe" are owned by each library branch?
CREATE PROC How_Many_CopiesOF
@BookTitle VARCHAR(50)
AS
BEGIN
	SELECT BOOK_COPIES.Number_Of_Copies ,LIBRARY_BRANCH.BranchName
	FROM BOOK_COPIES 
	INNER JOIN BOOKS ON BOOKS.BookID = BOOK_COPIES.BookID
	INNER JOIN LIBRARY_BRANCH ON LIBRARY_BRANCH.BranchID = BOOK_COPIES.BranchID
	WHERE BOOKS.Title = @BookTitle
	;
END
 --B. PROC CALL
EXEC [dbo].[How_Many_CopiesOF] 'The Lost Tribe'


--C.Retrieve the names of all borrowers who do not have any books checked out.
CREATE PROC Borrowers_Not_Checked_Out
AS
BEGIN
	SELECT BORROWER.BorrowerNAME
	FROM BORROWER
	LEFT JOIN BOOK_LOANS ON BORROWER.CardNo = BOOK_LOANS.CardNo
	WHERE BOOK_LOANS.CardNo IS NULL
	;
END
 --C. PROC CALL
EXEC [dbo].[Borrowers_Not_Checked_Out]



