CREATE VIEW TotalBooksByGenre AS
SELECT Genre.GenreName, COUNT(Book.BookID) AS TotalBooks
FROM Genre
JOIN Book ON Genre.GenreID = Book.GenreID
GROUP BY Genre.GenreName;