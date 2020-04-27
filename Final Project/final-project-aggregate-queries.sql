/* AGGREGATE QUERY #1

USE myBookshelf;
SELECT zipcode.City, COUNT(DISTINCT authors.AuthorID) AS [Authors Per City]
FROM authors JOIN zipcode ON authors.Zipcode = zipcode.Zipcode
GROUP BY Zipcode.City
ORDER BY Zipcode.City ASC; */


/* AGGREGATE QUERY #2*

USE myBookshelf;
SELECT MIN(series.TotalInSeries) AS [Minimum in a Series],
	   MAX(series.TotalInSeries) AS [Maximum in a Series],
	   AVG(series.TotalInSeries) AS [Average in a Series]
FROM series; */


/* AGGREGATE QUERY #3

USE myBookshelf;
SELECT COUNT(books.Genre) OVER(PARTITION BY BA.AuthorID ORDER BY BA.AuthorID) AS [Fantasy Books], BA.AuthorID
FROM books JOIN bookauthors AS BA ON books.Isbn = BA.Isbn
GROUP BY BA.AuthorID, books.Genre 
HAVING books.Genre = 'Science Fiction' */


/* AGGREGATE QUERY #4 (After 1hr+ of trying to get my data to work with AVG and SUM, I had to use a different DB for query #4. Please let me know if this is not acceptable and any suggestions using my data. Thank you.) */ /*

USE AP;
SELECT AVG(Invoices.InvoiceTotal) AS [2016 Avg Invoice Amount], 
		SUM(Invoices.InvoiceTotal) AS [2016 Total of All Invoices],
		MIN(Invoices.InvoiceTotal) AS [2016 Minimum Invoice],
		MAX(Invoices.InvoiceTotal) AS [2016 Maximum Invoice],
		COUNT(Invoices.InvoiceTotal) AS [2016 Total Invoices]
FROM Invoices
WHERE PaymentDate > '2016-01-01' AND PaymentDate < '2016-12-31' */