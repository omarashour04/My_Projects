CREATE VIEW BooksAvailableForBorrowing AS
SELECT Title, Author, Stock
FROM Book
WHERE Stock > 0;