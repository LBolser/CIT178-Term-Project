/* FINAL PROJECT PROCEDURES  ---#1 & 2---


---#3---

USE myBookshelf;
GO
CREATE PROC spStandAloneBooks
AS
SELECT books.Isbn, books.BookTitle, series.SeriesID, series.SeriesTitle, books.PositionInSeries, series.TotalInSeries
FROM books JOIN series ON books.SeriesID = series.SeriesID
WHERE series.TotalInSeries = 1
ORDER BY books.BookTitle; 

spStandAloneBooks; 


---#4---

USE myBookshelf;
GO
CREATE PROC spBookTitleInfo
	@BookTitleInfo varchar(50) = '%'
AS
BEGIN
	SELECT * FROM books
	WHERE BookTitle LIKE @BookTitleInfo
	ORDER BY BookTitle;
END 

GO
EXEC spBookTitleInfo 'T%'; 


---#5---

USE myBookshelf;
GO
CREATE PROC spSeriesByAuthorLast
	@AuthorLast varchar(50),
	@SeriesByAuthor int OUTPUT
AS
SELECT @SeriesByAuthor = COUNT(DISTINCT SeriesID) 
FROM series JOIN authors ON series.AuthorID = authors.AuthorID
WHERE authors.AuthorLastName = @AuthorLast
GROUP BY authors.AuthorLastName;

GO
DECLARE @SeriesByAuthor int;
EXEC spSeriesByAuthorLast 'Anthony', @SeriesByAuthor OUTPUT
SELECT @SeriesByAuthor AS 'Number of Series by Author' 


---#6---

USE myBookshelf;
GO
CREATE PROC spSeriesLength
	@SeriesName varchar(30) = '%'
AS
DECLARE @SeriesLength int;
SELECT @SeriesLength = series.TotalInSeries
FROM series WHERE SeriesTitle LIKE @SeriesName;

RETURN @SeriesLength; 

GO
DECLARE @SeriesLength varchar(30);
EXEC @SeriesLength = spSeriesLength 'Call%';
PRINT 'Series Length: ' + CONVERT(varchar, @SeriesLength);
*/


/* FINAL PROJECT USER DEFINED FUNCTIONS ---#7--- 

---#8---

USE myBookshelf;
GO
CREATE FUNCTION fnFindIsbn
	(@bookTitle varchar(50))
	RETURNS int
BEGIN
	RETURN (SELECT books.Isbn FROM books WHERE books.BookTitle = @bookTitle);
END

GO
SELECT books.BookTitle, books.Isbn
FROM books
WHERE books.Isbn = dbo.fnFindIsbn('Mute'); 


---#9---

USE myBookshelf;
GO
CREATE FUNCTION fnBookAuthor
	(@BookAuthorLast varchar(50))
	RETURNS table
RETURN
	(SELECT books.Isbn, books.BookTitle, AuthorFirstName, AuthorLastName 
	FROM books JOIN bookauthors ON books.Isbn = bookauthors.Isbn JOIN authors ON bookauthors.AuthorID = authors.AuthorID	WHERE @BookAuthorLast = authors.AuthorLastName); 

SELECT * FROM dbo.fnBookAuthor('Anthony');
SELECT * FROM dbo.fnBookAuthor('Lindskold');
SELECT * FROM dbo.fnBookAuthor('Robinson'); */


/* FINAL PROJECT TRIGGERS ---#10--- 

---#11--- 

CREATE TABLE booksLog(
	Isbn int,
	BookTitle varchar(50),
	ChangeMade varchar(30)
); 


CREATE TRIGGER booksLog_DELETE on books
	AFTER DELETE
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @Isbn int
	DECLARE @BookTitle varchar(50)
	SELECT @Isbn = DELETED.Isbn, 
		@BookTitle = DELETED.BookTitle
	FROM DELETED
	INSERT INTO booksLog
	VALUES(@Isbn, @BookTitle, 'DELETED')
END 

INSERT INTO books(Isbn,BookTitle,PublisherID,SeriesID) VALUES ('0123456789','BookTitle','123','1'); 

DELETE FROM books WHERE Isbn = '0123456789'; 

SELECT * FROM booksLog; 


---#12---

CREATE TRIGGER booksLog_INSERT on books
	AFTER INSERT
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @Isbn int
	DECLARE @BookTitle varchar(50)
	SELECT @Isbn = INSERTED.Isbn, 
		@BookTitle = INSERTED.BookTitle
	FROM INSERTED
	INSERT INTO booksLog
	VALUES(@Isbn, @BookTitle, 'INSERTED')
END 

INSERT INTO books(Isbn,BookTitle,PublisherID,SeriesID) VALUES ('0123456789','BookTitle','123','1'); 

DELETE FROM books WHERE Isbn = '0123456789'; 

SELECT * FROM booksLog; 


---#13---

CREATE TRIGGER booksLog_UPDATE on books
	AFTER UPDATE
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @Isbn int
	DECLARE @BookTitle varchar(50)
	DECLARE @Action varchar(50)
	SELECT @Isbn = INSERTED.Isbn, 
		@BookTitle = INSERTED.BookTitle
	FROM INSERTED
	IF UPDATE(Isbn)
		SET @Action = 'UPDATED Isbn'
	IF UPDATE(BookTitle)
		SET @Action = 'UPDATED BookTitle'
	IF UPDATE(PublisherID)
		SET @Action = 'UPDATED PublisherID'
	IF UPDATE(FirstPublished)
		SET @Action = 'UPDATED FirstPublished'
	IF UPDATE(Genre)
		SET @Action = 'UPDATED Genre'
	IF UPDATE(SeriesID)
		SET @Action = 'UPDATED SeriesID'
	IF UPDATE(PositionInSeries)
		SET @Action = 'UPDATED PositionInSeries'
	INSERT INTO booksLog
	VALUES(@Isbn, @BookTitle, @Action)
END 

INSERT INTO books(Isbn,BookTitle,PublisherID,SeriesID) VALUES ('0123456789','BookTitle','123','1'); 

UPDATE books SET BookTitle='BookTitleTest' WHERE BookTitle='BookTitle';

DELETE FROM books WHERE Isbn = '0123456789'; 

SELECT * FROM booksLog;  */