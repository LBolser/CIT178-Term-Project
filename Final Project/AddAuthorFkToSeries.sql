/* Upating myBookshelf to include AuthorID forein key into series table


USE myBookshelf;
GO
ALTER TABLE series
ADD AuthorID varchar(20) null;
GO
ALTER TABLE series
ADD CONSTRAINT FK_author FOREIGN KEY (AuthorID) REFERENCES authors(AuthorID); 

USE myBookshelf;
SELECT * FROM series; 

UPDATE series
SET authorID = 'panthony1'
WHERE SeriesID = 1; 

UPDATE series
SET authorID = 'panthony1'
WHERE SeriesID = 2; 

UPDATE series
SET authorID = 'tgoodkind1'
WHERE SeriesID = 3; 

UPDATE series
SET authorID = 'mlackey1'
WHERE SeriesID = 4; 

UPDATE series
SET authorID = 'jlindskold1'
WHERE SeriesID = 5; 

UPDATE series
SET authorID = 'srobinson1'
WHERE SeriesID = 6; 

UPDATE series
SET authorID = 'tpratchet1'
WHERE SeriesID = 7; 

USE myBookshelf;
SELECT * FROM series; */