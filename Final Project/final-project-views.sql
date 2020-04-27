/* Final Project Views */

/* VIEW #1 
USE myBookshelf;

-- Updateable View --
GO
CREATE VIEW VI_authors
AS
SELECT AuthorID, AuthorFirstName, AuthorLastName, AuthorAddress, Zipcode, AuthorPhone
FROM authors;
GO 

-- Original Data --
SELECT * FROM authors; 

-- Updating Address --
GO
UPDATE VI_authors
SET AuthorAddress = '2 Flower Way'
WHERE AuthorID = 'tpratchet1';
GO 

-- Displaying New Data --

SELECT * FROM authors; */


/* VIEW #2 

-- Creating View --
GO
CREATE VIEW VI_booksInSeries
AS 
SELECT Isbn, BookTitle, PublisherID, FirstPublished, Genre, books.SeriesID, PositionInSeries, TotalInSeries, SeriesTitle
FROM books JOIN series ON books.SeriesID = series.SeriesID;
GO 

-- Display the View --

SELECT * FROM VI_booksInSeries; */


/* VIEW #3 
-- Creating View --
GO
CREATE VIEW VI_distributors
AS
SELECT DistributorID, DistributorName, Zipcode, DistributorsAddress, DistributorsPhone, DistributionMethod, DistributionWebsite
FROM distributors
WHERE CAST(DistributorID AS int) > 900;
GO

-- Display the View --
SELECT * FROM VI_distributors; */


/* VIEW #4 
-- Creating View --
GO
CREATE VIEW VI_publishers
AS
SELECT PublisherID, PublisherName, CompanyAddress, Zipcode, PublisherPhone, CompanyWebsite
FROM publishers;
GO 

-- Display the View --
SELECT * FROM VI_publishers; */