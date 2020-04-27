/*
CREATE DATABASE myBookshelf;

GO
USE myBookshelf;
CREATE TABLE series(
	SeriesID varchar(20) NOT NULL,
	SeriesTitle varchar(30) NOT NULL,
	TotalInSeries int,
	PRIMARY KEY(SeriesID)
);
GO
CREATE TABLE zipcode(
	Zipcode varchar(10) NOT NULL,
	City varchar(30) NOT NULL,
	State varchar(2),
	Country varchar(30) NOT NULL,
	PRIMARY KEY(Zipcode)
);

GO
CREATE TABLE publishers(
	PublisherID varchar(20) NOT NULL,
	PublisherName varchar(30) NOT NULL,
	CompanyAddress varchar(30) NOT NULL,
	Zipcode varchar(10) NOT NULL,
	CompanyWebsite varchar(100),
	PRIMARY KEY(PublisherID)
);

GO
CREATE TABLE distributors(
	DistributerID varchar(20) NOT NULL,
	DistributerName varchar(30) NOT NULL,
	Zipcode varchar(10) NOT NULL,
	DistributerPhone varchar(15) NOT NULL,
	MethodOfDistribution varchar(30),
	DistributerWebsite varchar(100),
	PRIMARY KEY(DistributerID)
);
GO
CREATE TABLE authors(
	AuthorID varchar(20) NOT NULL,
	AuthorFirstName varchar(30) NOT NULL,
	AuthorLastName varchar(30) NOT NULL,
	AuthorAddress varchar(50) NOT NULL,
	Zipcode varchar(10) NOT NULL,
	AuthorPhone varchar(15),
	PRIMARY KEY(AuthorID)
);

GO
CREATE TABLE books(
	Isbn int NOT NULL,
	BookTitle varchar(50) NOT NULL,
	PublisherID varchar(20) NOT NULL,
	FirstPublished date,
	Genre varchar(30),
	SeriesID varchar(20) NOT NULL,
	PositionInSeries int,
	PRIMARY KEY(Isbn)
);

GO
CREATE TABLE bookauthor(
	Isbn int NOT NULL,
	AuthorID varchar(20) NOT NULL,
	PRIMARY KEY(Isbn, AuthorID)
);
*/


